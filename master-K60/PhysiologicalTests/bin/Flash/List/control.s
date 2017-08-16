///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       12/Apr/2015  12:35:15
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\C\Component_C\control.c
//    Command line =  
//        C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\C\Component_C\control.c
//        -D IAR -D TWR_K60N512 -lCN
//        C:\Users\Administrator\Desktop\PhysiologicalTests\bin\Flash\List\ -lB
//        C:\Users\Administrator\Desktop\PhysiologicalTests\bin\Flash\List\ -o
//        C:\Users\Administrator\Desktop\PhysiologicalTests\bin\Flash\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M4 -e --fpu=None --dlib_config "D:\MyProgramFiles\iar
//        for arm v7.1\arm\INC\c\DLib_Config_Normal.h" -I
//        C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\H\ -I
//        C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\H\Component_H\
//        -I
//        C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\H\Frame_H\
//        -Ol --use_c++_inline
//    List file    =  
//        C:\Users\Administrator\Desktop\PhysiologicalTests\bin\Flash\List\control.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN FTM_PWM_ChangeDuty
        EXTERN HONGWAI_L
        EXTERN HONGWAI_R
        EXTERN IncPID_Calculate
        EXTERN PMAX
        EXTERN __aeabi_d2iz
        EXTERN __aeabi_dadd
        EXTERN __aeabi_dmul
        EXTERN __aeabi_dsub
        EXTERN __aeabi_i2d
        EXTERN gpio_init
        EXTERN hongwai_l
        EXTERN hongwai_r
        EXTERN hw_ad_ave
        EXTERN speed
        EXTERN speed_B
        EXTERN speed_jian

        PUBLIC Abs
        PUBLIC Car_Control_PWM
        PUBLIC GetMotorPulse
        PUBLIC GetOFFSET
        PUBLIC GetSamplezhi
        PUBLIC Pmax
        PUBLIC Pmin
        PUBLIC Psha
        PUBLIC Speed_PID
        PUBLIC g_fCarSpeed
        PUBLIC g_fCarSpeedstart
        PUBLIC g_fMotorOut
        PUBLIC g_fSpeedControlIntegral
        PUBLIC g_fSpeedControlOut
        PUBLIC g_fSpeedControlOutNew
        PUBLIC g_fSpeedControlOutOld
        PUBLIC g_lnInputVoltageSigma
        PUBLIC g_nInputVoltage
        PUBLIC g_nMotorPulse
        PUBLIC g_nMotorPulseSigma
        PUBLIC g_nRightMotorPulse
        PUBLIC g_nSpeedControlPeriod
        PUBLIC get_ad
        PUBLIC gravity
        PUBLIC pulse_count
        PUBLIC pulse_count_pre
        PUBLIC shache1
        PUBLIC speed_pwm
        PUBLIC voltage_gravity
        PUBLIC x
        PUBLIC y

// C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\C\Component_C\control.c
//    1 #include "includes.h"
//    2 //------------------------------------------------------------------------------

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    3 int16   g_nInputVoltage[5]={0};
g_nInputVoltage:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    4 int32	g_lnInputVoltageSigma[5]={0};    	
g_lnInputVoltageSigma:
        DS8 20
//    5 #define VOLTAGE_GRAVITY                     g_nInputVoltage[0]
//    6 #define VOLTAGE_GYRO                        g_nInputVoltage[1]
//    7 
//    8 //-----------

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    9 float g_fCarSpeed=0;
g_fCarSpeed:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   10 float g_fCarSpeedstart=0;
g_fCarSpeedstart:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   11 int16 g_nMotorPulse=0;
g_nMotorPulse:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   12 int16 g_nRightMotorPulse=0;
g_nRightMotorPulse:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   13 float g_fSpeedControlIntegral=0;
g_fSpeedControlIntegral:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   14 float g_fSpeedControlOutOld =0;
g_fSpeedControlOutOld:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   15 float g_fSpeedControlOutNew =0;
g_fSpeedControlOutNew:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   16 float g_fSpeedControlOut =0;
g_fSpeedControlOut:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   17 uint8 g_nSpeedControlPeriod =0;
g_nSpeedControlPeriod:
        DS8 1
//   18 
//   19 //------------

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   20 float g_fMotorOut=0;
g_fMotorOut:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   21 int16 g_nMotorPulseSigma =0;
g_nMotorPulseSigma:
        DS8 2
//   22 
//   23 extern int16 speedflag;
//   24 //----------------------------------------------------------------------------------------------------

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   25 int16   gravity,voltage_gravity;
gravity:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
voltage_gravity:
        DS8 2
