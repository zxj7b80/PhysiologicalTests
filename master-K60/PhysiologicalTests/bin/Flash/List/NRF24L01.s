///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       08/Apr/2015  15:15:26
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\C\Component_C\NRF24L01.c
//    Command line =  
//        C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\C\Component_C\NRF24L01.c
//        -D IAR -D TWR_K60N512 -lCN
//        C:\Users\Administrator\Desktop\PhysiologicalTests\bin\Flash\List\ -lB
//        C:\Users\Administrator\Desktop\PhysiologicalTests\bin\Flash\List\ -o
//        C:\Users\Administrator\Desktop\PhysiologicalTests\bin\Flash\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M4 -e --fpu=None --dlib_config "D:\MyProgramFiles\iar
//        for arm v7.1\arm\INC\c\DLib_Config_Normal.h" -I
//        C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\H\ -I
//        C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\H\Component_H\
//        -I
//        C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\H\Frame_H\
//        -Ol --use_c++_inline
//    List file    =  
//        C:\Users\Administrator\Desktop\PhysiologicalTests\bin\Flash\List\NRF24L01.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Delay_us
        EXTERN gpio_ctrl
        EXTERN gpio_init
        EXTERN gpio_read

        PUBLIC NRF24L01_Check
        PUBLIC NRF24L01_RX_Mode
        PUBLIC NRF24L01_RxPacket
        PUBLIC RX_ADDRESS
        PUBLIC SPI_CLR_Reg
        PUBLIC SPI_RW
        PUBLIC SPI_RW_Reg
        PUBLIC SPI_Read
        PUBLIC SPI_Read_Buf
        PUBLIC SPI_Write_Buf
        PUBLIC TX_ADDRESS
        PUBLIC flag
        PUBLIC ifnnrf_CLERN_ALL
        PUBLIC ifnnrf_rx_mode
        PUBLIC ifnnrf_tx_mode
        PUBLIC init_nrf24l01_io
        PUBLIC power_off
        PUBLIC rx_buf
        PUBLIC tx_buf

// C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\C\Component_C\NRF24L01.c
//    1 #include "includes.h"
//    2 #include "NRF24L01.h"
//    3 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    4 uint8 TX_ADDRESS[TX_ADR_WIDTH]  = {0x34,0x43,0x10,0x10,0x01}; // Define a static TX address
TX_ADDRESS:
        DATA
        DC8 52, 67, 16, 16, 1, 0, 0, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    5 uint8 RX_ADDRESS[RX_ADR_WIDTH]  = {0x34,0x43,0x10,0x10,0x01}; // Define a static TX address
RX_ADDRESS:
        DATA
        DC8 52, 67, 16, 16, 1, 0, 0, 0

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    6 uint8 rx_buf[TX_PLOAD_WIDTH];
rx_buf:
        DS8 32

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    7 uint8 tx_buf[TX_PLOAD_WIDTH];
tx_buf:
        DS8 32

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    8 uint8 flag;
flag:
        DS8 1
//    9 
//   10 
//   11 #define KEY 0xaa
//   12 
//   13 #define CE_set              gpio_init(PORTA , 12, 1, 1)
//   14 #define CE_clr              gpio_init(PORTA , 12, 1, 0)
//   15 #define CSN_set             gpio_init(PORTE , 2, 1, 1)
//   16 #define CSN_clr             gpio_init(PORTE , 2, 1, 0)
//   17 #define SCK_set             gpio_init(PORTA , 13, 1, 1)
//   18 #define SCK_clr             gpio_init(PORTA , 13, 1, 0)
//   19 #define MOSI_set            gpio_init(PORTE , 1, 1, 1)
//   20 #define MOSI_clr            gpio_init(PORTE , 1, 1, 0)
//   21 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   22 void init_nrf24l01_io(void)
//   23 {
init_nrf24l01_io:
        PUSH     {R7,LR}
//   24   //NRF24L01≥ı ºªØ
//   25   gpio_init(PORTA , 12, 1, 0);//CE
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+12
        LDR.W    R0,??DataTable12  ;; 0x400ff000
        BL       gpio_init
//   26   gpio_init(PORTE , 2, 1, 1);//CSN
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+2
        LDR.W    R0,??DataTable12_1  ;; 0x400ff100
        BL       gpio_init
