
//��������  ������� ��������
//Ӳ��ƽ̨��MK60DN512ZVLL10
//����������IAR V6.3
//����޸ĺ�ע���ʱ�䣺
//                     2012.8.26
#include "includes.h"
#include "button.h"
#include "gpio.h"
#include "LQ12864.h"


#define  keyport       PORTD
#define  keyport_clk   SIM_SCGC5_PORTD_MASK
#define  pin_begin     0  

/********************************************************
*��������   void button_init(void)
*���ܣ�     �������ⲿ����
*��ڲ���:  ��
*���ڲ���:  ��
*˵����     ʹ�õ����ţ�PC7��PC8��PC9
*********************************************************/
void button_init(void)
{   
  SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;    //��PORTD�˿ڵ�ʱ��

  //PORTD_DFER|=PORT_DFER_DFE_MASK;   //enable filter
  //PORTD_DFCR|=PORT_DFCR_CS_MASK;    //select LDO as Filter Clock
  //PORTD_DFWR=PORT_DFWR_FILT(1);     //10ms

  PORTD_PCR0=PORT_PCR_MUX(1)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;  //����  
  PORTD_PCR1=PORT_PCR_MUX(1)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;  //����  
  PORTD_PCR2=PORT_PCR_MUX(1)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;  //����  
  PORTD_PCR3=PORT_PCR_MUX(1)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;  //����  
  PORTD_PCR4=PORT_PCR_MUX(1)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;  //����  
  PORTD_PCR5=PORT_PCR_MUX(1)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;  //����  
  PORTD_PCR6=PORT_PCR_MUX(1)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;  //����  
  PORTD_PCR7=PORT_PCR_MUX(1)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;  //����  
}

/********************************************************
*��������   void matrix_keyboard_init()
*���ܣ�     �������ⲿ����
*��ڲ���:  ��
*���ڲ���:  ��
*˵����     ʹ�õ����ţ�PD0~PD7
*********************************************************/
void matrix_keyboard_init()
{  
  SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;
  
  gpio_init (keyport,(pin_begin+7),1,1);
  gpio_init (keyport,(pin_begin+6),1,1);
  gpio_init (keyport,(pin_begin+5),1,1);
  gpio_init (keyport,(pin_begin+4),1,1);
  gpio_init (keyport,(pin_begin+3),0,0);
  gpio_init (keyport,(pin_begin+2),0,0);
  gpio_init (keyport,(pin_begin+1),0,0);
  gpio_init (keyport,(pin_begin+0),0,0);
  delay_ms(50);
  
}

