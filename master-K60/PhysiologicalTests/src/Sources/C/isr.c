//-------------------------------------------------------------------------*
// �ļ���: isr.c                                                           *
// ˵  ��: �жϴ������                                                     *
//-------------------------------------------------------------------------*
#include "includes.h"
#include "math.h"

uint8  g_n1msEventCount =0;
int    off_y[20]={0};
extern int   OFF_Y,YBack;

extern uint8   BUF[8];
uint16 IntCnt=0;
uint16 base=100;
// P             I                 D
uint16 SecStart=225,SecMid=60,SecStop=220,SecBack1=170,SecBack2=550;//0416
                                                 //170��������

int32  PwmDuty=0;
int32  Duty=0;
int32  PwmSet=0;


uint32 PwmStart=5800;
uint32 PwmStop=8500;
uint32 PwmMid=4800;
uint32 PwmBack=4000;

uint8  dir=0;
uint8  GpioIntFlag=0;
uint16 GpioIntCnt=0;

uint8  g_n1msEventFlag=0;

uint16 pit1_cnt=0;
uint8 ForB=0;

extern uint8 MachineReset;
uint8 slow=0;
uint8 PB1=0,PE24=0;
uint8 StepOk=0;
uint8 PB1_flag=0,PE24_flag=0;

uint8 BufBegin=0;

extern uint16 OutData[4];
extern int16 g_nMotorPulseSigma;
extern int16 g_nMotorPulse;
int16 PulseControl=0;

int16  ResetPulseSection=0;
uint8  FB=0;
extern uint8 first;
int32  BatteryVoltage=0;
int16  BVCnt=0;
uint8  PowerLowFg=0;
int16  chainage=0;

//----------------------------------------------------------------
//pit0�жϷ�����
void pit0_isr(void)                      //��ʱ��1ms�жϺ���
{
  DisableInterrupts;                     //�����ж�
  g_n1msEventFlag=1;
  PwmDuty=0;
  //����---------------------------------------------------------
  if(test_start==1&&PE24_flag==0&&first==0)
  {
    IntCnt++;
    if(IntCnt==1)
    {
      ForB=1;
      PwmDuty=0;
      gpio_ctrl(PORTE,25,0);
    }
    else if(IntCnt>1 && IntCnt<base)
      PwmDuty=0;
    else
    {
      IntCnt=base+1;
      if(g_nMotorPulseSigma<=450+chainage)
      {
        BufBegin=1;
        ForB=1;
        gpio_ctrl(PORTC,4,1);//Brown//��
        gpio_ctrl(PORTC,6,0);//Gray
        PID_SetPoint(1000);
        PID_SetKpid(2.2,0.5,0);
        PwmDuty=(int16)(IncPID_Calculate(YBack))+5200;
      }
      else if(g_nMotorPulseSigma>450+chainage)
      {
        ForB=0;
        gpio_ctrl(PORTC,4,0);//Brown//��
        gpio_ctrl(PORTC,6,1);//Gray
        PID_SetPoint(-1000);
        PID_SetKpid(2.2,0.5,0);
        PwmDuty=(int16)(IncPID_Calculate(YBack))-4800;
      }
      //����ɲ
      if(g_nMotorPulse<=1&&ForB==0)
      {
        gpio_ctrl(PORTE,25,1);
        PwmDuty=0;
        IntCnt=0;
        test_start=0;
      }
    }
  }
  //��λ-------------------------------------------------------
  if(MachineReset==1&&PB1_flag==0&&first==0)
  {
    IntCnt++;
    if(IntCnt==1)
    {
      PwmDuty=0;
      gpio_ctrl(PORTE,25,0);
    }
    else if(IntCnt>1 && IntCnt<base)
      PwmDuty=0;
    else
    {
      IntCnt=base+1;
      if(g_nMotorPulseSigma>=-220)
      {
        FB=1;
        gpio_ctrl(PORTC,4,0);//Brown//��
        gpio_ctrl(PORTC,6,1);//Gray
        PID_SetPoint(-100);
        PID_SetKpid(1.8,0.9,0);
        PwmDuty=(int16)(IncPID_Calculate(YBack))-4350;
      }
      else if(g_nMotorPulseSigma<=-220&&g_nMotorPulseSigma>=-350)
      {
        FB=1;
        gpio_ctrl(PORTC,4,0);//��
        gpio_ctrl(PORTC,6,1);
        PID_SetPoint(-2);
        PID_SetKpid(1.8,0.1,0);
        PwmDuty=(int16)(IncPID_Calculate(g_nMotorPulse))-4000;
      }
      else if(g_nMotorPulseSigma<=-350)
      {
        FB=0;
        gpio_ctrl(PORTC,4,1);//��
        gpio_ctrl(PORTC,6,0);
        PwmDuty=-7000;
      }
      //����ɲ
      if(g_nMotorPulse>=-1&&FB==0)
      {
        gpio_ctrl(PORTE,25,1);
        PwmDuty=0;
        IntCnt=0;
        MachineReset=0;
      }
    }
  }
  
  //�жϲ���--------------------
  if(PB1==1)
  {
    PB1=0;
    PE24_flag=0;
    PB1_flag=1;
    StepOk=1;
    disable_irq(88);
    enable_irq(91);
    //---------
    BufBegin=0;
    MachineReset=0;
    slow=0;
    IntCnt=0;
    PwmDuty=0; 
    gpio_ctrl(PORTE,25,1);
  }
  if(PE24==1)
  {
    PE24=0;
    PE24_flag=1;
    PB1_flag=0;
    disable_irq(91);
    enable_irq(88);
    //---------
    IntCnt=0;
    PwmDuty=0;
    gpio_ctrl(PORTE,25,1);
    test_start=0;
  }
  
  //�޷�-------------------------------------------------------------
  if(PwmDuty>=9999) PwmDuty=9999;
  if(PwmDuty<=-9999) PwmDuty=-9999;
  
  //PWM����
  if(PwmDuty<0) 
    Duty=-PwmDuty;
  else
    Duty=PwmDuty;
  
  //�������
  FTM_PWM_ChangeDuty(0,2,Duty);
  
  //����-----
  if(GpioIntFlag==1)
  {
    if(GpioIntCnt++>1000)
    {
      GpioIntFlag=0;
      GpioIntCnt=0;
    }  
  }
  //5ms��ʱ-----
  g_n1msEventCount++;
  switch(g_n1msEventCount)
  {
  case 1:
    GetMotorPulse();
    break;
  case 2:
    BVCnt++;
    break;
  case 3: 
    break;  
  case 4:      
    break;
  case 5:
    g_n1msEventCount = 0;
    break;
  }
  
  //��������
  if(BVCnt==200)
  {
    BVCnt=0;
    BatteryVoltage = hw_ad_ave(1,7,12,20);
    if(BatteryVoltage<=500)
      PowerLowFg=1;
    else
      PowerLowFg=0;
    
    if(PowerLowFg==1)
        gpio_ctrl(PORTB,3,1);  
  }
    
  //�жϴ���
  PIT_TFLG(0)|=PIT_TFLG_TIF_MASK;          //���жϱ�־λ
  enable_pit_interrupt(0);                 //ʹ��PIT�ж�
  EnableInterrupts;                        //�����ж�
}
//--------------------------------------------
//pit1�жϷ�����
void pit1_isr(void)
{
  DisableInterrupts;
  
  if(pit1_cnt++>=1000) pit1_cnt=0;
  
  PIT_TFLG(1)|=PIT_TFLG_TIF_MASK;          //���жϱ�־λ
  enable_pit_interrupt(1);                 //ʹ��PIT�ж�
  EnableInterrupts;                        //�����ж�
}