//   26 extern  int16   hongwai_l,hongwai_r;
//   27 extern  int16   HONGWAI_L,HONGWAI_R;
//   28 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   29 void GetSamplezhi()
//   30 {
GetSamplezhi:
        PUSH     {R7,LR}
//   31   g_lnInputVoltageSigma[0]+= hw_ad_ave(0,17,12,20);//左1   
        MOVS     R3,#+20
        MOVS     R2,#+12
        MOVS     R1,#+17
        MOVS     R0,#+0
        BL       hw_ad_ave
        LDR.N    R1,??DataTable5
        LDR      R1,[R1, #+0]
        UXTAH    R0,R1,R0
        LDR.N    R1,??DataTable5
        STR      R0,[R1, #+0]
//   32   g_lnInputVoltageSigma[1]+= hw_ad_ave(1,7,12,20);//右1
        MOVS     R3,#+20
        MOVS     R2,#+12
        MOVS     R1,#+7
        MOVS     R0,#+1
        BL       hw_ad_ave
        LDR.N    R1,??DataTable5
        LDR      R1,[R1, #+4]
        UXTAH    R0,R1,R0
        LDR.N    R1,??DataTable5
        STR      R0,[R1, #+4]
//   33   //g_lnInputVoltageSigma[2]+= hw_ad_ave(0,12,12,20);
//   34 }
        POP      {R0,PC}          ;; return
//   35 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   36 void GetOFFSET()
//   37 {
//   38   HONGWAI_L=g_lnInputVoltageSigma[0]/200;
GetOFFSET:
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        MOVS     R1,#+200
        SDIV     R0,R0,R1
        LDR.N    R1,??DataTable5_1
        STRH     R0,[R1, #+0]
//   39   HONGWAI_R=g_lnInputVoltageSigma[1]/200;
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+4]
        MOVS     R1,#+200
        SDIV     R0,R0,R1
        LDR.N    R1,??DataTable5_2
        STRH     R0,[R1, #+0]
//   40   //gyro_direction= g_lnInputVoltageSigma[2]/200;  
//   41 }
        BX       LR               ;; return
//   42 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   43 void get_ad()
//   44 {
get_ad:
        PUSH     {R7,LR}
//   45   hongwai_l = hw_ad_ave(0,17,12,20);              
        MOVS     R3,#+20
        MOVS     R2,#+12
        MOVS     R1,#+17
        MOVS     R0,#+0
        BL       hw_ad_ave
        LDR.N    R1,??DataTable5_3
        STRH     R0,[R1, #+0]
//   46   hongwai_r = hw_ad_ave(1,7,12,20);                   
        MOVS     R3,#+20
        MOVS     R2,#+12
        MOVS     R1,#+7
        MOVS     R0,#+1
        BL       hw_ad_ave
        LDR.N    R1,??DataTable5_4
        STRH     R0,[R1, #+0]
//   47   //DIR_CONTROL_D_VALUE = hw_ad_ave(0,12,12,20);            //---------得转向陀螺仪电压信号(PTB2)
//   48 }
        POP      {R0,PC}          ;; return
//   49 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   50 int Abs(int a)
//   51 {
//   52   int i;
//   53   i=a;
//   54   if(i<0) i=-a;
Abs:
        CMP      R0,#+0
        BPL.N    ??Abs_0
        RSBS     R0,R0,#+0
        B.N      ??Abs_1
//   55   else i=a;
//   56   return i;
??Abs_0:
??Abs_1:
        BX       LR               ;; return
//   57 }        
//   58 //-----------------------速度控制-------------------------------------------------------//

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   59         int32    pulse_count=0,pulse_count_pre=0;
pulse_count:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
pulse_count_pre:
        DS8 4
//   60 extern  int16    speed;

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   61         int16    speed_pwm=0;
speed_pwm:
        DS8 2
//   62 extern  int16    speed_B;
//   63 extern  int16    speed_jian;
//   64 extern  int16    PMAX;

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   65         int16    Psha=60;        
Psha:
        DATA
        DC16 60
//   66 //----------------------------------测速---------------------------------------        

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   67 void GetMotorPulse()
//   68 {
//   69   uint32 nPulse;
//   70   nPulse=FTM2_CNT;                     
GetMotorPulse:
        LDR.N    R0,??DataTable5_5  ;; 0x400b8004
        LDR      R0,[R0, #+0]
//   71   g_nMotorPulse = (int32)nPulse;      
        LDR.N    R1,??DataTable5_6
        STRH     R0,[R1, #+0]
//   72   g_nMotorPulseSigma +=g_nMotorPulse;
        LDR.N    R0,??DataTable5_7
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable5_6
        LDRH     R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDR.N    R1,??DataTable5_7
        STRH     R0,[R1, #+0]
//   73   FTM2_CNT=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_5  ;; 0x400b8004
        STR      R0,[R1, #+0]
//   74 }
        BX       LR               ;; return
//   75 
//   76 //----------------------------------刹车1---------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   77 void shache1()//条件得封闭
//   78 { 
//   79 }
shache1:
        BX       LR               ;; return
//   80 
//   81 //---------------------------------------------------------------

        SECTION `.bss`:DATA:REORDER:NOROOT(3)
//   82 double  x=0.0,y=0.0;
x:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(3)
y:
        DS8 8

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   83 int16   Pmax=250,Pmin=0;   
Pmax:
        DATA
        DC16 250

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
Pmin:
        DS8 2
//   84 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   85 void Speed_PID()
//   86 {
Speed_PID:
        PUSH     {R4-R6,LR}
//   87     pulse_count=g_nMotorPulseSigma; 
        LDR.N    R0,??DataTable5_7
        LDRSH    R0,[R0, #+0]
        LDR.N    R1,??DataTable5_8
        STR      R0,[R1, #+0]
//   88     g_nMotorPulseSigma=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_7
        STRH     R0,[R1, #+0]
//   89 
//   90     //最高速度限制
//   91     if(pulse_count>PMAX) 
        LDR.N    R0,??DataTable5_9
        LDRSH    R0,[R0, #+0]
        LDR.N    R1,??DataTable5_8
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??Speed_PID_0
//   92       speed = speed-speed_jian;//控制效果明显
        LDR.N    R0,??DataTable5_10
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable5_11
        LDRH     R1,[R1, #+0]
        SUBS     R0,R0,R1
        LDR.N    R1,??DataTable5_10
        STRH     R0,[R1, #+0]
//   93 
//   94     //刹车函数-------
//   95     //-m1-//
//   96     x=(double)((Psha-pulse_count)/((Pmax-Pmin)/3));
??Speed_PID_0:
        LDR.N    R0,??DataTable5_12
        LDRSH    R0,[R0, #+0]
        LDR.N    R1,??DataTable5_13
        LDRSH    R1,[R1, #+0]
        SUBS     R0,R0,R1
        MOVS     R1,#+3
        SDIV     R0,R0,R1
        LDR.N    R1,??DataTable5_14
        LDRSH    R1,[R1, #+0]
        LDR.N    R2,??DataTable5_8
        LDR      R2,[R2, #+0]
        SUBS     R1,R1,R2
        SDIV     R0,R1,R0
        BL       __aeabi_i2d
        LDR.N    R2,??DataTable5_15
        STRD     R0,R1,[R2, #+0]
//   97     //y=(double)((Pset-pulse_count)/((Pmax-Pmin)/3));
//   98     speed_B=(int16)((x-1/6*x*x*x+3*x*x*x*x*x)-300);//250
        LDR.N    R0,??DataTable5_15
        LDRD     R2,R3,[R0, #+0]
        MOVS     R0,#+0
        MOVS     R1,#+0
        BL       __aeabi_dmul
        LDR.N    R4,??DataTable5_15
        LDRD     R2,R3,[R4, #+0]
        BL       __aeabi_dmul
        LDR.N    R4,??DataTable5_15
        LDRD     R2,R3,[R4, #+0]
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        LDR.N    R4,??DataTable5_15
        LDRD     R0,R1,[R4, #+0]
        BL       __aeabi_dsub
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable5_15
        LDRD     R2,R3,[R0, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_16  ;; 0x40080000
        BL       __aeabi_dmul
        LDR.N    R6,??DataTable5_15
        LDRD     R2,R3,[R6, #+0]
        BL       __aeabi_dmul
        LDR.N    R6,??DataTable5_15
        LDRD     R2,R3,[R6, #+0]
        BL       __aeabi_dmul
        LDR.N    R6,??DataTable5_15
        LDRD     R2,R3,[R6, #+0]
        BL       __aeabi_dmul
        LDR.N    R6,??DataTable5_15
        LDRD     R2,R3,[R6, #+0]
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R2,#+0
        LDR.N    R3,??DataTable5_17  ;; 0xc072c000
        BL       __aeabi_dadd
        BL       __aeabi_d2iz
        LDR.N    R1,??DataTable5_18
        STRH     R0,[R1, #+0]
//   99     /*//-m2-//
//  100     x=-(double)((pulse_count-Psha)/((Pmax-Pmin)/10));
//  101     speed_B=(int16)(x*x*x-200);*/
//  102     //--------------------------------------------- 
//  103     speed_pwm=(int16)(speed+IncPID_Calculate(pulse_count*19/10));
        LDR.N    R0,??DataTable5_8
        LDR      R0,[R0, #+0]
        MOVS     R1,#+19
        MULS     R0,R1,R0
        MOVS     R1,#+10
        SDIV     R0,R0,R1
        BL       IncPID_Calculate
        LDR.N    R1,??DataTable5_10
        LDRH     R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR.N    R1,??DataTable5_19
        STRH     R0,[R1, #+0]
//  104     
//  105     //限幅
//  106     if(speed_pwm>1250)
        LDR.N    R0,??DataTable5_19
        LDRSH    R0,[R0, #+0]
        MOVW     R1,#+1251
        CMP      R0,R1
        BLT.N    ??Speed_PID_1
//  107       speed_pwm=1250;
        MOVW     R0,#+1250
        LDR.N    R1,??DataTable5_19
        STRH     R0,[R1, #+0]
//  108     if(speed_pwm<-1250)
??Speed_PID_1:
        LDR.N    R0,??DataTable5_19
        LDRSH    R0,[R0, #+0]
        LDR.N    R1,??DataTable5_20  ;; 0xfffffb1e
        CMP      R0,R1
        BGE.N    ??Speed_PID_2
//  109       speed_pwm=-1250;
        LDR.N    R0,??DataTable5_20  ;; 0xfffffb1e
        LDR.N    R1,??DataTable5_19
        STRH     R0,[R1, #+0]
//  110     
//  111     //输出
//  112     if(speed_pwm>0) 
??Speed_PID_2:
        LDR.N    R0,??DataTable5_19
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+1
        BLT.N    ??Speed_PID_3
//  113     {
//  114       gpio_init(PORTB, 9, 1,0);//DIL_B;
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+9
        LDR.N    R0,??DataTable5_21  ;; 0x400ff040
        BL       gpio_init
//  115       FTM1_C0V=speed_pwm;
        LDR.N    R0,??DataTable5_19
        LDRSH    R0,[R0, #+0]
        LDR.N    R1,??DataTable5_22  ;; 0x40039010
        STR      R0,[R1, #+0]
        B.N      ??Speed_PID_4
//  116     }
//  117     else 
//  118     {
//  119       gpio_init(PORTB, 9, 1,1);//DIL_F;
??Speed_PID_3:
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+9
        LDR.N    R0,??DataTable5_21  ;; 0x400ff040
        BL       gpio_init
//  120       FTM1_C0V=1250+speed_pwm;
        LDR.N    R0,??DataTable5_19
        LDRSH    R0,[R0, #+0]
        ADDW     R0,R0,#+1250
        LDR.N    R1,??DataTable5_22  ;; 0x40039010
        STR      R0,[R1, #+0]
//  121     }
//  122 }
??Speed_PID_4:
        POP      {R4-R6,PC}       ;; return
//  123 
//  124 //-----------------------------------------------------------------------
//  125 #define Car_Control_MAX 3750
//  126 #define Car_Control_MIN -3750
//  127 #define Car_Control_MOD 3750
//  128 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  129 void Car_Control_PWM(uint8 motor,int pwmin)
//  130 {    
Car_Control_PWM:
        PUSH     {R7,LR}
//  131     if(pwmin>0)
        CMP      R1,#+1
        BLT.N    ??Car_Control_PWM_0
//  132     {
//  133         if(motor==MOTOR_LEFT)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??Car_Control_PWM_1
//  134         {
//  135             if(pwmin>Car_Control_MAX)
        MOVW     R0,#+3751
        CMP      R1,R0
        BLT.N    ??Car_Control_PWM_2
//  136                pwmin=Car_Control_MAX;
        MOVW     R1,#+3750
//  137             DIR_LEFT_F;
??Car_Control_PWM_2:
        LDR.N    R0,??DataTable5_21  ;; 0x400ff040
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x200
        LDR.N    R1,??DataTable5_21  ;; 0x400ff040
        STR      R0,[R1, #+0]
//  138             FTM_PWM_ChangeDuty(1,0,8000);
        MOV      R2,#+8000
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       FTM_PWM_ChangeDuty
        B.N      ??Car_Control_PWM_3
//  139         }
//  140         else
//  141         {
//  142             if(pwmin>Car_Control_MAX)
??Car_Control_PWM_1:
        MOVW     R0,#+3751
        CMP      R1,R0
        BLT.N    ??Car_Control_PWM_4
//  143                pwmin=Car_Control_MAX;
        MOVW     R1,#+3750
//  144             DIR_RIGHT_F;
??Car_Control_PWM_4:
        LDR.N    R0,??DataTable5_21  ;; 0x400ff040
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x1000
        LDR.N    R1,??DataTable5_21  ;; 0x400ff040
        STR      R0,[R1, #+0]
//  145             FTM_PWM_ChangeDuty(1,0,8000);
        MOV      R2,#+8000
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       FTM_PWM_ChangeDuty
        B.N      ??Car_Control_PWM_3
//  146         }
//  147     }
//  148     else if(pwmin==0)
??Car_Control_PWM_0:
        CMP      R1,#+0
        BNE.N    ??Car_Control_PWM_5
//  149     {
//  150         if(motor==MOTOR_LEFT)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??Car_Control_PWM_6
//  151         {
//  152             DIR_LEFT_F;
        LDR.N    R0,??DataTable5_21  ;; 0x400ff040
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x200
        LDR.N    R1,??DataTable5_21  ;; 0x400ff040
        STR      R0,[R1, #+0]
//  153             FTM_PWM_ChangeDuty(1,0,0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       FTM_PWM_ChangeDuty
        B.N      ??Car_Control_PWM_3
//  154         }
//  155         else
//  156         {
//  157             DIR_RIGHT_F;
??Car_Control_PWM_6:
        LDR.N    R0,??DataTable5_21  ;; 0x400ff040
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x1000
        LDR.N    R1,??DataTable5_21  ;; 0x400ff040
        STR      R0,[R1, #+0]
//  158             FTM_PWM_ChangeDuty(1,0,0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       FTM_PWM_ChangeDuty
        B.N      ??Car_Control_PWM_3
//  159         }
//  160     }
//  161     else
//  162     {
//  163         if(motor==MOTOR_LEFT)
??Car_Control_PWM_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??Car_Control_PWM_7
//  164         {
//  165             if(pwmin<Car_Control_MIN)
        LDR.N    R0,??DataTable5_23  ;; 0xfffff15a
        CMP      R1,R0
        BGE.N    ??Car_Control_PWM_8
//  166               pwmin=Car_Control_MIN;
        LDR.N    R1,??DataTable5_23  ;; 0xfffff15a
//  167             DIR_LEFT_B;
??Car_Control_PWM_8:
        LDR.N    R0,??DataTable5_21  ;; 0x400ff040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200
        LDR.N    R1,??DataTable5_21  ;; 0x400ff040
        STR      R0,[R1, #+0]
//  168             FTM_PWM_ChangeDuty(1,0,8000);
        MOV      R2,#+8000
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       FTM_PWM_ChangeDuty
        B.N      ??Car_Control_PWM_3
//  169         }
//  170         else
//  171         {
//  172             if(pwmin<Car_Control_MIN)
??Car_Control_PWM_7:
        LDR.N    R0,??DataTable5_23  ;; 0xfffff15a
        CMP      R1,R0
        BGE.N    ??Car_Control_PWM_9
//  173               pwmin=Car_Control_MIN;
        LDR.N    R1,??DataTable5_23  ;; 0xfffff15a
//  174             DIR_RIGHT_B;
??Car_Control_PWM_9:
        LDR.N    R0,??DataTable5_21  ;; 0x400ff040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.N    R1,??DataTable5_21  ;; 0x400ff040
        STR      R0,[R1, #+0]
//  175             FTM_PWM_ChangeDuty(1,0,8000);
        MOV      R2,#+8000
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       FTM_PWM_ChangeDuty
//  176         }
//  177     }
//  178 }
??Car_Control_PWM_3:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     g_lnInputVoltageSigma

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     HONGWAI_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     HONGWAI_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     hongwai_l

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     hongwai_r

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     0x400b8004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     g_nMotorPulse

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     g_nMotorPulseSigma

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     pulse_count

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     PMAX

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     speed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     speed_jian

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_12:
        DC32     Pmax

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_13:
        DC32     Pmin

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_14:
        DC32     Psha

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_15:
        DC32     x

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_16:
        DC32     0x40080000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_17:
        DC32     0xc072c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_18:
        DC32     speed_B

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_19:
        DC32     speed_pwm

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_20:
        DC32     0xfffffb1e

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_21:
        DC32     0x400ff040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_22:
        DC32     0x40039010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_23:
        DC32     0xfffff15a

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
//  99 bytes in section .bss
//   4 bytes in section .data
// 828 bytes in section .text
// 
// 828 bytes of CODE memory
// 103 bytes of DATA memory
//
//Errors: none
//Warnings: none
