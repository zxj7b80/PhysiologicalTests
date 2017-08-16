#include "includes.h"
#include "UpMonitor.h"
//----------------------------给CCDView发送图像------------------------//
int16 OutData[4] = { 0 };//虚拟示波器输出
extern  int     OFF_X,OFF_Y,OFF_Z;
        
void SendImageData(uint8 * ImageData)
{
    unsigned char i;
    unsigned char crc = 0;
    /* Send Data */
    uart_send1(UART3,'*');
    uart_send1(UART3,'L');
    uart_send1(UART3,'D');

    SendHex(0);
    SendHex(0);
    SendHex(0);
    SendHex(0);

    for(i=0; i<128; i++)
    {
        SendHex(*ImageData ++);
    }
    SendHex(crc);
    uart_send1(UART3,'#');
}

void SendHex(unsigned char hex)
{
  unsigned char temp;
  temp = hex >> 4;
  if(temp < 10)
  {
   uart_send1(UART3,temp + '0');
  }
  else
  {
   uart_send1(UART3,temp - 10 + 'A');
  }
  temp = hex & 0x0F;
  if(temp < 10)
  {
   uart_send1(UART3,temp + '0');
  }
  else
  {
   uart_send1(UART3,temp - 10 + 'A');
  }
}


/****************************虚拟示波器模块******************************/
void virtual_scope_show(void)
{
      OutData[0]=OFF_Y;
      //OutData[1]=0;
      //OutData[2]=0;
      //OutData[3]=0;
}

void serial_Txd()//传输的一帧数据，包括如下的内容
{
        uint8 temp[10]={0};
        uint8 i,j;
        //帧头数据
        uart_send1 (UART3, 0xa5);
        uart_send1 (UART3, 0x5a);
	
        //第一条曲线的数据
        for(i=0;i<3;i++)
        {
           temp[i*2]=(int)OutData[i]/10;
           temp[i*2+1]=(int)OutData[i]%10;
        }
        
       for(j=0;j<6;j++)
       {
          uart_send1 (UART3, temp[j]);
       }
        delay_ms(10);
}


unsigned short CRC_CHECK(unsigned char *Buf, unsigned char CRC_CNT)
{
    unsigned short CRC_Temp;
    unsigned char i,j;
    CRC_Temp = 0xffff;

    for (i=0;i<CRC_CNT; i++)
    {
        CRC_Temp ^= Buf[i];
        for (j=0;j<8;j++)
        {
            if (CRC_Temp & 0x01)
                CRC_Temp = (CRC_Temp >>1 ) ^ 0xa001;
            else
                CRC_Temp = CRC_Temp >> 1;
        }
    }
    return(CRC_Temp);
}


void OutPut_Data(void)
{
  int temp[4] = {0};
  unsigned int temp1[4] = {0};
  unsigned char databuf[10] = {0};
  unsigned char i;
  unsigned short CRC16 = 0;
  for(i=0;i<4;i++)
  {
    temp[i]  = (int16)OutData[i];
    temp1[i] = (uint16)temp[i];
  }

  for(i=0;i<4;i++)
  {
    databuf[i*2]   = (int8)(temp1[i]%256);
    databuf[i*2+1] = (int8)(temp1[i]/256);
  }

  CRC16 = CRC_CHECK(databuf,8);
  databuf[8] = CRC16%256;
  databuf[9] = CRC16/256;

  for(i=0;i<10;i++)
  uart_send1 (UART3,databuf[i]);
}

//串口发送数据
void serial_choose()
{

    //帧头数据
    uart_send1 (UART3, 0xa5);

    uart_send1 (UART3, 0x5a);

	//选择的线条
	//此处选择了第一,二,三条线

    uart_send1 (UART3, 0x01);
    uart_send1 (UART3, 0x00);
    uart_send1 (UART3, 0x00);
    uart_send1 (UART3, 0x00);
    uart_send1 (UART3, 0x00);
    delay_ms(10);
}