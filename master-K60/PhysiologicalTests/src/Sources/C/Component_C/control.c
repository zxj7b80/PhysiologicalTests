#include "includes.h"
//------------------------------------------------------------------------------
int16   g_nInputVoltage[5]={0};
int32	g_lnInputVoltageSigma[5]={0};    	
#define VOLTAGE_GRAVITY                     g_nInputVoltage[0]
#define VOLTAGE_GYRO                        g_nInputVoltage[1]

//-----------
float g_fCarSpeed=0;
float g_fCarSpeedstart=0;
int16 g_nMotorPulse=0;
int16 g_nRightMotorPulse=0;
float g_fSpeedControlIntegral=0;
float g_fSpeedControlOutOld =0;
float g_fSpeedControlOutNew =0;
float g_fSpeedControlOut =0;
uint8 g_nSpeedControlPeriod =0;

//------------
float g_fMotorOut=0;
int16 g_nMotorPulseSigma =0;

extern int16 speedflag;
//----------------------------------------------------------------------------------------------------
int16   gravity,voltage_gravity;
extern  int16   hongwai_l,hongwai_r;
extern  int16   HONGWAI_L,HONGWAI_R;

void GetSamplezhi()
{
  g_lnInputVoltageSigma[0]+= hw_ad_ave(0,17,12,20);//左1   
  g_lnInputVoltageSigma[1]+= hw_ad_ave(1,7,12,20);//右1
  //g_lnInputVoltageSigma[2]+= hw_ad_ave(0,12,12,20);
}

void GetOFFSET()
{
  HONGWAI_L=g_lnInputVoltageSigma[0]/200;
  HONGWAI_R=g_lnInputVoltageSigma[1]/200;
  //gyro_direction= g_lnInputVoltageSigma[2]/200;  
}

void get_ad()
{
  hongwai_l = hw_ad_ave(0,17,12,20);              
  hongwai_r = hw_ad_ave(1,7,12,20);                   
  //DIR_CONTROL_D_VALUE = hw_ad_ave(0,12,12,20);            //---------得转向陀螺仪电压信号(PTB2)
}

int Abs(int a)
{
  int i;
  i=a;
  if(i<0) i=-a;
  else i=a;
  return i;
}        
//-----------------------速度控制-------------------------------------------------------//
        int32    pulse_count=0,pulse_count_pre=0;
extern  int16    speed;
        int16    speed_pwm=0;
extern  int16    speed_B;
extern  int16    speed_jian;
extern  int16    PMAX;
        int16    Psha=60;        
//----------------------------------测速---------------------------------------        
void GetMotorPulse()
{
  uint32 nPulse;
  nPulse=FTM2_CNT;                     
  g_nMotorPulse = (int32)nPulse;      
  g_nMotorPulseSigma +=g_nMotorPulse;
  FTM2_CNT=0;
}

//----------------------------------刹车1---------------------------------------
void shache1()//条件得封闭
{ 
}

//---------------------------------------------------------------
double  x=0.0,y=0.0;
int16   Pmax=250,Pmin=0;   

void Speed_PID()
{
    pulse_count=g_nMotorPulseSigma; 
    g_nMotorPulseSigma=0;

    //最高速度限制
    if(pulse_count>PMAX) 
      speed = speed-speed_jian;//控制效果明显

    //刹车函数-------
    //-m1-//
    x=(double)((Psha-pulse_count)/((Pmax-Pmin)/3));
    //y=(double)((Pset-pulse_count)/((Pmax-Pmin)/3));
    speed_B=(int16)((x-1/6*x*x*x+3*x*x*x*x*x)-300);//250
    /*//-m2-//
    x=-(double)((pulse_count-Psha)/((Pmax-Pmin)/10));
    speed_B=(int16)(x*x*x-200);*/
    //--------------------------------------------- 
    speed_pwm=(int16)(speed+IncPID_Calculate(pulse_count*19/10));
    
    //限幅
    if(speed_pwm>1250)
      speed_pwm=1250;
    if(speed_pwm<-1250)
      speed_pwm=-1250;
    
    //输出
    if(speed_pwm>0) 
    {
      gpio_init(PORTB, 9, 1,0);//DIL_B;
      FTM1_C0V=speed_pwm;
    }
    else 
    {
      gpio_init(PORTB, 9, 1,1);//DIL_F;
      FTM1_C0V=1250+speed_pwm;
    }
}

//-----------------------------------------------------------------------
#define Car_Control_MAX 3750
#define Car_Control_MIN -3750
#define Car_Control_MOD 3750

void Car_Control_PWM(uint8 motor,int pwmin)
{    
    if(pwmin>0)
    {
        if(motor==MOTOR_LEFT)
        {
            if(pwmin>Car_Control_MAX)
               pwmin=Car_Control_MAX;
            DIR_LEFT_F;
            FTM_PWM_ChangeDuty(1,0,8000);
        }
        else
        {
            if(pwmin>Car_Control_MAX)
               pwmin=Car_Control_MAX;
            DIR_RIGHT_F;
            FTM_PWM_ChangeDuty(1,0,8000);
        }
    }
    else if(pwmin==0)
    {
        if(motor==MOTOR_LEFT)
        {
            DIR_LEFT_F;
            FTM_PWM_ChangeDuty(1,0,0);
        }
        else
        {
            DIR_RIGHT_F;
            FTM_PWM_ChangeDuty(1,0,0);
        }
    }
    else
    {
        if(motor==MOTOR_LEFT)
        {
            if(pwmin<Car_Control_MIN)
              pwmin=Car_Control_MIN;
            DIR_LEFT_B;
            FTM_PWM_ChangeDuty(1,0,8000);
        }
        else
        {
            if(pwmin<Car_Control_MIN)
              pwmin=Car_Control_MIN;
            DIR_RIGHT_B;
            FTM_PWM_ChangeDuty(1,0,8000);
        }
    }
}