//   27   gpio_init(PORTA , 13, 1, 0);//SCK
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+13
        LDR.W    R0,??DataTable12  ;; 0x400ff000
        BL       gpio_init
//   28   gpio_init(PORTE , 1, 1, 0);//MOSI
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+1
        LDR.N    R0,??DataTable12_1  ;; 0x400ff100
        BL       gpio_init
//   29   gpio_init(PORTB , 10, 0, 0);//MISO
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+10
        LDR.N    R0,??DataTable12_2  ;; 0x400ff040
        BL       gpio_init
//   30   gpio_init(PORTE , 0, 0, 1);//IRQ
        MOVS     R3,#+1
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable12_1  ;; 0x400ff100
        BL       gpio_init
//   31 }
        POP      {R0,PC}          ;; return
//   32 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   33 uint8 SPI_RW(uint8 byte)
//   34 {
SPI_RW:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//   35   int bit_ctr;
//   36   
//   37   for(bit_ctr=0;bit_ctr<8;bit_ctr++)  
        MOVS     R5,#+0
        B.N      ??SPI_RW_0
//   38   {
//   39     gpio_ctrl(PORTE,1,(byte & 0x80)>>7);//MOSI = (byte & 0x80);        
??SPI_RW_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSRS     R2,R4,#+7
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+1
        LDR.N    R0,??DataTable12_1  ;; 0x400ff100
        BL       gpio_ctrl
//   40     byte = (byte << 1);           
        LSLS     R4,R4,#+1
//   41     SCK_set;                      
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+13
        LDR.N    R0,??DataTable12  ;; 0x400ff000
        BL       gpio_init
//   42     byte |= gpio_read(PORTB,10);//byte |= MISO;    		  
        MOVS     R1,#+10
        LDR.N    R0,??DataTable12_2  ;; 0x400ff040
        BL       gpio_read
        ORRS     R4,R0,R4
//   43     SCK_clr;            		 
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+13
        LDR.N    R0,??DataTable12  ;; 0x400ff000
        BL       gpio_init
//   44   }
        ADDS     R5,R5,#+1
??SPI_RW_0:
        CMP      R5,#+8
        BLT.N    ??SPI_RW_1
//   45   
//   46   return(byte);           		  
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
//   47 }
//   48 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   49 uint8 SPI_RW_Reg(uint8 reg, uint8 value)
//   50 {
SPI_RW_Reg:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//   51   uint8 status;
//   52   
//   53   CSN_clr;                   // CSN low, init SPI transaction
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+2
        LDR.N    R0,??DataTable12_1  ;; 0x400ff100
        BL       gpio_init
//   54   status = SPI_RW(reg);      // select register
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SPI_RW
        MOVS     R4,R0
//   55   SPI_RW(value);             // ..and write value to it..
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SPI_RW
//   56   CSN_set;                   // CSN high again
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+2
        LDR.N    R0,??DataTable12_1  ;; 0x400ff100
        BL       gpio_init
//   57   
//   58   return(status);            // return nRF24L01 status byte
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
//   59 }
//   60 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   61 uint8 SPI_Read(uint8 reg)
//   62 {
SPI_Read:
        PUSH     {R4,LR}
        MOVS     R4,R0
//   63   uint8 reg_val;
//   64   
//   65   CSN_clr;                // CSN low, initialize SPI communication...
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+2
        LDR.N    R0,??DataTable12_1  ;; 0x400ff100
        BL       gpio_init
//   66   SPI_RW(reg);            // Select register to read from..
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SPI_RW
//   67   reg_val = SPI_RW(0);    // ..then read registervalue
        MOVS     R0,#+0
        BL       SPI_RW
        MOVS     R4,R0
//   68   CSN_set;               // CSN high, terminate SPI communication
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+2
        LDR.N    R0,??DataTable12_1  ;; 0x400ff100
        BL       gpio_init
//   69   
//   70   return(reg_val);        // return register value
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return
//   71 }
//   72 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   73 uint8 SPI_Read_Buf(uint8 reg, uint8 *pBuf, uint8 bytes)
//   74 {
SPI_Read_Buf:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//   75   uint8 status,byte_ctr;
//   76   
//   77   CSN_clr;                    		// Set CSN low, init SPI tranaction
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+2
        LDR.N    R0,??DataTable12_1  ;; 0x400ff100
        BL       gpio_init
