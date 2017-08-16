#include "includes.h"
#include "NRF24L01.h"

uint8 TX_ADDRESS[TX_ADR_WIDTH]  = {0x34,0x43,0x10,0x10,0x01}; // Define a static TX address
uint8 RX_ADDRESS[RX_ADR_WIDTH]  = {0x34,0x43,0x10,0x10,0x01}; // Define a static TX address
uint8 rx_buf[TX_PLOAD_WIDTH];
uint8 tx_buf[TX_PLOAD_WIDTH];
uint8 flag;


#define KEY 0xaa

#define CE_set              gpio_init(PORTA , 12, 1, 1)
#define CE_clr              gpio_init(PORTA , 12, 1, 0)
#define CSN_set             gpio_init(PORTE , 2, 1, 1)
#define CSN_clr             gpio_init(PORTE , 2, 1, 0)
#define SCK_set             gpio_init(PORTA , 13, 1, 1)
#define SCK_clr             gpio_init(PORTA , 13, 1, 0)
#define MOSI_set            gpio_init(PORTE , 1, 1, 1)
#define MOSI_clr            gpio_init(PORTE , 1, 1, 0)

void init_nrf24l01_io(void)
{
  //NRF24L01≥ı ºªØ
  gpio_init(PORTA , 12, 1, 0);//CE
  gpio_init(PORTE , 2, 1, 1);//CSN
  gpio_init(PORTA , 13, 1, 0);//SCK
  gpio_init(PORTE , 1, 1, 0);//MOSI
  gpio_init(PORTB , 10, 0, 0);//MISO
  gpio_init(PORTE , 0, 0, 1);//IRQ
}

uint8 SPI_RW(uint8 byte)
{
  int bit_ctr;
  
  for(bit_ctr=0;bit_ctr<8;bit_ctr++)  
  {
    gpio_ctrl(PORTE,1,(byte & 0x80)>>7);//MOSI = (byte & 0x80);        
    byte = (byte << 1);           
    SCK_set;                      
    byte |= gpio_read(PORTB,10);//byte |= MISO;    		  
    SCK_clr;            		 
  }
  
  return(byte);           		  
}

uint8 SPI_RW_Reg(uint8 reg, uint8 value)
{
  uint8 status;
  
  CSN_clr;                   // CSN low, init SPI transaction
  status = SPI_RW(reg);      // select register
  SPI_RW(value);             // ..and write value to it..
  CSN_set;                   // CSN high again
  
  return(status);            // return nRF24L01 status byte
}

uint8 SPI_Read(uint8 reg)
{
  uint8 reg_val;
  
  CSN_clr;                // CSN low, initialize SPI communication...
  SPI_RW(reg);            // Select register to read from..
  reg_val = SPI_RW(0);    // ..then read registervalue
  CSN_set;               // CSN high, terminate SPI communication
  
  return(reg_val);        // return register value
}

uint8 SPI_Read_Buf(uint8 reg, uint8 *pBuf, uint8 bytes)
{
  uint8 status,byte_ctr;
  
  CSN_clr;                    		// Set CSN low, init SPI tranaction
  status = SPI_RW(reg);       		// Select register to write to and read status byte
  for(byte_ctr=0;byte_ctr<bytes;byte_ctr++)
    pBuf[byte_ctr] = SPI_RW(0);          // Perform SPI_RW to read byte from nRF24L01
  CSN_set;                           // Set CSN high again

  return(status);                    // return nRF24L01 status byte
}

uint8 SPI_Write_Buf(uint8 reg, uint8 *pBuf, uint8 bytes)
{
  uint8 status,byte_ctr;
  
  CSN_clr;                  
  status = SPI_RW(reg);    
  for(byte_ctr=0; byte_ctr<bytes; byte_ctr++) 
    SPI_RW(*pBuf++);
  CSN_set;  
  
  return(status);          
}

void power_off()
{
  CE_clr;
  SPI_RW_Reg(WRITE_REG + CONFIG, 0x0D); 
  CE_set;
  Delay_us(20);
}

