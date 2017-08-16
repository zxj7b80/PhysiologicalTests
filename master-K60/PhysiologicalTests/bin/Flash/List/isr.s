///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       24/Jun/2015  14:03:30
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\ZXJ\Desktop\人体生理指数测试系统\下位机\K60 new
//        board\PhysiologicalTests\src\Sources\C\isr.c
//    Command line =  
//        "C:\Users\ZXJ\Desktop\人体生理指数测试系统\下位机\K60 new
//        board\PhysiologicalTests\src\Sources\C\isr.c" -D IAR -D TWR_K60N512
//        -lCN "C:\Users\ZXJ\Desktop\人体生理指数测试系统\下位机\K60 new
//        board\PhysiologicalTests\bin\Flash\List\" -lB
//        "C:\Users\ZXJ\Desktop\人体生理指数测试系统\下位机\K60 new
//        board\PhysiologicalTests\bin\Flash\List\" -o
//        "C:\Users\ZXJ\Desktop\人体生理指数测试系统\下位机\K60 new
//        board\PhysiologicalTests\bin\Flash\Obj\" --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4 -e --fpu=None
//        --dlib_config "D:\MyProgramFiles\IAR
//        V7.1\arm\INC\c\DLib_Config_Normal.h" -I
//        "C:\Users\ZXJ\Desktop\人体生理指数测试系统\下位机\K60 new
//        board\PhysiologicalTests\src\Sources\H\" -I
//        "C:\Users\ZXJ\Desktop\人体生理指数测试系统\下位机\K60 new
//        board\PhysiologicalTests\src\Sources\H\Component_H\" -I
//        "C:\Users\ZXJ\Desktop\人体生理指数测试系统\下位机\K60 new
//        board\PhysiologicalTests\src\Sources\H\Frame_H\" -Ol --use_c++_inline
//    List file    =  
//        C:\Users\ZXJ\Desktop\人体生理指数测试系统\下位机\K60 new
//        board\PhysiologicalTests\bin\Flash\List\isr.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN FTM_PWM_ChangeDuty
        EXTERN GetMotorPulse
        EXTERN IncPID_Calculate
        EXTERN MachineReset
        EXTERN PID_SetKpid
        EXTERN PID_SetPoint
        EXTERN YBack
        EXTERN disable_irq
        EXTERN enable_irq
        EXTERN enable_pit_interrupt
        EXTERN first
        EXTERN g_nMotorPulse
        EXTERN g_nMotorPulseSigma
        EXTERN gpio_ctrl
        EXTERN hw_ad_ave
        EXTERN test_start

        PUBLIC BVCnt
        PUBLIC BatteryVoltage
        PUBLIC BufBegin
        PUBLIC Duty
        PUBLIC FB
        PUBLIC FTM1_isr
        PUBLIC FTM_Count
        PUBLIC ForB
        PUBLIC GpioIntCnt
        PUBLIC GpioIntFlag
        PUBLIC IntCnt
        PUBLIC PB1
        PUBLIC PB1_flag
        PUBLIC PB1_isr
        PUBLIC PE24
        PUBLIC PE24_flag
        PUBLIC PE24_isr
        PUBLIC PowerLowFg
        PUBLIC PulseControl
        PUBLIC PwmBack
        PUBLIC PwmDuty
        PUBLIC PwmMid
        PUBLIC PwmSet
        PUBLIC PwmStart
        PUBLIC PwmStop
        PUBLIC ResetPulseSection
        PUBLIC SecBack1
        PUBLIC SecBack2
        PUBLIC SecMid
        PUBLIC SecStart
        PUBLIC SecStop
        PUBLIC StepOk
        PUBLIC analyse_over
        PUBLIC base
        PUBLIC chainage
        PUBLIC cnt
        PUBLIC command_str
        PUBLIC dir
        PUBLIC g_n1msEventCount
        PUBLIC g_n1msEventFlag
        PUBLIC off_y
        PUBLIC pit0_isr
        PUBLIC pit1_cnt
        PUBLIC pit1_isr
        PUBLIC slow
        PUBLIC uart3_isr

// C:\Users\ZXJ\Desktop\人体生理指数测试系统\下位机\K60 new board\PhysiologicalTests\src\Sources\C\isr.c
//    1 //-------------------------------------------------------------------------*
//    2 // 文件名: isr.c                                                           *
//    3 // 说  明: 中断处理程序                                                     *
//    4 //-------------------------------------------------------------------------*
//    5 #include "includes.h"
//    6 #include "math.h"
//    7 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    8 uint8  g_n1msEventCount =0;
g_n1msEventCount:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    9 int    off_y[20]={0};
off_y:
        DS8 80