//   78   status = SPI_RW(reg);       		// Select register to write to and read status byte
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SPI_RW
        MOVS     R4,R0
//   79   for(byte_ctr=0;byte_ctr<bytes;byte_ctr++)
        MOVS     R7,#+0
        B.N      ??SPI_Read_Buf_0
//   80     pBuf[byte_ctr] = SPI_RW(0);          // Perform SPI_RW to read byte from nRF24L01
??SPI_Read_Buf_1:
        MOVS     R0,#+0
        BL       SPI_RW
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        STRB     R0,[R7, R5]
        ADDS     R7,R7,#+1
??SPI_Read_Buf_0:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R7,R6
        BCC.N    ??SPI_Read_Buf_1
//   81   CSN_set;                           // Set CSN high again
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+2
        LDR.N    R0,??DataTable12_1  ;; 0x400ff100
        BL       gpio_init
//   82 
//   83   return(status);                    // return nRF24L01 status byte
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return
//   84 }
//   85 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   86 uint8 SPI_Write_Buf(uint8 reg, uint8 *pBuf, uint8 bytes)
//   87 {
SPI_Write_Buf:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//   88   uint8 status,byte_ctr;
//   89   
//   90   CSN_clr;                  
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+2
        LDR.N    R0,??DataTable12_1  ;; 0x400ff100
        BL       gpio_init
//   91   status = SPI_RW(reg);    
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SPI_RW
        MOVS     R4,R0
//   92   for(byte_ctr=0; byte_ctr<bytes; byte_ctr++) 
        MOVS     R7,#+0
        B.N      ??SPI_Write_Buf_0
