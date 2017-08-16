#include"includes.h"
//#include"MMA8451.h"

uint8   BUF[8];
uint8   CY;

void MMA8452_Start()
{
    SDA_SET();                  
    SCL_SET();                    
    Delay5us();                 
    SDA_CLR();                  
    Delay5us();                 
    SCL_CLR();                    
}

void MMA8452_Stop()
{
    SDA_CLR();                    
    SCL_SET();                    
    Delay5us();                 
    SDA_SET();                    
    Delay5us();                 
}

void MMA8452_SendACK(uint8 ack)
{
    gpio_ctrl(PORTC,6,ack);             
    SCL_SET();                    
    Delay5us();                 
    SCL_CLR();                    
    Delay5us();                
}

uint8 MMA8452_RecvACK()
{
    SCL_SET();                    
    Delay5us();                 
    CY=gpio_read(PORTC,6);               
    SCL_CLR();                  
    Delay5us();                 

    return CY;
}


void MMA8452_SendByte(uint8 dat)
{
    uint8 i;
    uint8 DAT;
    
    DAT=dat;
    
    for (i=0; i<8; i++)         
    {
        dat&=(1<<(7-i));
        if(dat==0) SDA_CLR();
        else SDA_SET();
        
        dat=DAT;
        
        SCL_SET();                
        Delay5us();             
        SCL_CLR();               
        Delay5us();            
    }
    MMA8452_RecvACK();
}


uint8 MMA8452_RecvByte()
{
    uint8 i;
    uint8 dat = 0;

    SDA_SET();                    
    for (i=0; i<8; i++)         
    {
        dat <<= 1;
        SCL_SET();               
        Delay5us();             
        dat |= gpio_read(PORTC,6);                       
        SCL_CLR();               
        Delay5us();             
    }
    return dat;
}

void Single_Write_MMA8452(uint8 REG_Address,uint8 REG_data)
{
    MMA8452_Start();                  
    MMA8452_SendByte(SlaveAddress);  
    MMA8452_SendByte(REG_Address);    
    MMA8452_SendByte(REG_data);      
    MMA8452_Stop();                   
}

void Multiple_Read_MMA8452(void)
{   
    uint8 i;
    MMA8452_Start();                          
    MMA8452_SendByte(SlaveAddress);           
    MMA8452_SendByte(0x01);                   
    MMA8452_Start();                          
    MMA8452_SendByte(SlaveAddress+1);         
    for (i=0; i<6; i++)                       
    {
        BUF[i] = MMA8452_RecvByte();          
        if (i == 5)
        {
          MMA8452_SendACK(1);                
        }
        else
        {
          MMA8452_SendACK(0);                
        }
    }
    MMA8452_Stop();                           
    Delay5us();
    Delay5us();
    Delay5us();
    Delay5us();
}

void Init_MMA8452()
{
   Single_Write_MMA8452(0x2A,0x01);  
   Single_Write_MMA8452(0x2B,0x02);  
}