//   10 extern int   OFF_Y,YBack;
//   11 
//   12 extern uint8   BUF[8];

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   13 uint16 IntCnt=0;
IntCnt:
        DS8 2

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   14 uint16 base=100;
base:
        DATA
        DC16 100
//   15 // P             I                 D

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   16 uint16 SecStart=225,SecMid=60,SecStop=220,SecBack1=170,SecBack2=550;//0416
SecStart:
        DATA
        DC16 225

        SECTION `.data`:DATA:REORDER:NOROOT(1)
SecMid:
        DATA
        DC16 60

        SECTION `.data`:DATA:REORDER:NOROOT(1)
SecStop:
        DATA
        DC16 220

        SECTION `.data`:DATA:REORDER:NOROOT(1)
SecBack1:
        DATA
        DC16 170

        SECTION `.data`:DATA:REORDER:NOROOT(1)
SecBack2:
        DATA
        DC16 550
//   17                                                  //170回来不够
//   18 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   19 int32  PwmDuty=0;
PwmDuty:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   20 int32  Duty=0;
Duty:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   21 int32  PwmSet=0;
PwmSet:
        DS8 4
//   22 
//   23 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   24 uint32 PwmStart=5800;
PwmStart:
        DATA
        DC32 5800

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   25 uint32 PwmStop=8500;
PwmStop:
        DATA
        DC32 8500

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   26 uint32 PwmMid=4800;
PwmMid:
        DATA
        DC32 4800

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   27 uint32 PwmBack=4000;
PwmBack:
        DATA
        DC32 4000
//   28 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   29 uint8  dir=0;
dir:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   30 uint8  GpioIntFlag=0;
GpioIntFlag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   31 uint16 GpioIntCnt=0;
GpioIntCnt:
        DS8 2
//   32 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   33 uint8  g_n1msEventFlag=0;
g_n1msEventFlag:
        DS8 1
//   34 

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   35 uint16 pit1_cnt=0;
pit1_cnt:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   36 uint8 ForB=0;
ForB:
        DS8 1
//   37 
//   38 extern uint8 MachineReset;

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   39 uint8 slow=0;
slow:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   40 uint8 PB1=0,PE24=0;
PB1:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
PE24:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   41 uint8 StepOk=0;
StepOk:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   42 uint8 PB1_flag=0,PE24_flag=0;
PB1_flag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
PE24_flag:
        DS8 1
//   43 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   44 uint8 BufBegin=0;
BufBegin:
        DS8 1
//   45 
//   46 extern uint16 OutData[4];
//   47 extern int16 g_nMotorPulseSigma;
//   48 extern int16 g_nMotorPulse;

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   49 int16 PulseControl=0;
PulseControl:
        DS8 2
//   50 

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   51 int16  ResetPulseSection=0;
ResetPulseSection:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   52 uint8  FB=0;
FB:
        DS8 1
//   53 extern uint8 first;

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   54 int32  BatteryVoltage=0;
BatteryVoltage:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   55 int16  BVCnt=0;
BVCnt:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   56 uint8  PowerLowFg=0;
PowerLowFg:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   57 int16  chainage=0;
chainage:
        DS8 2
//   58 
//   59 //----------------------------------------------------------------
//   60 //pit0中断服务函数

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   61 void pit0_isr(void)                      //定时器1ms中断函数
//   62 {
pit0_isr:
        PUSH     {R7,LR}
//   63   DisableInterrupts;                     //关总中断
        CPSID i