//   93     SPI_RW(*pBuf++);
??SPI_Write_Buf_1:
        LDRB     R0,[R5, #+0]
        BL       SPI_RW
        ADDS     R5,R5,#+1
        ADDS     R7,R7,#+1
??SPI_Write_Buf_0:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R7,R6
        BCC.N    ??SPI_Write_Buf_1
//   94   CSN_set;  
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+2
        LDR.N    R0,??DataTable12_1  ;; 0x400ff100
        BL       gpio_init
//   95   
//   96   return(status);          
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return
//   97 }
//   98 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   99 void power_off()
//  100 {
power_off:
        PUSH     {R7,LR}
//  101   CE_clr;
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+12
        LDR.N    R0,??DataTable12  ;; 0x400ff000
        BL       gpio_init
//  102   SPI_RW_Reg(WRITE_REG + CONFIG, 0x0D); 
        MOVS     R1,#+13
        MOVS     R0,#+32
        BL       SPI_RW_Reg
//  103   CE_set;
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+12
        LDR.N    R0,??DataTable12  ;; 0x400ff000
        BL       gpio_init
//  104   Delay_us(20);
        MOVS     R0,#+20
        BL       Delay_us
//  105 }
        POP      {R0,PC}          ;; return
//  106 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  107 void ifnnrf_rx_mode(void)
//  108 {
ifnnrf_rx_mode:
        PUSH     {R7,LR}
//  109   power_off();
        BL       power_off
//  110   
//  111   CE_clr;
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+12
        LDR.N    R0,??DataTable12  ;; 0x400ff000
        BL       gpio_init
//  112   SPI_Write_Buf(WRITE_REG + RX_ADDR_P0, TX_ADDRESS, TX_ADR_WIDTH); // Use the same address on the RX device as the TX device
        MOVS     R2,#+5
        LDR.N    R1,??DataTable12_3
        MOVS     R0,#+42
        BL       SPI_Write_Buf
//  113   
//  114   SPI_RW_Reg(WRITE_REG + EN_AA, 0x01);      // Enable Auto.Ack:Pipe0
        MOVS     R1,#+1
        MOVS     R0,#+33
        BL       SPI_RW_Reg
//  115   SPI_RW_Reg(WRITE_REG + EN_RXADDR, 0x01);  // Enable Pipe0
        MOVS     R1,#+1
        MOVS     R0,#+34
        BL       SPI_RW_Reg
//  116   SPI_RW_Reg(WRITE_REG + RF_CH, 40);        // Select RF channel 40
        MOVS     R1,#+40
        MOVS     R0,#+37
        BL       SPI_RW_Reg
//  117   SPI_RW_Reg(WRITE_REG + RX_PW_P0, TX_PLOAD_WIDTH); // Select same RX payload width as TX Payload width
        MOVS     R1,#+32
        MOVS     R0,#+49
        BL       SPI_RW_Reg
//  118   SPI_RW_Reg(WRITE_REG + RF_SETUP, 0x0f);   // TX_PWR:0dBm, Datarate:2Mbps, LNA:HCURR
        MOVS     R1,#+15
        MOVS     R0,#+38
        BL       SPI_RW_Reg
//  119   SPI_RW_Reg(WRITE_REG + CONFIG, 0x0f);     // Set PWR_UP bit, enable CRC(2 bytes) & Prim:RX. RX_DR enabled..
        MOVS     R1,#+15
        MOVS     R0,#+32
        BL       SPI_RW_Reg
//  120   CE_clr; // Set CE pin high to enable RX device
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+12
        LDR.N    R0,??DataTable12  ;; 0x400ff000
        BL       gpio_init
//  121 
//  122   //  This device is now ready to receive one packet of 16 bytes payload from a TX device sending to address
//  123   //  '3443101001', with auto acknowledgment, retransmit count of 10, RF channel 40 and datarate = 2Mbps.
//  124 }
        POP      {R0,PC}          ;; return
//  125 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  126 void ifnnrf_tx_mode(void)
//  127 {
ifnnrf_tx_mode:
        PUSH     {R7,LR}
//  128   power_off();
        BL       power_off
//  129   CE_clr;
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+12
        LDR.N    R0,??DataTable12  ;; 0x400ff000
        BL       gpio_init
//  130   SPI_Write_Buf(WRITE_REG + TX_ADDR, TX_ADDRESS, TX_ADR_WIDTH);    // Writes TX_Address to nRF24L01
        MOVS     R2,#+5
        LDR.N    R1,??DataTable12_3
        MOVS     R0,#+48
        BL       SPI_Write_Buf
//  131   SPI_Write_Buf(WRITE_REG + RX_ADDR_P0, TX_ADDRESS, TX_ADR_WIDTH); // RX_Addr0 same as TX_Adr for Auto.Ack
        MOVS     R2,#+5
        LDR.N    R1,??DataTable12_3
        MOVS     R0,#+42
        BL       SPI_Write_Buf
//  132   SPI_Write_Buf(WR_TX_PLOAD, tx_buf, TX_PLOAD_WIDTH); // Writes data to TX payload
        MOVS     R2,#+32
        LDR.N    R1,??DataTable12_4
        MOVS     R0,#+160
        BL       SPI_Write_Buf
//  133 
//  134   SPI_RW_Reg(WRITE_REG + EN_AA, 0x01);      // Enable Auto.Ack:Pipe0
        MOVS     R1,#+1
        MOVS     R0,#+33
        BL       SPI_RW_Reg
//  135   SPI_RW_Reg(WRITE_REG + EN_RXADDR, 0x01);  // Enable Pipe0
        MOVS     R1,#+1
        MOVS     R0,#+34
        BL       SPI_RW_Reg
//  136   SPI_RW_Reg(WRITE_REG + SETUP_RETR, 0x1a); // 500us + 86us, 10 retrans...
        MOVS     R1,#+26
        MOVS     R0,#+36
        BL       SPI_RW_Reg
//  137   SPI_RW_Reg(WRITE_REG + RF_CH, 40);        // Select RF channel 40
        MOVS     R1,#+40
        MOVS     R0,#+37
        BL       SPI_RW_Reg
//  138   SPI_RW_Reg(WRITE_REG + RF_SETUP, 0x07);   // TX_PWR:0dBm, Datarate:2Mbps, LNA:HCURR
        MOVS     R1,#+7
        MOVS     R0,#+38
        BL       SPI_RW_Reg
//  139   SPI_RW_Reg(WRITE_REG + CONFIG, 0x0e);     // Set PWR_UP bit, enable CRC(2 bytes) & Prim:TX. MAX_RT & TX_DS enabled..
        MOVS     R1,#+14
        MOVS     R0,#+32
        BL       SPI_RW_Reg
//  140   CE_set;
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+12
        LDR.N    R0,??DataTable12  ;; 0x400ff000
        BL       gpio_init
//  141 }
        POP      {R0,PC}          ;; return
//  142 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  143 void SPI_CLR_Reg(uint8 R_T)
//  144 {
SPI_CLR_Reg:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  145   CSN_clr; 
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+2
        LDR.N    R0,??DataTable12_1  ;; 0x400ff100
        BL       gpio_init
//  146   if(R_T==1)               
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BNE.N    ??SPI_CLR_Reg_0
//  147   SPI_RW(FLUSH_TX);            
        MOVS     R0,#+225
        BL       SPI_RW
        B.N      ??SPI_CLR_Reg_1
//  148   else
//  149   SPI_RW(FLUSH_RX);            
??SPI_CLR_Reg_0:
        MOVS     R0,#+226
        BL       SPI_RW
//  150   CSN_set;                   
??SPI_CLR_Reg_1:
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+2
        LDR.N    R0,??DataTable12_1  ;; 0x400ff100
        BL       gpio_init
//  151 }
        POP      {R4,PC}          ;; return
//  152 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  153 void ifnnrf_CLERN_ALL()
//  154 {
ifnnrf_CLERN_ALL:
        PUSH     {R7,LR}
//  155   SPI_CLR_Reg(0);
        MOVS     R0,#+0
        BL       SPI_CLR_Reg
//  156   SPI_CLR_Reg(1);
        MOVS     R0,#+1
        BL       SPI_CLR_Reg
//  157   SPI_RW_Reg(WRITE_REG+STATUS,0xff);
        MOVS     R1,#+255
        MOVS     R0,#+39
        BL       SPI_RW_Reg
//  158   gpio_init(PORTD , 5, 0, 1);//IRQ=1;
        MOVS     R3,#+1
        MOVS     R2,#+0
        MOVS     R1,#+5
        LDR.N    R0,??DataTable12_5  ;; 0x400ff0c0
        BL       gpio_init
//  159 }
        POP      {R0,PC}          ;; return
//  160 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  161 uint8 NRF24L01_Check()
//  162 {
NRF24L01_Check:
        PUSH     {LR}
        SUB      SP,SP,#+12
//  163   uint8 buf[5]={0XA5,0XA5,0XA5,0XA5,0XA5};
        ADD      R0,SP,#+0
        LDR.N    R1,??DataTable12_6
        LDM      R1!,{R2,R3}
        STM      R0!,{R2,R3}
        SUBS     R1,R1,#+8
        SUBS     R0,R0,#+8
//  164   uint8 i;
//  165   //SPI2_SetSpeed(SPI_BaudRatePrescaler_4);   	 
//  166   SPI_Write_Buf(WRITE_REG+TX_ADDR,buf,5);
        MOVS     R2,#+5
        ADD      R1,SP,#+0
        MOVS     R0,#+48
        BL       SPI_Write_Buf
//  167   SPI_Read_Buf(TX_ADDR,buf,5); 
        MOVS     R2,#+5
        ADD      R1,SP,#+0
        MOVS     R0,#+16
        BL       SPI_Read_Buf
//  168   for(i=0;i<5;i++)
        MOVS     R0,#+0
        B.N      ??NRF24L01_Check_0
??NRF24L01_Check_1:
        ADDS     R0,R0,#+1
??NRF24L01_Check_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+5
        BGE.N    ??NRF24L01_Check_2
//  169     if(buf[i]!=0XA5) break;	 							   
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R1,SP,#+0
        LDRB     R1,[R0, R1]
        CMP      R1,#+165
        BEQ.N    ??NRF24L01_Check_1
//  170   if(i!=5)return 1;	
??NRF24L01_Check_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+5
        BEQ.N    ??NRF24L01_Check_3
        MOVS     R0,#+1
        B.N      ??NRF24L01_Check_4
//  171   return 0;		 
??NRF24L01_Check_3:
        MOVS     R0,#+0
??NRF24L01_Check_4:
        POP      {R1-R3,PC}       ;; return
//  172 }
//  173 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  174 uint8 NRF24L01_RxPacket(uint8 *rxbuf)
//  175 {
NRF24L01_RxPacket:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  176   uint8 sta;		    							   
//  177   //SPI2_SetSpeed(SPI_BaudRatePrescaler_8);    
//  178   sta=SPI_Read(STATUS);      	 
        MOVS     R0,#+7
        BL       SPI_Read
        MOVS     R5,R0
//  179   SPI_RW_Reg(WRITE_REG+STATUS,sta); 
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+39
        BL       SPI_RW_Reg
//  180   if(sta&RX_OK)
        LSLS     R0,R5,#+25
        BPL.N    ??NRF24L01_RxPacket_0
//  181   {
//  182     SPI_Read_Buf(RD_RX_PLOAD,rxbuf,RX_PLOAD_WIDTH);
        MOVS     R2,#+10
        MOVS     R1,R4
        MOVS     R0,#+97
        BL       SPI_Read_Buf
//  183     SPI_RW_Reg(FLUSH_RX,0xff); 
        MOVS     R1,#+255
        MOVS     R0,#+226
        BL       SPI_RW_Reg
//  184     return 0; 
        MOVS     R0,#+0
        B.N      ??NRF24L01_RxPacket_1
//  185   }	
//  186   return 1;
??NRF24L01_RxPacket_0:
        MOVS     R0,#+1
??NRF24L01_RxPacket_1:
        POP      {R1,R4,R5,PC}    ;; return
//  187 }	
//  188 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  189 void NRF24L01_RX_Mode(void)
//  190 {
NRF24L01_RX_Mode:
        PUSH     {R7,LR}
//  191   CE_clr;  
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+12
        LDR.N    R0,??DataTable12  ;; 0x400ff000
        BL       gpio_init
//  192   SPI_Write_Buf(WRITE_REG+RX_ADDR_P0,(uint8*)RX_ADDRESS,RX_ADR_WIDTH);
        MOVS     R2,#+5
        LDR.N    R1,??DataTable12_7
        MOVS     R0,#+42
        BL       SPI_Write_Buf
//  193   
//  194   SPI_RW_Reg(WRITE_REG+EN_AA,0x01);        
        MOVS     R1,#+1
        MOVS     R0,#+33
        BL       SPI_RW_Reg
//  195   SPI_RW_Reg(WRITE_REG+EN_RXADDR,0x01);  	 
        MOVS     R1,#+1
        MOVS     R0,#+34
        BL       SPI_RW_Reg
//  196   SPI_RW_Reg(WRITE_REG+RF_CH,40);	    		  
        MOVS     R1,#+40
        MOVS     R0,#+37
        BL       SPI_RW_Reg
//  197   SPI_RW_Reg(WRITE_REG+RX_PW_P0,RX_PLOAD_WIDTH); 	    
        MOVS     R1,#+10
        MOVS     R0,#+49
        BL       SPI_RW_Reg
//  198   SPI_RW_Reg(WRITE_REG+RF_SETUP,0x0f);  
        MOVS     R1,#+15
        MOVS     R0,#+38
        BL       SPI_RW_Reg
//  199   SPI_RW_Reg(WRITE_REG+CONFIG, 0x0f);
        MOVS     R1,#+15
        MOVS     R0,#+32
        BL       SPI_RW_Reg
//  200   CE_set;
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+12
        LDR.N    R0,??DataTable12  ;; 0x400ff000
        BL       gpio_init
//  201 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     0x400ff100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_2:
        DC32     0x400ff040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_3:
        DC32     TX_ADDRESS

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_4:
        DC32     tx_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_5:
        DC32     0x400ff0c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_6:
        DC32     `?<Constant {165, 165, 165, 165, 165}>`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_7:
        DC32     RX_ADDRESS

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant {165, 165, 165, 165, 165}>`:
        DATA
        DC8 165, 165, 165, 165, 165, 0, 0, 0

        END
// 
//  65 bytes in section .bss
//  16 bytes in section .data
//   8 bytes in section .rodata
// 968 bytes in section .text
// 
// 968 bytes of CODE  memory
//   8 bytes of CONST memory
//  81 bytes of DATA  memory
//
//Errors: none
//Warnings: none
