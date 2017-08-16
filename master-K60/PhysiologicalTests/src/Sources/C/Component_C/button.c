
//程序名：  矩阵键盘 驱动程序
//硬件平台：MK60DN512ZVLL10
//开发环境：IAR V6.3
//最后修改和注解的时间：
//                     2012.8.26
#include "includes.h"
#include "button.h"
#include "gpio.h"
#include "LQ12864.h"


#define  keyport       PORTD
#define  keyport_clk   SIM_SCGC5_PORTD_MASK
#define  pin_begin     0  

/********************************************************
*函数名：   void button_init(void)
*功能：     按键，外部触发
*入口参数:  无
*出口参数:  无
*说明：     使用的引脚：PC7、PC8、PC9
*********************************************************/
void button_init(void)
{   
  SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;    //打开PORTD端口的时钟

  //PORTD_DFER|=PORT_DFER_DFE_MASK;   //enable filter
  //PORTD_DFCR|=PORT_DFCR_CS_MASK;    //select LDO as Filter Clock
  //PORTD_DFWR=PORT_DFWR_FILT(1);     //10ms

  PORTD_PCR0=PORT_PCR_MUX(1)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;  //上拉  
  PORTD_PCR1=PORT_PCR_MUX(1)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;  //上拉  
  PORTD_PCR2=PORT_PCR_MUX(1)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;  //上拉  
  PORTD_PCR3=PORT_PCR_MUX(1)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;  //上拉  
  PORTD_PCR4=PORT_PCR_MUX(1)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;  //上拉  
  PORTD_PCR5=PORT_PCR_MUX(1)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;  //上拉  
  PORTD_PCR6=PORT_PCR_MUX(1)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;  //上拉  
  PORTD_PCR7=PORT_PCR_MUX(1)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;  //上拉  
}

/********************************************************
*函数名：   void matrix_keyboard_init()
*功能：     按键，外部触发
*入口参数:  无
*出口参数:  无
*说明：     使用的引脚：PD0~PD7
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
*函数名：uint8 keyboard_scan()
*功能：扫描按键的值
*入口参数：无
*出口参数：键值
*说明：无
***************************************************************/
uint8 keyboard_scan()
{
  uint8 TEMP=0;
  uint8 key_num=255;
  //第四行-------------------------
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
               key_num=10;                          //10号键被按下				
               break;
      case 0x50:
               key_num=11;                         //11号键被按下
               break;
      case 0x30:
               key_num=12;                          //12号键被按下
               break;
      }
    }			 	   
  }

  //第三行--------------------------
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
                  key_num=7;                    //7号键被按下				
                  break;
        case 0x50:
                  key_num=8;                    //8号键被按下
                  break;
        case 0x30:
                  key_num=9;                     //9号键被按下
                  break;
        }
    }			 	   
  }
  //第二行------------------------
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
                key_num=4;                         //4号键被按下					
                break;
      case 0x50:
                key_num=5;                        //5号键被按下
                break;
      case 0x30:
                key_num=6;                        //6号键被按下
                break;
      }
    }			 	   
  }
  //第一行------------------------------
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
                 key_num=1;                           //1号键被按下					
                 break;
       case 0x50:
                 key_num=2;                           //2号键被按下
                 break;
       case  0x30:
                 key_num=3;                           //3号键被按下
                 break;
       }
    }			 	   
  } 
  return(key_num);     
}
