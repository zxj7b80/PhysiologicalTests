/****************************************Copyright (c)****************************************************
**                            Guangzhou ZLGMCU Development Co., LTD
**
**                                 http://www.zlgmcu.com
**
**--------------File Info---------------------------------------------------------------------------------
** File name:           PID.h
** Last modified Date:  2012-05-05
** Last Version:        V1.0
** Descriptions:        PID.c的接口文件
**
**--------------------------------------------------------------------------------------------------------
** Created by:          Bai Dongcheng
** Created date:        2012-05-05
** Version:             V1.00
** Descriptions:        整理模板，添加用户应用程序
**
**--------------------------------------------------------------------------------------------------------
** Modified by:        
** Modified date:      
** Version:            
** Descriptions:       
**
** Rechecked by:
*********************************************************************************************************/

#ifndef __PID_H__
#define __PID_H__
      
#include "common.h"

void PID_Init(void);
void PID_SetPoint(int AimValue);
void PID_SetKp(float Kp);
void PID_SetKi(float Ki);
void PID_SetKd(float Kd);
//void PID_speed();
void PID_SetKpid(float Kp,float Ki,float Kd);
int  IncPID_Calculate(int BackValue);
int  LocPID_Calculate(int BackValue);

#endif 