void ifnnrf_rx_mode(void)
{
  power_off();
  
  CE_clr;
  SPI_Write_Buf(WRITE_REG + RX_ADDR_P0, TX_ADDRESS, TX_ADR_WIDTH); // Use the same address on the RX device as the TX device
  
  SPI_RW_Reg(WRITE_REG + EN_AA, 0x01);      // Enable Auto.Ack:Pipe0
  SPI_RW_Reg(WRITE_REG + EN_RXADDR, 0x01);  // Enable Pipe0
  SPI_RW_Reg(WRITE_REG + RF_CH, 40);        // Select RF channel 40
  SPI_RW_Reg(WRITE_REG + RX_PW_P0, TX_PLOAD_WIDTH); // Select same RX payload width as TX Payload width
  SPI_RW_Reg(WRITE_REG + RF_SETUP, 0x0f);   // TX_PWR:0dBm, Datarate:2Mbps, LNA:HCURR
  SPI_RW_Reg(WRITE_REG + CONFIG, 0x0f);     // Set PWR_UP bit, enable CRC(2 bytes) & Prim:RX. RX_DR enabled..
  CE_clr; // Set CE pin high to enable RX device

  //  This device is now ready to receive one packet of 16 bytes payload from a TX device sending to address
  //  '3443101001', with auto acknowledgment, retransmit count of 10, RF channel 40 and datarate = 2Mbps.
}

void ifnnrf_tx_mode(void)
{
  power_off();
  CE_clr;
  SPI_Write_Buf(WRITE_REG + TX_ADDR, TX_ADDRESS, TX_ADR_WIDTH);    // Writes TX_Address to nRF24L01
  SPI_Write_Buf(WRITE_REG + RX_ADDR_P0, TX_ADDRESS, TX_ADR_WIDTH); // RX_Addr0 same as TX_Adr for Auto.Ack
  SPI_Write_Buf(WR_TX_PLOAD, tx_buf, TX_PLOAD_WIDTH); // Writes data to TX payload

  SPI_RW_Reg(WRITE_REG + EN_AA, 0x01);      // Enable Auto.Ack:Pipe0
  SPI_RW_Reg(WRITE_REG + EN_RXADDR, 0x01);  // Enable Pipe0
  SPI_RW_Reg(WRITE_REG + SETUP_RETR, 0x1a); // 500us + 86us, 10 retrans...
  SPI_RW_Reg(WRITE_REG + RF_CH, 40);        // Select RF channel 40
  SPI_RW_Reg(WRITE_REG + RF_SETUP, 0x07);   // TX_PWR:0dBm, Datarate:2Mbps, LNA:HCURR
  SPI_RW_Reg(WRITE_REG + CONFIG, 0x0e);     // Set PWR_UP bit, enable CRC(2 bytes) & Prim:TX. MAX_RT & TX_DS enabled..
  CE_set;
}

void SPI_CLR_Reg(uint8 R_T)
{
  CSN_clr; 
  if(R_T==1)               
  SPI_RW(FLUSH_TX);            
  else
  SPI_RW(FLUSH_RX);            
  CSN_set;                   
}

void ifnnrf_CLERN_ALL()
{
  SPI_CLR_Reg(0);
  SPI_CLR_Reg(1);
  SPI_RW_Reg(WRITE_REG+STATUS,0xff);
  gpio_init(PORTD , 5, 0, 1);//IRQ=1;
}

uint8 NRF24L01_Check()
{
  uint8 buf[5]={0XA5,0XA5,0XA5,0XA5,0XA5};
  uint8 i;
  //SPI2_SetSpeed(SPI_BaudRatePrescaler_4);   	 
  SPI_Write_Buf(WRITE_REG+TX_ADDR,buf,5);
  SPI_Read_Buf(TX_ADDR,buf,5); 
  for(i=0;i<5;i++)
    if(buf[i]!=0XA5) break;	 							   
  if(i!=5)return 1;	
  return 0;		 
}

uint8 NRF24L01_RxPacket(uint8 *rxbuf)
{
  uint8 sta;		    							   
  //SPI2_SetSpeed(SPI_BaudRatePrescaler_8);    
  sta=SPI_Read(STATUS);      	 
  SPI_RW_Reg(WRITE_REG+STATUS,sta); 
  if(sta&RX_OK)
  {
    SPI_Read_Buf(RD_RX_PLOAD,rxbuf,RX_PLOAD_WIDTH);
    SPI_RW_Reg(FLUSH_RX,0xff); 
    return 0; 
  }	
  return 1;
}	

void NRF24L01_RX_Mode(void)
{
  CE_clr;  
  SPI_Write_Buf(WRITE_REG+RX_ADDR_P0,(uint8*)RX_ADDRESS,RX_ADR_WIDTH);
  
  SPI_RW_Reg(WRITE_REG+EN_AA,0x01);        
  SPI_RW_Reg(WRITE_REG+EN_RXADDR,0x01);  	 
  SPI_RW_Reg(WRITE_REG+RF_CH,40);	    		  
  SPI_RW_Reg(WRITE_REG+RX_PW_P0,RX_PLOAD_WIDTH); 	    
  SPI_RW_Reg(WRITE_REG+RF_SETUP,0x0f);  
  SPI_RW_Reg(WRITE_REG+CONFIG, 0x0f);
  CE_set;
}