//头文件
#include "includes.h"

//全局变量声明
extern int periph_clk_khz;

extern  uint8   BUF[8];                             	                    
extern  int    off_y[20];
        int     OFF_Y=0;
        int     YBack=0;
        uint8   temp=0;
        int     YMax=0,YMin=0;
        
        int16   Up[1000]={0};
        uint16  Mid1=0,Mid2=0,End=0,Cnt=0;
        int16   Aver1=0,Aver2=0,Aver3=0;
        uint8   Aver8_1=0,Aver8_2=0,Aver8_3=0;
        int16   UpBuf=0;
        uint8   UpBuf1=0,UpBuf1_pre=0;
        
        uint8  UpCnt=0;
        uint8  tmp_buf[33],TmpPre=0;
        uint8  tmp_buf_cn=0;
        uint8  avr_count=0;
        

        uint8  key_num=255;
        uint8  key_no=255;
        uint8  BK=255;
        
extern  uint16 add;
extern  uint32 PwmStart;
extern  uint32 PwmStop;
extern  uint32 PwmMid;
extern  uint32 PwmBack;

extern  uint16 SecStart,SecMid,SecStop,SecBack1,SecBack2;


extern  int32  PwmDuty;
extern  int32  PwmSet;
extern  uint8  g_n1msEventCount;
extern  uint8  g_n1msEventFlag;

extern  uint8  command_str[10];
extern  uint8  analyse_over;
extern  int    FTM_Count;

uint32 PIT1_CurrentVAL0=0,PIT1_CurrentVAL1=0;


extern uint16 OutData[4];
extern uint8 PB1,PE24;
extern uint8 StepOk;
extern uint8 PB1_flag,PE24_flag;

extern uint8 ForB;

extern uint8 BufBegin;

extern int16 g_nMotorPulseSigma;

uint8 first=0;
extern int32  BatteryVoltage;
extern int16  chainage;

//函数声明

void AdjustPara();
void system_init();

