
#include "includes.h"

/************************************************************************
*                             ������ӹ�����
*
*  �������ƣ�CCD_init
*  ����˵����CCD��ʼ��
*  ����˵����
*  �������أ���
*  �޸�ʱ�䣺2012-10-20
*  ��    ע��
*************************************************************************/
void CCD_init(void)
{
  gpio_init (PORTE , 0, 1,1);
  gpio_init (PORTE , 1, 1,1);
  hw_adc_init(1) ;
  
}

/*************************************************************************
*                           ������ӹ�����
*
*  �������ƣ�StartIntegration
*  ����˵����CCD��������
*  ����˵����
*  �������أ���
*  �޸�ʱ�䣺2012-10-20
*  ��    ע��
*************************************************************************/
void StartIntegration(void) 
{

    unsigned char i;

    SI_SetVal();            /* SI  = 1 */
    SamplingDelay();
    CLK_SetVal();           /* CLK = 1 */
    SamplingDelay();
    SI_ClrVal();            /* SI  = 0 */
    SamplingDelay();
    CLK_ClrVal();           /* CLK = 0 */

    for(i=0; i<127; i++) 
    {
        SamplingDelay();
        SamplingDelay();
        CLK_SetVal();       /* CLK = 1 */
        SamplingDelay();
        SamplingDelay();
        CLK_ClrVal();       /* CLK = 0 */
    }
    SamplingDelay();
    SamplingDelay();
    CLK_SetVal();           /* CLK = 1 */
    SamplingDelay();
    SamplingDelay();
    CLK_ClrVal();           /* CLK = 0 */
}



void ImageCapture(unsigned char * ImageData)        //*ImageData =  ad_once(ADC1, AD6a, ADC_8bit);
{

    unsigned char i;
    extern uint8 AtemP ;

    SI_SetVal();            /* SI  = 1 */
    SamplingDelay();
    CLK_SetVal();           /* CLK = 1 */
    SamplingDelay();
    SI_ClrVal();            /* SI  = 0 */
    SamplingDelay();

   
//Delay 10us for sample the first pixel
    for(i = 0; i < 50; i++) 
    {
      SamplingDelay() ;  //200ns
    }


//Sampling Pixel 1
    *ImageData =  hw_ad_once(1, 6, 8);
    ImageData ++ ;
    CLK_ClrVal();           /* CLK = 0 */

    for(i=0; i<127; i++) 
    {
        SamplingDelay();
        SamplingDelay();
        CLK_SetVal();       /* CLK = 1 */
        SamplingDelay();
        SamplingDelay();
        //Sampling Pixel 2~128

       *ImageData =  hw_ad_once(1, 6, 8);
        ImageData ++ ;
        CLK_ClrVal();       /* CLK = 0 */
    }
    SamplingDelay();
    SamplingDelay();
    CLK_SetVal();           /* CLK = 1 */
    SamplingDelay();
    SamplingDelay();
    CLK_ClrVal();           /* CLK = 0 */
}

/*************************************************************************
*                           ������ӹ�����
*
*  �������ƣ�CalculateIntegrationTime
*  ����˵���������ع�ʱ��
*  ����˵����
*  �������أ���
*  �޸�ʱ�䣺2012-10-20
*  ��    ע��
*************************************************************************/
extern uint8 Pixel[128];

uint8 PixelAverageValue;/* 128�����ص��ƽ��ADֵ */

uint8 PixelAverageVoltage;/* 128�����ص��ƽ����ѹֵ��10�� */


int16 TargetPixelAverageVoltage = 30;/* �趨Ŀ��ƽ����ѹֵ��ʵ�ʵ�ѹ��10�� */

int16 PixelAverageVoltageError = 0;/* �趨Ŀ��ƽ����ѹֵ��ʵ��ֵ��ƫ�ʵ�ʵ�ѹ��10�� */

int16 TargetPixelAverageVoltageAllowError = 2;/* �趨Ŀ��ƽ����ѹֵ�����ƫ�ʵ�ʵ�ѹ��10�� */

uint8 IntegrationTime = 10;/* �ع�ʱ�䣬��λms */


void CalculateIntegrationTime(void) 
{

    PixelAverageValue = PixelAverage(128,Pixel);/* ����128�����ص��ƽ��ADֵ */
    
   
    PixelAverageVoltage = (unsigned char)((int)PixelAverageValue * 25 / 128); /* ����128�����ص��ƽ����ѹֵ,ʵ��ֵ��10�� */

    PixelAverageVoltageError = TargetPixelAverageVoltage - PixelAverageVoltage;
    if(PixelAverageVoltageError < -TargetPixelAverageVoltageAllowError)
        IntegrationTime--;//�ع�ʱ�俴ʲô
    if(PixelAverageVoltageError > TargetPixelAverageVoltageAllowError)
        IntegrationTime++;
    if(IntegrationTime <= 1)
        IntegrationTime = 1;
    if(IntegrationTime >= 20)
        IntegrationTime = 20;
}

/*************************************************************************
*                           ������ӹ�����
*
*  �������ƣ�PixelAverage
*  ����˵����������ľ�ֵ����
*  ����˵����
*  �������أ���
*  �޸�ʱ�䣺2012-10-20
*  ��    ע��
*************************************************************************/

uint8 PixelAverage(uint8 len, uint8 *data) 
{
  unsigned char i;
  unsigned int sum = 0;
  for(i = 0; i<len; i++) 
  {
    sum = sum + *data++;
  }
  return ((unsigned char)(sum/len));
}
/*************************************************************************
*                           ������ӹ�����
*
*  �������ƣ�SendHex
*  ����˵�����ɼ����ͳ���
*  ����˵����
*  �������أ���
*  �޸�ʱ�䣺2012-10-20
*  ��    ע��
*************************************************************************/
void SendHex(unsigned char hex) 
{
  unsigned char temp;
  temp = hex >> 4;
  if(temp < 10) 
  {
   uart_send1(UART0,temp + '0');
  } 
  else 
  {
   uart_send1(UART0,temp - 10 + 'A');
  }
  temp = hex & 0x0F;
  if(temp < 10) 
  {
   uart_send1(UART0,temp + '0');
  } 
  else 
  {
  uart_send1(UART0,temp - 10 + 'A');
  }
}
/*************************************************************************
*                           ������ӹ�����
*
*  �������ƣ�SendImageData
*  ����˵����
*  ����˵����
*  �������أ���
*  �޸�ʱ�䣺2012-10-20
*  ��    ע��
*************************************************************************/
void SendImageData(unsigned char * ImageData) 
{

    unsigned char i;
    unsigned char crc = 0;

    /* Send Data */
    
    uart_send1(UART0,'*');
    uart_send1(UART0,'L');
    uart_send1(UART0,'D');

    SendHex(0);
    SendHex(0);
    SendHex(0);
    SendHex(0);
    
    for(i=0; i<128; i++) 
    {
      SendHex(*ImageData++);
    }

    SendHex(crc);
    uart_send1(UART0,'#');
}
/*************************************************************************
*                           ������ӹ�����
*
*  �������ƣ�SamplingDelay
*  ����˵����CCD��ʱ���� 200ns
*  ����˵����
*  �������أ���
*  �޸�ʱ�䣺2012-10-20
*  ��    ע��
*************************************************************************/
 void SamplingDelay(void)
{
   volatile uint8 i ;
   for(i=0;i<1;i++) 
   {
    asm("nop");
    asm("nop");
   }
   
}
