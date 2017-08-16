/****************************************Copyright (c)****************************************************
**                            Guangzhou ZLGMCU Development Co., LTD
**
**                                 http://www.zlgmcu.com
**
**--------------File Info---------------------------------------------------------------------------------
** File name:           PID.c
** Last modified Date:  2012-05-05
** Last Version:        V1.0
** Descriptions:        PID控制算法
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

#include "PID.h" 
#define  FORWARD   1
#define  BACK      0
typedef struct PID{
    
    int   Point;                                                        /* 目标值                       */
    long  SumError;                                                     /* 累计误差                     */
    
    float P;                                                            /* 比例系数                     */
    float I;                                                            /* 积分系数                     */
    float D;                                                            /* 微分系数                     */
    
    int   LastError;                                                    /* Error[-1]                    */
    int   PrevError;                                                    /* Error[-2]                    */
                                                                        
}PID;

PID __PID;
PID *sPID = &__PID;
//uint16 speed;

/*********************************************************************************************************
** Function name:       PID_Init
** Descriptions:        PID所有参数清零
** input parameters:    *sPID:PID结构体指针                         
** output parameters:   无
** Returned value:      无
*********************************************************************************************************/ 
void PID_Init(void) 
{
    sPID->Point     = 0;

    sPID->P         = 0;
    sPID->I         = 0;
    sPID->D         = 0;
    
    sPID->SumError  = 0;    
    sPID->LastError = 0;
    sPID->PrevError = 0;
}

/*********************************************************************************************************
** Function name:       PID_SetPoint
** Descriptions:        设置PID调节的目标值
** input parameters:    AimValue:目标值                         
** output parameters:   无
** Returned value:      无
*********************************************************************************************************/ 
void PID_SetPoint(int AimValue) 
{
    sPID->Point = AimValue;
}


/*********************************************************************************************************
** Function name:       PID_SetKp
** Descriptions:        设置P值
** input parameters:    Kp:                         
** output parameters:   无
** Returned value:      无
*********************************************************************************************************/ 
void PID_SetKp(float Kp) 
{
    sPID->P     = Kp; 
}


/*********************************************************************************************************
** Function name:       PID_SetKi
** Descriptions:        设置I值
** input parameters:    Ki:                         
** output parameters:   无
** Returned value:      无
*********************************************************************************************************/ 
void PID_SetKi(float Ki) 
{
    sPID->I     = Ki;
}


/*********************************************************************************************************
** Function name:       PID_SetKd
** Descriptions:        设置D值
** input parameters:    Kd:                         
** output parameters:   无
** Returned value:      无
*********************************************************************************************************/ 
void PID_SetKd(float Kd) 
{
    sPID->D     = Kd;
}

/*********************************************************************************************************
** Function name:       PID_SetKpid
** Descriptions:        设置D值
** input parameters:    Kd:                         
** output parameters:   无
** Returned value:      无
*********************************************************************************************************/ 
void PID_SetKpid(float Kp,float Ki,float Kd) 
{
    sPID->P     = Kp;
    sPID->I     = Ki;
    sPID->D     = Kd;
}

/*********************************************************************************************************
** Function name:       IncPID_Calculate
** Descriptions:        增量式PID控制
** input parameters:    BackValue:反馈值                         
** output parameters:   无
** Returned value:      无
*********************************************************************************************************/ 
int IncPID_Calculate(int BackValue) 
{
    static int Error,Inc;
   
    Error   = sPID->Point - BackValue;                                  /* 计算当前误差Error[0]         */
    /********************************
    Δu(k)=u(k)-u(k-1)
          =Kp*(      e(k)-e(k-1) + T/Ti*e(k) +Td*(e(k)  - 2*e(k-1)+e(k-2))/T)
          =Kp*(1+T/Ti+Td/T)*e(k) - Kp*(1+2*Td/T)*e(k-1) + Kp*Td/T*e(k-2))
          =
    ***********************************/
    Inc     = (int) ( sPID->P * Error
              - sPID->I * sPID->LastError
              + sPID->D * sPID->PrevError);
   
    sPID->PrevError = sPID->LastError;
    sPID->LastError = Error;
    
    return Inc;
}

/*********************************************************************************************************
** Function name:       LocPID_Calculate
** Descriptions:        位置式PID控制
** input parameters:    BackValue:反馈值                         
** output parameters:   无
** Returned value:      无
*********************************************************************************************************/ 
int LocPID_Calculate(int BackValue) 
{
    static int Error,delta,Loc;
   
    Error           = sPID->Point - BackValue;                          /* 计算当前误差Error[0]         */
    sPID->SumError += Error;
    delta           = Error - sPID->LastError;
    /********************************
    Δu(k)=u(k)-u(k-1)
          =Kp*(      e(k)-e(k-1) + T/Ti*e(k) +Td*(e(k)  - 2*e(k-1)+e(k-2))/T)
          =Kp*(1+T/Ti+Td/T)*e(k) - Kp*(1+2*Td/T)*e(k-1) + Kp*Td/T*e(k-2))
          =
    ***********************************/
    Loc     = (int) ( sPID->P * Error
              - sPID->I * sPID->SumError
              + sPID->D * delta);
   
    sPID->LastError = Error;
    
    return Loc;
}