//主函数8
void main(void)
{
  uint8 i=0;
  
  system_init();
  serial_choose();
  
  while(NRF24L01_Check())
  {
    LCD_P8x16Str(0,0,"nrf24l01 err");
    delay_ms(1000);
  }
  LCD_P8x16Str(0,0,"nrf24l01 ok");
  delay_ms(500);
  LCD_CLS();
  NRF24L01_RX_Mode();
  
  while(1)
  {
    //1-步进电机--------------------
    while(1)
    {     
       first=1;
       if(g_n1msEventCount==0)
       { //2---        
         LCD_P8x16Str(0,2,"B:");LCD_P8x16_number(30,2,PB1_flag);
         LCD_P8x16Str(60,2,"E:");LCD_P8x16_number(100,2,PE24_flag);
         //4---
         LCD_P8x16Str(0,4,"Sok:");LCD_P8x16_number(30,4,StepOk);
         LCD_P8x16Str(60,4,"fir:");LCD_P8x16_number(100,4,first);
         //6---
         LCD_P8x16Str(60,6,"BV:");LCD_P8x16_number_4(85,6,BatteryVoltage);
       }
       if(!analyse_over)
       {
         analyse_over=1;
         Command_analy(command_str);
         LCD_CLS();
         LCD_P8x16Str(0,0,"C:");LCD_P8x16Str(20,0,command_str);
         for(i=0;i<10;i++)
           command_str[i]=0;
         
         //体重输入---
         if(DM_start==1) 
         {
           DM_start=0;
           if(constant_angle<=50)
             chainage=+50;
           else if(constant_angle>50&&constant_angle<=100)
             chainage=0;
           else if(constant_angle>100)
             chainage=-50;
           constant_angle=0;
           break;
         }
         //圆盘定方向转---
         if(motor_run_pos==1)
         {
           Car_Control_PWM(MOTOR_LEFT,1800);
           motor_run_pos=0;
         }
         if(motor_run_nag==1) 
         {
           Car_Control_PWM(MOTOR_LEFT,-1800);
           motor_run_nag=0;
         }
         if(motor_stop==1)
         {
           Car_Control_PWM(MOTOR_LEFT,0);
           motor_stop=0;
         }
       }
       //圆盘定方向、定角度转---
       if(run_constant_angle_pos==1)
       {
         Car_Control_PWM(MOTOR_LEFT,1800); 
         if(FTM_Count>(int)(61.5*constant_angle))
         {
           disable_irq(63);
           FTM_Count=0;
           Car_Control_PWM(MOTOR_LEFT,0);
           run_constant_angle_pos=0;
         }
       }
       if(run_constant_angle_nag==1)
       {
         Car_Control_PWM(MOTOR_LEFT,-1800);
         if(FTM_Count>=(int)(61.5*constant_angle))
         {
           disable_irq(62);
           FTM_Count=0;
           Car_Control_PWM(MOTOR_LEFT,0);
           run_constant_angle_nag=0;
         }
       }
    }
    //2-无刷直流-------------------
    while(1)
    {  
      first=0;
      //指令解析---
      if(!analyse_over)
      {
        analyse_over=1;
        Command_analy(command_str);
        //0-----
        LCD_CLS();
        LCD_P8x16Str(0,0,"C:");LCD_P8x16Str(20,0,command_str);
        for(i=0;i<10;i++)
          command_str[i]=0;
      }
      //归位---
      if(StepOk==1)
      {
        StepOk=0;
        LCD_CLS();
        break;
      }
      //加速度---  
      if(NRF24L01_RxPacket(tmp_buf)==0)
      {
        UpBuf1_pre=UpBuf1;
        UpBuf1=tmp_buf[0];
        //上位机数据---
        //1-----
//        Up[UpCnt]=tmp_buf[2];
//        if(Up[UpCnt]>=128)
//          Up[UpCnt]=Up[UpCnt]-256;
//        UpCnt++;
//        if(UpCnt>=3)
//        {
//          UpCnt=0;
//          UpBuf=(Up[0]+Up[1]+Up[2])/3;
//          if(UpBuf<=0)
//            UpBuf=UpBuf+256;
//          UpBuf1=UpBuf&0x00ff;
//        }

        //下位机数据---
        off_y[avr_count]=(tmp_buf[0]<<8)|tmp_buf[1];    
        off_y[avr_count]>>=4;       
        if(off_y[avr_count]>=2048) 
          off_y[avr_count]=off_y[avr_count]-4096;

        if(avr_count==0)
        {
          YMin=off_y[0];
          YMax=off_y[0];
        }
        if(off_y[avr_count]<=YMin)
          YMin=off_y[avr_count];
        if(off_y[avr_count]>=YMax)
          YMax=off_y[avr_count];
        
        avr_count++;
        if(avr_count==5)
        {
          avr_count=0;
          for(i=0;i<5;i++)
            OFF_Y=OFF_Y+off_y[i];
          YBack=(OFF_Y-YMax-YMin)/3;
          OFF_Y=0;
        }
        //6-----
        if(YBack>=0)
        {
          LCD_P8x16Str(60,6,"x+");
          LCD_P8x16_number_5(80,6,YBack);
        }
        else
        {
          LCD_P8x16Str(60,6,"x-");
          LCD_P8x16_number_5(80,6,-YBack);
        }
      }
      //显示---
      if(g_n1msEventCount==0)
      {   
        //上位机-----
        if(BufBegin==1)
        {
          if(g_nMotorPulseSigma>=0&&g_nMotorPulseSigma<2160)
          {
//            if(UpBuf1>=128)
//              UpBuf1=UpBuf1_pre;//UpBuf1=UpBuf1+UpBuf1/2;
          }
          if(g_nMotorPulseSigma>=2160&&g_nMotorPulseSigma<5040)
          {
            //UpBuf1=255;
          }
          else if(g_nMotorPulseSigma>=5040)
          {
//            if(UpBuf1<128)
//              UpBuf1=UpBuf1_pre;//UpBuf1=UpBuf1-UpBuf1/2;
          }
          uart_send1(UART3,UpBuf1);
        }
        //0-----
        if(PwmDuty<0) 
        {
          LCD_P8x16Str(60,0,"D:-");
          LCD_P8x16_number_4(85,0,-PwmDuty);
        }
        else
        {
          LCD_P8x16Str(60,0,"D:+");
          LCD_P8x16_number_4(85,0,PwmDuty);
        }
        //2-----
        LCD_P8x16Str(0,2,"B:");LCD_P8x16_number(30,2,PB1_flag);
        LCD_P8x16Str(60,2,"E:");LCD_P8x16_number(90,2,PE24_flag);
        //4-----
        LCD_P8x16Str(0,4,"Sok:");LCD_P8x16_number(30,4,StepOk);
        LCD_P8x16Str(60,4,"fir:");LCD_P8x16_number(90,4,first);
        //6-----
        if(g_nMotorPulseSigma>0)
        {
          LCD_P8x16Str(0,6,"P:+");
          LCD_P8x16_number_4(25,6,g_nMotorPulseSigma);
        }
        else
        {
          LCD_P8x16Str(0,6,"P:-");
          LCD_P8x16_number_4(25,6,-g_nMotorPulseSigma);
        }
      }
    }
  }
}