//   64   g_n1msEventFlag=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable5
        STRB     R0,[R1, #+0]
//   65   PwmDuty=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable5_1
        STR      R0,[R1, #+0]
//   66   //运行---------------------------------------------------------
//   67   if(test_start==1&&PE24_flag==0&&first==0)
        LDR.W    R0,??DataTable5_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.W    ??pit0_isr_0
        LDR.W    R0,??DataTable5_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.W    ??pit0_isr_0
        LDR.W    R0,??DataTable5_4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.W    ??pit0_isr_0
//   68   {
//   69     IntCnt++;
        LDR.W    R0,??DataTable5_5
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5_5
        STRH     R0,[R1, #+0]
//   70     if(IntCnt==1)
        LDR.W    R0,??DataTable5_5
        LDRH     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??pit0_isr_1
//   71     {
//   72       ForB=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable5_6
        STRB     R0,[R1, #+0]
//   73       PwmDuty=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable5_1
        STR      R0,[R1, #+0]
//   74       gpio_ctrl(PORTE,25,0);
        MOVS     R2,#+0
        MOVS     R1,#+25
        LDR.W    R0,??DataTable5_7  ;; 0x400ff100
        BL       gpio_ctrl
        B.N      ??pit0_isr_0
//   75     }
//   76     else if(IntCnt>1 && IntCnt<base)
??pit0_isr_1:
        LDR.W    R0,??DataTable5_5
        LDRH     R0,[R0, #+0]
        CMP      R0,#+2
        BLT.N    ??pit0_isr_2
        LDR.W    R0,??DataTable5_5
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable5_8
        LDRH     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??pit0_isr_2
//   77       PwmDuty=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable5_1
        STR      R0,[R1, #+0]
        B.N      ??pit0_isr_0
//   78     else
//   79     {
//   80       IntCnt=base+1;
??pit0_isr_2:
        LDR.W    R0,??DataTable5_8
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5_5
        STRH     R0,[R1, #+0]
//   81       if(g_nMotorPulseSigma<=450+chainage)
        LDR.W    R0,??DataTable5_9
        LDRSH    R0,[R0, #+0]
        ADDS     R0,R0,#+450
        LDR.W    R1,??DataTable5_10
        LDRSH    R1,[R1, #+0]
        CMP      R0,R1
        BLT.N    ??pit0_isr_3
//   82       {
//   83         BufBegin=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable5_11
        STRB     R0,[R1, #+0]
//   84         ForB=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable5_6
        STRB     R0,[R1, #+0]
//   85         gpio_ctrl(PORTC,4,1);//Brown//正
        MOVS     R2,#+1
        MOVS     R1,#+4
        LDR.W    R0,??DataTable5_12  ;; 0x400ff080
        BL       gpio_ctrl
//   86         gpio_ctrl(PORTC,6,0);//Gray
        MOVS     R2,#+0
        MOVS     R1,#+6
        LDR.W    R0,??DataTable5_12  ;; 0x400ff080
        BL       gpio_ctrl
//   87         PID_SetPoint(1000);
        MOV      R0,#+1000
        BL       PID_SetPoint
//   88         PID_SetKpid(2.2,0.5,0);
        MOVS     R2,#+0
        MOVS     R1,#+1056964608
        LDR.W    R0,??DataTable5_13  ;; 0x400ccccd
        BL       PID_SetKpid
//   89         PwmDuty=(int16)(IncPID_Calculate(YBack))+5200;
        LDR.W    R0,??DataTable5_14
        LDR      R0,[R0, #+0]
        BL       IncPID_Calculate
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        ADD      R0,R0,#+5120
        ADDS     R0,R0,#+80
        LDR.W    R1,??DataTable5_1
        STR      R0,[R1, #+0]
        B.N      ??pit0_isr_4
//   90       }
//   91       else if(g_nMotorPulseSigma>450+chainage)
??pit0_isr_3:
        LDR.W    R0,??DataTable5_9
        LDRSH    R0,[R0, #+0]
        ADDS     R0,R0,#+450
        LDR.W    R1,??DataTable5_10
        LDRSH    R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??pit0_isr_4
//   92       {
//   93         ForB=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable5_6
        STRB     R0,[R1, #+0]
//   94         gpio_ctrl(PORTC,4,0);//Brown//反
        MOVS     R2,#+0
        MOVS     R1,#+4
        LDR.W    R0,??DataTable5_12  ;; 0x400ff080
        BL       gpio_ctrl
//   95         gpio_ctrl(PORTC,6,1);//Gray
        MOVS     R2,#+1
        MOVS     R1,#+6
        LDR.W    R0,??DataTable5_12  ;; 0x400ff080
        BL       gpio_ctrl
//   96         PID_SetPoint(-1000);
        LDR.W    R0,??DataTable5_15  ;; 0xfffffc18
        BL       PID_SetPoint
//   97         PID_SetKpid(2.2,0.5,0);
        MOVS     R2,#+0
        MOVS     R1,#+1056964608
        LDR.W    R0,??DataTable5_13  ;; 0x400ccccd
        BL       PID_SetKpid
//   98         PwmDuty=(int16)(IncPID_Calculate(YBack))-4800;
        LDR.W    R0,??DataTable5_14
        LDR      R0,[R0, #+0]
        BL       IncPID_Calculate
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        SUBS     R0,R0,#+4800
        LDR.W    R1,??DataTable5_1
        STR      R0,[R1, #+0]
//   99       }
//  100       //防过刹
//  101       if(g_nMotorPulse<=1&&ForB==0)
??pit0_isr_4:
        LDR.W    R0,??DataTable5_16
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+2
        BGE.N    ??pit0_isr_0
        LDR.W    R0,??DataTable5_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??pit0_isr_0
//  102       {
//  103         gpio_ctrl(PORTE,25,1);
        MOVS     R2,#+1
        MOVS     R1,#+25
        LDR.W    R0,??DataTable5_7  ;; 0x400ff100
        BL       gpio_ctrl
//  104         PwmDuty=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable5_1
        STR      R0,[R1, #+0]
//  105         IntCnt=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable5_5
        STRH     R0,[R1, #+0]
//  106         test_start=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable5_2
        STRB     R0,[R1, #+0]
//  107       }
//  108     }
//  109   }
//  110   //复位-------------------------------------------------------
//  111   if(MachineReset==1&&PB1_flag==0&&first==0)
??pit0_isr_0:
        LDR.W    R0,??DataTable5_17
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.W    ??pit0_isr_5
        LDR.W    R0,??DataTable5_18
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.W    ??pit0_isr_5
        LDR.W    R0,??DataTable5_4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.W    ??pit0_isr_5
//  112   {
//  113     IntCnt++;
        LDR.W    R0,??DataTable5_5
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5_5
        STRH     R0,[R1, #+0]
//  114     if(IntCnt==1)
        LDR.W    R0,??DataTable5_5
        LDRH     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??pit0_isr_6
//  115     {
//  116       PwmDuty=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable5_1
        STR      R0,[R1, #+0]
//  117       gpio_ctrl(PORTE,25,0);
        MOVS     R2,#+0
        MOVS     R1,#+25
        LDR.W    R0,??DataTable5_7  ;; 0x400ff100
        BL       gpio_ctrl
        B.N      ??pit0_isr_5
//  118     }
//  119     else if(IntCnt>1 && IntCnt<base)
??pit0_isr_6:
        LDR.W    R0,??DataTable5_5
        LDRH     R0,[R0, #+0]
        CMP      R0,#+2
        BLT.N    ??pit0_isr_7
        LDR.W    R0,??DataTable5_5
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable5_8
        LDRH     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??pit0_isr_7
//  120       PwmDuty=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable5_1
        STR      R0,[R1, #+0]
        B.N      ??pit0_isr_5
//  121     else
//  122     {
//  123       IntCnt=base+1;
??pit0_isr_7:
        LDR.W    R0,??DataTable5_8
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5_5
        STRH     R0,[R1, #+0]
//  124       if(g_nMotorPulseSigma>=-220)
        LDR.W    R0,??DataTable5_10
        LDRSH    R0,[R0, #+0]
        CMN      R0,#+220
        BLT.N    ??pit0_isr_8
//  125       {
//  126         FB=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable5_19
        STRB     R0,[R1, #+0]
//  127         gpio_ctrl(PORTC,4,0);//Brown//反
        MOVS     R2,#+0
        MOVS     R1,#+4
        LDR.W    R0,??DataTable5_12  ;; 0x400ff080
        BL       gpio_ctrl
//  128         gpio_ctrl(PORTC,6,1);//Gray
        MOVS     R2,#+1
        MOVS     R1,#+6
        LDR.W    R0,??DataTable5_12  ;; 0x400ff080
        BL       gpio_ctrl
//  129         PID_SetPoint(-100);
        MVNS     R0,#+99
        BL       PID_SetPoint
//  130         PID_SetKpid(1.8,0.9,0);
        MOVS     R2,#+0
        LDR.W    R1,??DataTable5_20  ;; 0x3f666666
        LDR.W    R0,??DataTable5_21  ;; 0x3fe66666
        BL       PID_SetKpid
//  131         PwmDuty=(int16)(IncPID_Calculate(YBack))-4350;
        LDR.W    R0,??DataTable5_14
        LDR      R0,[R0, #+0]
        BL       IncPID_Calculate
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable5_22  ;; 0xffffef02
        ADDS     R0,R1,R0
        LDR.W    R1,??DataTable5_1
        STR      R0,[R1, #+0]
        B.N      ??pit0_isr_9
//  132       }
//  133       else if(g_nMotorPulseSigma<=-220&&g_nMotorPulseSigma>=-350)
??pit0_isr_8:
        LDR.W    R0,??DataTable5_10
        LDRSH    R0,[R0, #+0]
        ADDS     R0,R0,#+350
        CMP      R0,#+131
        BCS.N    ??pit0_isr_10
//  134       {
//  135         FB=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable5_19
        STRB     R0,[R1, #+0]
//  136         gpio_ctrl(PORTC,4,0);//正
        MOVS     R2,#+0
        MOVS     R1,#+4
        LDR.W    R0,??DataTable5_12  ;; 0x400ff080
        BL       gpio_ctrl
//  137         gpio_ctrl(PORTC,6,1);
        MOVS     R2,#+1
        MOVS     R1,#+6
        LDR.W    R0,??DataTable5_12  ;; 0x400ff080
        BL       gpio_ctrl
//  138         PID_SetPoint(-2);
        MVNS     R0,#+1
        BL       PID_SetPoint
//  139         PID_SetKpid(1.8,0.1,0);
        MOVS     R2,#+0
        LDR.W    R1,??DataTable5_23  ;; 0x3dcccccd
        LDR.W    R0,??DataTable5_21  ;; 0x3fe66666
        BL       PID_SetKpid
//  140         PwmDuty=(int16)(IncPID_Calculate(g_nMotorPulse))-4000;
        LDR.W    R0,??DataTable5_16
        LDRSH    R0,[R0, #+0]
        BL       IncPID_Calculate
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        SUBS     R0,R0,#+4000
        LDR.W    R1,??DataTable5_1
        STR      R0,[R1, #+0]
        B.N      ??pit0_isr_9
//  141       }
//  142       else if(g_nMotorPulseSigma<=-350)
??pit0_isr_10:
        LDR.W    R0,??DataTable5_10
        LDRSH    R0,[R0, #+0]
        MVNS     R1,#+348
        CMP      R0,R1
        BGE.N    ??pit0_isr_9
//  143       {
//  144         FB=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable5_19
        STRB     R0,[R1, #+0]
//  145         gpio_ctrl(PORTC,4,1);//正
        MOVS     R2,#+1
        MOVS     R1,#+4
        LDR.W    R0,??DataTable5_12  ;; 0x400ff080
        BL       gpio_ctrl
//  146         gpio_ctrl(PORTC,6,0);
        MOVS     R2,#+0
        MOVS     R1,#+6
        LDR.N    R0,??DataTable5_12  ;; 0x400ff080
        BL       gpio_ctrl
//  147         PwmDuty=-7000;
        LDR.W    R0,??DataTable5_24  ;; 0xffffe4a8
        LDR.N    R1,??DataTable5_1
        STR      R0,[R1, #+0]
//  148       }
//  149       //防过刹
//  150       if(g_nMotorPulse>=-1&&FB==0)
??pit0_isr_9:
        LDR.N    R0,??DataTable5_16
        LDRSH    R0,[R0, #+0]
        CMN      R0,#+1
        BLT.N    ??pit0_isr_5
        LDR.N    R0,??DataTable5_19
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??pit0_isr_5
//  151       {
//  152         gpio_ctrl(PORTE,25,1);
        MOVS     R2,#+1
        MOVS     R1,#+25
        LDR.N    R0,??DataTable5_7  ;; 0x400ff100
        BL       gpio_ctrl
//  153         PwmDuty=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_1
        STR      R0,[R1, #+0]
//  154         IntCnt=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_5
        STRH     R0,[R1, #+0]
//  155         MachineReset=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_17
        STRB     R0,[R1, #+0]
//  156       }
//  157     }
//  158   }
//  159   
//  160   //中断测试--------------------
//  161   if(PB1==1)
??pit0_isr_5:
        LDR.N    R0,??DataTable5_25
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??pit0_isr_11
//  162   {
//  163     PB1=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_25
        STRB     R0,[R1, #+0]
//  164     PE24_flag=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_3
        STRB     R0,[R1, #+0]
//  165     PB1_flag=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_18
        STRB     R0,[R1, #+0]
//  166     StepOk=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_26
        STRB     R0,[R1, #+0]
//  167     disable_irq(88);
        MOVS     R0,#+88
        BL       disable_irq
//  168     enable_irq(91);
        MOVS     R0,#+91
        BL       enable_irq
//  169     //---------
//  170     BufBegin=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_11
        STRB     R0,[R1, #+0]
//  171     MachineReset=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_17
        STRB     R0,[R1, #+0]
//  172     slow=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_27
        STRB     R0,[R1, #+0]
//  173     IntCnt=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_5
        STRH     R0,[R1, #+0]
//  174     PwmDuty=0; 
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_1
        STR      R0,[R1, #+0]
//  175     gpio_ctrl(PORTE,25,1);
        MOVS     R2,#+1
        MOVS     R1,#+25
        LDR.N    R0,??DataTable5_7  ;; 0x400ff100
        BL       gpio_ctrl
//  176   }
//  177   if(PE24==1)
??pit0_isr_11:
        LDR.N    R0,??DataTable5_28
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??pit0_isr_12
//  178   {
//  179     PE24=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_28
        STRB     R0,[R1, #+0]
//  180     PE24_flag=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_3
        STRB     R0,[R1, #+0]
//  181     PB1_flag=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_18
        STRB     R0,[R1, #+0]
//  182     disable_irq(91);
        MOVS     R0,#+91
        BL       disable_irq
//  183     enable_irq(88);
        MOVS     R0,#+88
        BL       enable_irq
//  184     //---------
//  185     IntCnt=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_5
        STRH     R0,[R1, #+0]
//  186     PwmDuty=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_1
        STR      R0,[R1, #+0]
//  187     gpio_ctrl(PORTE,25,1);
        MOVS     R2,#+1
        MOVS     R1,#+25
        LDR.N    R0,??DataTable5_7  ;; 0x400ff100
        BL       gpio_ctrl
//  188     test_start=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_2
        STRB     R0,[R1, #+0]
//  189   }
//  190   
//  191   //限幅-------------------------------------------------------------
//  192   if(PwmDuty>=9999) PwmDuty=9999;
??pit0_isr_12:
        LDR.N    R0,??DataTable5_1
        LDR      R0,[R0, #+0]
        MOVW     R1,#+9999
        CMP      R0,R1
        BLT.N    ??pit0_isr_13
        MOVW     R0,#+9999
        LDR.N    R1,??DataTable5_1
        STR      R0,[R1, #+0]
//  193   if(PwmDuty<=-9999) PwmDuty=-9999;
??pit0_isr_13:
        LDR.N    R0,??DataTable5_1
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable5_29  ;; 0xffffd8f2
        CMP      R0,R1
        BGE.N    ??pit0_isr_14
        LDR.N    R0,??DataTable5_30  ;; 0xffffd8f1
        LDR.N    R1,??DataTable5_1
        STR      R0,[R1, #+0]
//  194   
//  195   //PWM矫正
//  196   if(PwmDuty<0) 
??pit0_isr_14:
        LDR.N    R0,??DataTable5_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??pit0_isr_15
//  197     Duty=-PwmDuty;
        LDR.N    R0,??DataTable5_1
        LDR      R0,[R0, #+0]
        RSBS     R0,R0,#+0
        LDR.N    R1,??DataTable5_31
        STR      R0,[R1, #+0]
        B.N      ??pit0_isr_16
//  198   else
//  199     Duty=PwmDuty;
??pit0_isr_15:
        LDR.N    R0,??DataTable5_1
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable5_31
        STR      R0,[R1, #+0]
//  200   
//  201   //物理输出
//  202   FTM_PWM_ChangeDuty(0,2,Duty);
??pit0_isr_16:
        LDR.N    R0,??DataTable5_31
        LDR      R2,[R0, #+0]
        MOVS     R1,#+2
        MOVS     R0,#+0
        BL       FTM_PWM_ChangeDuty
//  203   
//  204   //消抖-----
//  205   if(GpioIntFlag==1)
        LDR.N    R0,??DataTable5_32
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??pit0_isr_17
//  206   {
//  207     if(GpioIntCnt++>1000)
        LDR.N    R0,??DataTable5_33
        LDRH     R0,[R0, #+0]
        ADDS     R1,R0,#+1
        LDR.N    R2,??DataTable5_33
        STRH     R1,[R2, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+1000
        BLE.N    ??pit0_isr_17
//  208     {
//  209       GpioIntFlag=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_32
        STRB     R0,[R1, #+0]
//  210       GpioIntCnt=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_33
        STRH     R0,[R1, #+0]
//  211     }  
//  212   }
//  213   //5ms定时-----
//  214   g_n1msEventCount++;
??pit0_isr_17:
        LDR.N    R0,??DataTable5_34
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable5_34
        STRB     R0,[R1, #+0]
//  215   switch(g_n1msEventCount)
        LDR.N    R0,??DataTable5_34
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.N    ??pit0_isr_18
        BCC.N    ??pit0_isr_19
        CMP      R0,#+3
        BEQ.N    ??pit0_isr_20
        BCC.N    ??pit0_isr_21
        CMP      R0,#+5
        BEQ.N    ??pit0_isr_22
        BCC.N    ??pit0_isr_23
        B.N      ??pit0_isr_19
//  216   {
//  217   case 1:
//  218     GetMotorPulse();
??pit0_isr_18:
        BL       GetMotorPulse
//  219     break;
        B.N      ??pit0_isr_19
//  220   case 2:
//  221     BVCnt++;
??pit0_isr_21:
        LDR.N    R0,??DataTable5_35
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable5_35
        STRH     R0,[R1, #+0]
//  222     break;
        B.N      ??pit0_isr_19
//  223   case 3: 
//  224     break;  
??pit0_isr_20:
        B.N      ??pit0_isr_19
//  225   case 4:      
//  226     break;
??pit0_isr_23:
        B.N      ??pit0_isr_19
//  227   case 5:
//  228     g_n1msEventCount = 0;
??pit0_isr_22:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_34
        STRB     R0,[R1, #+0]
//  229     break;
//  230   }
//  231   
//  232   //电量警告
//  233   if(BVCnt==200)
??pit0_isr_19:
        LDR.N    R0,??DataTable5_35
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+200
        BNE.N    ??pit0_isr_24
//  234   {
//  235     BVCnt=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_35
        STRH     R0,[R1, #+0]
//  236     BatteryVoltage = hw_ad_ave(1,7,12,20);
        MOVS     R3,#+20
        MOVS     R2,#+12
        MOVS     R1,#+7
        MOVS     R0,#+1
        BL       hw_ad_ave
        LDR.N    R1,??DataTable5_36
        STR      R0,[R1, #+0]
//  237     if(BatteryVoltage<=500)
        LDR.N    R0,??DataTable5_36
        LDR      R0,[R0, #+0]
        CMP      R0,#+500
        BGT.N    ??pit0_isr_25
//  238       PowerLowFg=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_37
        STRB     R0,[R1, #+0]
        B.N      ??pit0_isr_26
//  239     else
//  240       PowerLowFg=0;
??pit0_isr_25:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_37
        STRB     R0,[R1, #+0]
//  241     
//  242     if(PowerLowFg==1)
??pit0_isr_26:
        LDR.N    R0,??DataTable5_37
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??pit0_isr_24
//  243         gpio_ctrl(PORTB,3,1);  
        MOVS     R2,#+1
        MOVS     R1,#+3
        LDR.N    R0,??DataTable5_38  ;; 0x400ff040
        BL       gpio_ctrl
//  244   }
//  245     
//  246   //中断处理
//  247   PIT_TFLG(0)|=PIT_TFLG_TIF_MASK;          //清中断标志位
??pit0_isr_24:
        LDR.N    R0,??DataTable5_39  ;; 0x4003710c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable5_39  ;; 0x4003710c
        STR      R0,[R1, #+0]
//  248   enable_pit_interrupt(0);                 //使能PIT中断
        MOVS     R0,#+0
        BL       enable_pit_interrupt
//  249   EnableInterrupts;                        //开总中断
        CPSIE i
//  250 }
        POP      {R0,PC}          ;; return
//  251 //--------------------------------------------
//  252 //pit1中断服务函数

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  253 void pit1_isr(void)
//  254 {
pit1_isr:
        PUSH     {R7,LR}
//  255   DisableInterrupts;
        CPSID i
//  256   
//  257   if(pit1_cnt++>=1000) pit1_cnt=0;
        LDR.N    R0,??DataTable5_40
        LDRH     R0,[R0, #+0]
        ADDS     R1,R0,#+1
        LDR.N    R2,??DataTable5_40
        STRH     R1,[R2, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+1000
        BLT.N    ??pit1_isr_0
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_40
        STRH     R0,[R1, #+0]
//  258   
//  259   PIT_TFLG(1)|=PIT_TFLG_TIF_MASK;          //清中断标志位
??pit1_isr_0:
        LDR.N    R0,??DataTable5_41  ;; 0x4003711c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable5_41  ;; 0x4003711c
        STR      R0,[R1, #+0]
//  260   enable_pit_interrupt(1);                 //使能PIT中断
        MOVS     R0,#+1
        BL       enable_pit_interrupt
//  261   EnableInterrupts;                        //开总中断
        CPSIE i
//  262 }
        POP      {R0,PC}          ;; return
//  263 
//  264 //-------------------------------------------

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  265 uint8 command_str[10];
command_str:
        DS8 12

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//  266 uint8 analyse_over=1;
analyse_over:
        DATA
        DC8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  267 uint8 cnt=0;
cnt:
        DS8 1
//  268 //串口3数据接收中断 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  269 void uart3_isr(void)
//  270 {
//  271     //uint8 ch;
//  272     DisableInterrupts;		//关总中断
uart3_isr:
        CPSID i
//  273     /*
//  274     //接收一个字节数据并回发
//  275     if(uart_re1(UART3,&ch))
//  276       uart_send1(UART3,ch);
//  277     */
//  278     if(analyse_over==1)
        LDR.N    R0,??DataTable5_42
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??uart3_isr_0
//  279     {
//  280       if((UART_S1_REG(UART3) & UART_S1_RDRF_MASK)!= 0)
        LDR.N    R0,??DataTable5_43  ;; 0x4006d004
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??uart3_isr_0
//  281       {
//  282         command_str[cnt++]=UART_D_REG(UART3);
        LDR.N    R0,??DataTable5_44  ;; 0x4006d007
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable5_45
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable5_46
        STRB     R0,[R1, R2]
        LDR.N    R0,??DataTable5_45
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable5_45
        STRB     R0,[R1, #+0]
//  283         if(command_str[cnt-1]=='*')
        LDR.N    R0,??DataTable5_45
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable5_46
        ADDS     R0,R0,R1
        LDRB     R0,[R0, #-1]
        CMP      R0,#+42
        BNE.N    ??uart3_isr_0
//  284         {
//  285           analyse_over=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_42
        STRB     R0,[R1, #+0]
//  286           cnt=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_45
        STRB     R0,[R1, #+0]
//  287         }
//  288       }
//  289     }
//  290     EnableInterrupts;		//开总中断
??uart3_isr_0:
        CPSIE i
//  291 }
        BX       LR               ;; return
//  292 
//  293 //--------------------------------------------------

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  294 int FTM_Count=0;
FTM_Count:
        DS8 4
//  295 //FTM0中断

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  296 void FTM1_isr()
//  297 {
//  298   FTM_Count++;
FTM1_isr:
        LDR.N    R0,??DataTable5_47
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable5_47
        STR      R0,[R1, #+0]
//  299   FTM_SC_REG(FTM1_BASE_PTR)&=~FTM_SC_TOF_MASK;
        LDR.N    R0,??DataTable5_48  ;; 0x40039000
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x80
        LDR.N    R1,??DataTable5_48  ;; 0x40039000
        STR      R0,[R1, #+0]
//  300 }
        BX       LR               ;; return
//  301 
//  302 //---------------------------------------------------
//  303 //PB1中断服务函数

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  304 void PB1_isr(void)
//  305 {
//  306     DisableInterrupts;  
PB1_isr:
        CPSID i
//  307 
//  308     PORTB_ISFR=1<<1;   // Clear the PTB1 interrupt flags
        MOVS     R0,#+2
        LDR.N    R1,??DataTable5_49  ;; 0x4004a0a0
        STR      R0,[R1, #+0]
//  309 
//  310     if(GpioIntFlag==0)
        LDR.N    R0,??DataTable5_32
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??PB1_isr_0
//  311       PB1++;  
        LDR.N    R0,??DataTable5_25
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable5_25
        STRB     R0,[R1, #+0]
//  312     
//  313     GpioIntFlag=1;
??PB1_isr_0:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_32
        STRB     R0,[R1, #+0]
//  314    
//  315     EnableInterrupts;	
        CPSIE i
//  316 }
        BX       LR               ;; return
//  317 
//  318 //--------------------------------------------
//  319 //PE24中断服务函数---为什么PA18/PA19不行

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  320 void PE24_isr(void)
//  321 {
//  322     DisableInterrupts;  
PE24_isr:
        CPSID i
//  323     
//  324     PORTE_ISFR=1<<24;   // Clear the PE24 interrupt flags       
        MOVS     R0,#+16777216
        LDR.N    R1,??DataTable5_50  ;; 0x4004d0a0
        STR      R0,[R1, #+0]
//  325     
//  326     if(GpioIntFlag==0)
        LDR.N    R0,??DataTable5_32
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??PE24_isr_0
//  327       PE24++;
        LDR.N    R0,??DataTable5_28
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable5_28
        STRB     R0,[R1, #+0]
//  328     
//  329     GpioIntFlag=1;
??PE24_isr_0:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_32
        STRB     R0,[R1, #+0]
//  330     
//  331     EnableInterrupts;	
        CPSIE i
//  332 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     g_n1msEventFlag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     PwmDuty

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     test_start

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     PE24_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     first

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     IntCnt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     ForB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     0x400ff100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     base

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     chainage

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     g_nMotorPulseSigma

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     BufBegin

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_12:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_13:
        DC32     0x400ccccd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_14:
        DC32     YBack

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_15:
        DC32     0xfffffc18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_16:
        DC32     g_nMotorPulse

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_17:
        DC32     MachineReset

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_18:
        DC32     PB1_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_19:
        DC32     FB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_20:
        DC32     0x3f666666

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_21:
        DC32     0x3fe66666

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_22:
        DC32     0xffffef02

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_23:
        DC32     0x3dcccccd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_24:
        DC32     0xffffe4a8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_25:
        DC32     PB1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_26:
        DC32     StepOk

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_27:
        DC32     slow

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_28:
        DC32     PE24

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_29:
        DC32     0xffffd8f2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_30:
        DC32     0xffffd8f1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_31:
        DC32     Duty

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_32:
        DC32     GpioIntFlag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_33:
        DC32     GpioIntCnt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_34:
        DC32     g_n1msEventCount

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_35:
        DC32     BVCnt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_36:
        DC32     BatteryVoltage

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_37:
        DC32     PowerLowFg

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_38:
        DC32     0x400ff040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_39:
        DC32     0x4003710c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_40:
        DC32     pit1_cnt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_41:
        DC32     0x4003711c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_42:
        DC32     analyse_over

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_43:
        DC32     0x4006d004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_44:
        DC32     0x4006d007

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_45:
        DC32     cnt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_46:
        DC32     command_str

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_47:
        DC32     FTM_Count

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_48:
        DC32     0x40039000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_49:
        DC32     0x4004a0a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_50:
        DC32     0x4004d0a0

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  333 
//  334 
// 
//   141 bytes in section .bss
//    29 bytes in section .data
// 1 700 bytes in section .text
// 
// 1 700 bytes of CODE memory
//   170 bytes of DATA memory
//
//Errors: none
//Warnings: none