/*********************************TEMP******************************
*��������uint8 keyboard_scan()
*���ܣ�ɨ�谴����ֵ
*��ڲ�������
*���ڲ�������ֵ
*˵������
***************************************************************/
uint8 keyboard_scan()
{
  uint8 TEMP=0;
  uint8 key_num=255;
  //������-------------------------
  gpio_init (keyport,(pin_begin+7),1,0);
  gpio_init (keyport,(pin_begin+6),1,1);
  gpio_init (keyport,(pin_begin+5),1,1);
  gpio_init (keyport,(pin_begin+4),1,1);
    
  TEMP=((gpio_read(keyport,(pin_begin+3))<<4)+(gpio_read(keyport,(pin_begin+2))<<5)+(gpio_read(keyport,(pin_begin+1))<<6)+(gpio_read(keyport,(pin_begin+0))<<7));
  
  if(TEMP!=0x70)
  {
    delay_ms(10);  
    
    TEMP=((gpio_read(keyport,(pin_begin+3))<<4)+(gpio_read(keyport,(pin_begin+2))<<5)+(gpio_read(keyport,(pin_begin+1))<<6)+(gpio_read(keyport,(pin_begin+0))<<7));
    
    if(TEMP!=0x70)
    {
      switch(TEMP)
      {                
      case 0x60:	
               key_num=10;                          //10�ż�������				
               break;
      case 0x50:
               key_num=11;                         //11�ż�������
               break;
      case 0x30:
               key_num=12;                          //12�ż�������
               break;
      }
    }			 	   
  }

  //������--------------------------
  gpio_init (keyport,(pin_begin+7),1,1);
  gpio_init (keyport,(pin_begin+6),1,0);
  gpio_init (keyport,(pin_begin+5),1,1);
  gpio_init (keyport,(pin_begin+4),1,1);
    
  TEMP=((gpio_read(keyport,(pin_begin+3))<<4)+(gpio_read(keyport,(pin_begin+2))<<5)+(gpio_read(keyport,(pin_begin+1))<<6)+(gpio_read(keyport,(pin_begin+0))<<7)); 
  
  if(TEMP!=0x70)
  {
    delay_ms(10);     
    
    TEMP=((gpio_read(keyport,(pin_begin+3))<<4)+(gpio_read(keyport,(pin_begin+2))<<5)+(gpio_read(keyport,(pin_begin+1))<<6)+(gpio_read(keyport,(pin_begin+0))<<7));          
    
    if(TEMP!=0x70)
    {
       switch(TEMP)
       {
        case 0x60:	
                  key_num=7;                    //7�ż�������				
                  break;
        case 0x50:
                  key_num=8;                    //8�ż�������
                  break;
        case 0x30:
                  key_num=9;                     //9�ż�������
                  break;
        }
    }			 	   
  }
  //�ڶ���------------------------
  gpio_init (keyport,(pin_begin+7),1,1);
  gpio_init (keyport,(pin_begin+6),1,1);
  gpio_init (keyport,(pin_begin+5),1,0);
  gpio_init (keyport,(pin_begin+4),1,1);
    
  TEMP=((gpio_read(keyport,(pin_begin+3))<<4)+(gpio_read(keyport,(pin_begin+2))<<5)+(gpio_read(keyport,(pin_begin+1))<<6)+(gpio_read(keyport,(pin_begin+0))<<7));

  if(TEMP!=0x70)
  {
    delay_ms(10);
        
    TEMP=((gpio_read(keyport,(pin_begin+3))<<4)+(gpio_read(keyport,(pin_begin+2))<<5)+(gpio_read(keyport,(pin_begin+1))<<6)+(gpio_read(keyport,(pin_begin+0))<<7));
        
    if(TEMP!=0x70)
    {
      switch(TEMP)
      {
      case 0x60:
                key_num=4;                         //4�ż�������					
                break;
      case 0x50:
                key_num=5;                        //5�ż�������
                break;
      case 0x30:
                key_num=6;                        //6�ż�������
                break;
      }
    }			 	   
  }
  //��һ��------------------------------
  gpio_init (keyport,(pin_begin+7),1,1);
  gpio_init (keyport,(pin_begin+6),1,1);
  gpio_init (keyport,(pin_begin+5),1,1);
  gpio_init (keyport,(pin_begin+4),1,0);
    
  TEMP=((gpio_read(keyport,(pin_begin+3))<<4)+(gpio_read(keyport,(pin_begin+2))<<5)+(gpio_read(keyport,(pin_begin+1))<<6)+(gpio_read(keyport,(pin_begin+0))<<7));
    
  if(TEMP!=0x70)
  {
    delay_ms(10);
        
    TEMP=((gpio_read(keyport,(pin_begin+3))<<4)+(gpio_read(keyport,(pin_begin+2))<<5)+(gpio_read(keyport,(pin_begin+1))<<6)+(gpio_read(keyport,(pin_begin+0))<<7));
        
    if(TEMP!=0x70)
    {
       switch(TEMP)
       {
       case 0x60:
                 key_num=1;                           //1�ż�������					
                 break;
       case 0x50:
                 key_num=2;                           //2�ż�������
                 break;
       case  0x30:
                 key_num=3;                           //3�ż�������
                 break;
       }
    }			 	   
  } 
  return(key_num);     
}