//---------system_init()---------
void system_init()
{   
  DisableInterrupts;
  
  //制动初始化
  gpio_init(PORTE , 25, 1, 0);
    
  //电量检测初化
  gpio_init(PORTE , 3, 1, 0);
  hw_adc_init(1);
  //电量指示灯初始化
  gpio_init(PORTB , 3, 1, 0);
  
  //半桥驱动初始化
  gpio_init(PORTC , 4, 1, 0);
  gpio_init(PORTC , 6, 1, 0);
  
  gpio_ctrl(PORTC,4,1);
  gpio_ctrl(PORTC,6,0);
  
  //OLED液晶初始化
  LCD_Init();
  
  //NRF24L01
  init_nrf24l01_io();
  
  //直流电机初始化 
  FTM_PWM_Init(0,1000);//10khz                       //电机频率初始化 pwm频率为10kHz，周期0.1ms
  FTM_PWM_Open(0,2,0);
  PID_SetKpid(1.7,0.05,0.3);                   //速度PID初始化参数设置
  PID_SetPoint(300);                          //初始加速度设定
  
  //编码器初始化
  FTM2_QUAD_Iint();
  
  //步进电机初始化
  /* Turn on all port clocks */
  SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
  PORT_PCR_REG(PORTB_BASE_PTR,9)=(0|PORT_PCR_MUX(1))|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;//DIR0 PB9
  GPIO_PDDR_REG(DIR_PORT_BASE) |= (1<<9);//Dir:OUT
  
  DIR_LEFT_F;

  FTM_PWM_Init(1,500); //500
  FTM1_SC|=FTM_SC_TOIE_MASK;
  FTM_PWM_Open(1,0,0);
  
  //限位开关的IO口中断初始化
  //PORTB1
  SIM_SCGC5|=SIM_SCGC5_PORTB_MASK;// 启用PORTB时钟
  PORTB_PCR1=(1<<8)|(0x9<<16);  // GPIO , 上升边沿触发 ,开启下拉电阻 
  GPIOB_PDDR &= ~(1<<1);           // 中断必须是输入模式
  PORTB_DFER|=(1<<1);
  PORTB_DFWR|=0x1f;
  //enable_irq(88);                 // 启用PORTB中断*/
  //PORTE24
  SIM_SCGC5|=SIM_SCGC5_PORTE_MASK;// 启用PORTE时钟
  PORTE_PCR24=(1<<8)|(0x9<<16);  // GPIO , 上升边沿触发 ,开启下拉电阻 
  GPIOE_PDDR &= ~(1<<24);           // 中断必须是输入模式
  PORTE_DFER|=(1<<24);
  PORTE_DFWR|=0x1f;
  enable_irq(91);                 // 启用PORTE中断*/
  
  
  //可调参数初始化
  //AdjustPara();
  
  //串口初始化
  uart_init(UART3,periph_clk_khz,9600);
  enableuartreint(UART3,UART3irq);
  
  //PIT0中断初始化
  hw_pit_init(0,60000);                       //配置pit定时器0,1ms中断(60000)
  enable_pit_interrupt(0);                    //开pit中断0通道
  set_irq_priority (68,0);
  
  //计时PIT1
  //hw_pit_init(1,6000000);                       //配置pit定时器0,1ms中断(60000)
  //enable_pit_interrupt(1);                    //开pit中断0通道
  
  EnableInterrupts;                           //开启总中断,中断开启后，此刻就进行1ms的定时吗？
}


