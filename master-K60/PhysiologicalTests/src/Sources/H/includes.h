//-------------------------------------------------------------------------*
//�ļ���: includes.h                                                       *
//˵  ��: ��ͷ�ļ�,���ļ�����:                                             *
//        ������(main)�ļ����õ���ͷ�ļ����ⲿ�����������йس�������       *
//-------------------------------------------------------------------------*
#ifndef INCLUDE_H_
#define INCLUDE_H_

	//1 ͷ�ļ�
        #include "sysinit.h"
        #include "stdlib.h"
        #include "math.h"
	//1.1ͨ��ͷ�ļ�
	#include "common.h"            //ͨ�ú���ͷ�ļ�
                
	//1.2��������Ӳ������ͷ�ļ�(������ģ��)       
	#include  "light.h"                  //С�ƹ���ͷ�ļ�
	#include  "uart.h"                   //���ڹ���ͷ�ļ�
        #include  "adc.h" 
        #include  "pwm.h"
        #include  "decoder.h"
        #include  "pit.h"
        #include  "gpio.h"
        #include  "i2c.h"
        #include  "delay.h"
        #include  "control.h"
        #include  "LQ12864.h"
        #include  "PID.h"
        #include  "button.h"
        #include  "MMA8451.h"
        #include  "UpMonitor.h"
        #include  "NRF24L01.h"
        #include  "Command_analy.h"	
        //2 �궨��
        //#define MOTOR_OUT_MAX   1.0
        //#define MOTOR_OUT_MIN	-1.0
        //#define   BACK     1
        //#define   FORWARD  0
#endif