//-------------------------------------------
uint8 command_str[10];
uint8 analyse_over=1;
uint8 cnt=0;
//����3���ݽ����ж� 
void uart3_isr(void)
{
    //uint8 ch;
    DisableInterrupts;		//�����ж�
    /*
    //����һ���ֽ����ݲ��ط�
    if(uart_re1(UART3,&ch))
      uart_send1(UART3,ch);
    */
    if(analyse_over==1)
    {
      if((UART_S1_REG(UART3) & UART_S1_RDRF_MASK)!= 0)
      {
        command_str[cnt++]=UART_D_REG(UART3);
        if(command_str[cnt-1]=='*')
        {
          analyse_over=0;
          cnt=0;
        }
      }
    }
    EnableInterrupts;		//�����ж�
}

//--------------------------------------------------
int FTM_Count=0;
//FTM0�ж�
void FTM1_isr()
{
  FTM_Count++;
  FTM_SC_REG(FTM1_BASE_PTR)&=~FTM_SC_TOF_MASK;
}

//---------------------------------------------------
//PB1�жϷ�����
void PB1_isr(void)
{
    DisableInterrupts;  

    PORTB_ISFR=1<<1;   // Clear the PTB1 interrupt flags

    if(GpioIntFlag==0)
      PB1++;  
    
    GpioIntFlag=1;
   
    EnableInterrupts;	
}

//--------------------------------------------
//PE24�жϷ�����---ΪʲôPA18/PA19����
void PE24_isr(void)
{
    DisableInterrupts;  
    
    PORTE_ISFR=1<<24;   // Clear the PE24 interrupt flags       
    
    if(GpioIntFlag==0)
      PE24++;
    
    GpioIntFlag=1;
    
    EnableInterrupts;	
}


