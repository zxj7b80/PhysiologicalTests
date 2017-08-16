/****************************************Copyright (c)****************************************************
**                            Guangzhou ZLGMCU Development Co., LTD
**
**                                 http://www.zlgmcu.com
**
**--------------File Info---------------------------------------------------------------------------------
** File name:           PID.c
** Last modified Date:  2012-05-05
** Last Version:        V1.0
** Descriptions:        PID�����㷨
**
**--------------------------------------------------------------------------------------------------------
** Created by:          Bai Dongcheng
** Created date:        2012-05-05
** Version:             V1.00
** Descriptions:        ����ģ�壬����û�Ӧ�ó���
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
    
    int   Point;                                                        /* Ŀ��ֵ                       */
    long  SumError;                                                     /* �ۼ����                     */
    
    float P;                                                            /* ����ϵ��                     */
    float I;                                                            /* ����ϵ��                     */
    float D;                                                            /* ΢��ϵ��                     */
    
    int   LastError;                                                    /* Error[-1]                    */
    int   PrevError;                                                    /* Error[-2]                    */
                                                                        
}PID;

PID __PID;
PID *sPID = &__PID;
//uint16 speed;

/*********************************************************************************************************
** Function name:       PID_Init
** Descriptions:        PID���в�������
** input parameters:    *sPID:PID�ṹ��ָ��                         
** output parameters:   ��
** Returned value:      ��
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
** Descriptions:        ����PID���ڵ�Ŀ��ֵ
** input parameters:    AimValue:Ŀ��ֵ                         
** output parameters:   ��
** Returned value:      ��
*********************************************************************************************************/ 
void PID_SetPoint(int AimValue) 
{
    sPID->Point = AimValue;
}


/*********************************************************************************************************
** Function name:       PID_SetKp
** Descriptions:        ����Pֵ
** input parameters:    Kp:                         
** output parameters:   ��
** Returned value:      ��
*********************************************************************************************************/ 
void PID_SetKp(float Kp) 
{
    sPID->P     = Kp; 
}


/*********************************************************************************************************
** Function name:       PID_SetKi
** Descriptions:        ����Iֵ
** input parameters:    Ki:                         
** output parameters:   ��
** Returned value:      ��
*********************************************************************************************************/ 
void PID_SetKi(float Ki) 
{
    sPID->I     = Ki;
}


/*********************************************************************************************************
** Function name:       PID_SetKd
** Descriptions:        ����Dֵ
** input parameters:    Kd:                         
** output parameters:   ��
** Returned value:      ��
*********************************************************************************************************/ 
void PID_SetKd(float Kd) 
{
    sPID->D     = Kd;
}

/*********************************************************************************************************
** Function name:       PID_SetKpid
** Descriptions:        ����Dֵ
** input parameters:    Kd:                         
** output parameters:   ��
** Returned value:      ��
*********************************************************************************************************/ 
void PID_SetKpid(float Kp,float Ki,float Kd) 
{
    sPID->P     = Kp;
    sPID->I     = Ki;
    sPID->D     = Kd;
}

/*********************************************************************************************************
** Function name:       IncPID_Calculate
** Descriptions:        ����ʽPID����
** input parameters:    BackValue:����ֵ                         
** output parameters:   ��
** Returned value:      ��
*********************************************************************************************************/ 
int IncPID_Calculate(int BackValue) 
{
    static int Error,Inc;
   
    Error   = sPID->Point - BackValue;                                  /* ���㵱ǰ���Error[0]         */
    /********************************
    ��u(k)=u(k)-u(k-1)
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
** Descriptions:        λ��ʽPID����
** input parameters:    BackValue:����ֵ                         
** output parameters:   ��
** Returned value:      ��
*********************************************************************************************************/ 
int LocPID_Calculate(int BackValue) 
{
    static int Error,delta,Loc;
   
    Error           = sPID->Point - BackValue;                          /* ���㵱ǰ���Error[0]         */
    sPID->SumError += Error;
    delta           = Error - sPID->LastError;
    /********************************
    ��u(k)=u(k)-u(k-1)
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


