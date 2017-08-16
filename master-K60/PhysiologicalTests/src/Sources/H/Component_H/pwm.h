#ifndef _PWM_H_
#define _PWM_H_

  //1 ͷ�ļ�
  #include "common.h"
  #include "gpio.h"

  //#define DIR_B  gpio_init(PORTB,10, 1,0)    
  //#define DIR_F  gpio_init(PORTB,10, 1,1)
  //#define DIL_B  gpio_init(PORTB, 9, 1,0)
  //#define DIL_F  gpio_init(PORTB, 9, 1,1)
  //2 ��������
 
    void Motor_init(void);    //ֱ�����

    void Car_Control_FTM_init(void);
    
    uint8 FTM_PWM_Init(uint8 FTMx,uint32 freq);

    uint8 FTM_ChanceFrequence(uint8 FTMx,uint32 freq);
    
    uint8 FTM_PWM_Open(uint8 FTMx,uint8 channel, uint32 duty);
    
    uint8 FTM_PWM_ChangeDuty(uint8 FTMx,uint8 channel, uint32 duty);
    
    void FTM2_QUAD_Iint(void);
    
#endif