//---------AdjustPara()------------------------------------------------------------
void AdjustPara()
{
  while(1)
   {
      //---
      //break;
      //user GUI
      LCD_P8x16Str(0,0,"SSrt:1"); LCD_P8x16Str(70,0,"PBack:5");
      LCD_P8x16Str(0,2,"SBack1:2");
      LCD_P8x16Str(0,4,"SSop:3");
      LCD_P8x16Str(0,6,"SBack2:4");

      matrix_keyboard_init();
      key_no=keyboard_scan();
      
      delay_ms(110);

      //1号按键按下的时候调节SecStart
      if(key_no==1)
       {
        key_no=255;
        BK=1;
        LCD_CLS();
        while(BK==1)
        {
          LCD_P8x16Str(0,0,"SSrt:");
          LCD_P8x16_number_4(60,0,SecStart);
          
          LCD_P8x16Str(0,2,"+:");
          LCD_P8x16Str(60,2,"Key7");
          LCD_P8x16Str(0,4,"-:");
          LCD_P8x16Str(60,4,"Key8");
          LCD_P8x16Str(0,6,"Re:");
          LCD_P8x16Str(60,6,"Key9");
          
          delay_ms(110);
          matrix_keyboard_init();
          key_num=keyboard_scan();
          if(key_num!=255)
          {
            key_no=key_num;
          }          

          if(key_no==7)
          {
            SecStart=SecStart+10;
            key_no=255;
          }
        
          if(key_no==8)
          {
            SecStart=SecStart-10;
            key_no=255;
          }
        
          if(key_no==9)
          {
            BK=255;
            key_no=255;
            key_num=255;
          }
        }
        LCD_CLS();
      }
      
      //2号按键按下的时候调节SecBack1
      if(key_no==2)
       {
        key_no=255;
        BK=2;
        LCD_CLS();
        while(BK==2)
        {
          delay_ms(110);
          matrix_keyboard_init();
          key_num=keyboard_scan();
          if(key_num!=255)
          {
            key_no=key_num;
          }          
          LCD_P8x16Str(0,0,"SBack1:");
          LCD_P8x16_number_4(60,0,SecBack1);
          
          LCD_P8x16Str(0,2,"+:");
          LCD_P8x16Str(60,2,"Key4");
          LCD_P8x16Str(0,4,"-:");
          LCD_P8x16Str(60,4,"Key5");
          LCD_P8x16Str(0,6,"Re:");
          LCD_P8x16Str(60,6,"Key6");
          
          if(key_no==7)
          {
            SecBack1=SecBack1+10;
            key_no=255;
          }
        
          if(key_no==8)
          {
            SecBack1=SecBack1-10;
            key_no=255;
          }
        
          if(key_no==9)
          {
            BK=255;
            key_no=255;
          }
        }
        LCD_CLS();
       }
      //3号按键按下的时候调节SecStop
      if(key_no==3)
       {
        key_no=255;
        BK=3;
        LCD_CLS();
        while(BK==3)
        {
          delay_ms(110);
          matrix_keyboard_init();
          key_num=keyboard_scan();
          if(key_num!=255)
          {
            key_no=key_num;
          }          
          LCD_P8x16Str(0,0,"SSop:");
          LCD_P8x16_number_4(60,0,SecStop);
          
          LCD_P8x16Str(0,2,"+:");
          LCD_P8x16Str(60,2,"Key4");
          LCD_P8x16Str(0,4,"-:");
          LCD_P8x16Str(60,4,"Key5");
          LCD_P8x16Str(0,6,"Re:");
          LCD_P8x16Str(60,6,"Key6");
          
          if(key_no==7)
          {
            SecStop=SecStop+10;
            key_no=255;
          }
        
          if(key_no==8)
          {
            SecStop=SecStop-10;
            key_no=255;
          }
        
          if(key_no==9)
          {
            BK=255;
            key_no=255;
          }
        }
        LCD_CLS();
       }
      
      //4号按键按下的时候调节SecBack2
      if(key_no==4)
       {
        key_no=255;
        BK=4;
        LCD_CLS();
        while(BK==4)
        {
          delay_ms(110);
          matrix_keyboard_init();
          key_num=keyboard_scan();
          if(key_num!=255)
          {
            key_no=key_num;
          }          
          LCD_P8x16Str(0,0,"SBack2:");
          LCD_P8x16_number_4(60,0,SecBack2);
          
          LCD_P8x16Str(0,2,"+:");
          LCD_P8x16Str(60,2,"Key4");
          LCD_P8x16Str(0,4,"-:");
          LCD_P8x16Str(60,4,"Key5");
          LCD_P8x16Str(0,6,"Re:");
          LCD_P8x16Str(60,6,"Key6");
          
          if(key_no==7)
          {
            SecBack2=SecBack2+10;
            key_no=255;
          }
        
          if(key_no==8)
          {
            SecBack2=SecBack2-10;
            key_no=255;
          }
        
          if(key_no==9)
          {
            BK=255;
            key_no=255;
          }
        }
        LCD_CLS();
       }//PwmBack
      //5号按键按下的时候调节PwmBack
      if(key_no==5)
       {
        key_no=255;
        BK=5;
        LCD_CLS();
        while(BK==5)
        {
          delay_ms(110);
          matrix_keyboard_init();
          key_num=keyboard_scan();
          if(key_num!=255)
          {
            key_no=key_num;
          }          
          LCD_P8x16Str(0,0,"PBack:");
          LCD_P8x16_number_4(60,0,PwmBack);
          
          LCD_P8x16Str(0,2,"+:");
          LCD_P8x16Str(60,2,"Key4");
          LCD_P8x16Str(0,4,"-:");
          LCD_P8x16Str(60,4,"Key5");
          LCD_P8x16Str(0,6,"Re:");
          LCD_P8x16Str(60,6,"Key6");
          
          if(key_no==7)
          {
            PwmBack=PwmBack+5;
            key_no=255;
          }
        
          if(key_no==8)
          {
            PwmBack=PwmBack-5;
            key_no=255;
          }
        
          if(key_no==9)
          {
            BK=255;
            key_no=255;
          }
        }
        LCD_CLS();
       }/*
      //6号按键按下的时候调节QPX_SET
      if(key_no==6)
       {
        key_no=255;
        BK=6;
        LCD_CLS();
        while(BK==6)
        {
          delay_ms(110);
          matrix_keyboard_init();
          key_num=keyboard_scan();
          if(key_num!=255)
          {
            key_no=key_num;
          }          
          LCD_P8x16Str(0,0,"QPX_S:");

          LCD_P8x16Str(0,2,"+:");
          LCD_P8x16Str(60,2,"Key4");
          LCD_P8x16Str(0,4,"-:");
          LCD_P8x16Str(60,4,"Key5");
          LCD_P8x16Str(0,6,"Re:");
          LCD_P8x16Str(60,6,"Key6");
          
          if(key_no==7)
          {
   
            key_no=255;
          }
        
          if(key_no==8)
          {
         
            key_no=255;
          }
        
          if(key_no==9)
          {
            BK=255;
            key_no=255;
          }
        }
        LCD_CLS();
       }*/
     //10号按键按下 采集数据
     if(key_no==10)
     {
       key_no=255;
       LCD_CLS();
       break;
     }
   } 
}

