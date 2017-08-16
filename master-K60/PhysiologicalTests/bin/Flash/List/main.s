///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       24/Jun/2015  14:29:00
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\ZXJ\Desktop\人体生理指数测试系统\下位机\K60 new
//        board\PhysiologicalTests\src\Sources\C\main.c
//    Command line =  
//        "C:\Users\ZXJ\Desktop\人体生理指数测试系统\下位机\K60 new
//        board\PhysiologicalTests\src\Sources\C\main.c" -D IAR -D TWR_K60N512
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
//        board\PhysiologicalTests\bin\Flash\List\main.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN BatteryVoltage
        EXTERN BufBegin
        EXTERN Car_Control_PWM
        EXTERN Command_analy
        EXTERN DM_start
        EXTERN FTM2_QUAD_Iint
        EXTERN FTM_Count
        EXTERN FTM_PWM_Init
        EXTERN FTM_PWM_Open
        EXTERN LCD_CLS
        EXTERN LCD_Init
        EXTERN LCD_P8x16Str
        EXTERN LCD_P8x16_number
        EXTERN LCD_P8x16_number_4
        EXTERN LCD_P8x16_number_5
        EXTERN NRF24L01_Check
        EXTERN NRF24L01_RX_Mode
        EXTERN NRF24L01_RxPacket
        EXTERN PB1_flag
        EXTERN PE24_flag
        EXTERN PID_SetKpid
        EXTERN PID_SetPoint
        EXTERN PwmBack
        EXTERN PwmDuty
        EXTERN SecBack1
        EXTERN SecBack2
        EXTERN SecStart
        EXTERN SecStop
        EXTERN StepOk
        EXTERN __aeabi_cdcmple
        EXTERN __aeabi_cdrcmple
        EXTERN __aeabi_d2iz
        EXTERN __aeabi_dmul
        EXTERN analyse_over
        EXTERN chainage
        EXTERN command_str
        EXTERN constant_angle
        EXTERN delay_ms
        EXTERN disable_irq
        EXTERN enable_irq
        EXTERN enable_pit_interrupt
        EXTERN enableuartreint
        EXTERN g_n1msEventCount
        EXTERN g_nMotorPulseSigma
        EXTERN gpio_ctrl
        EXTERN gpio_init
        EXTERN hw_adc_init
        EXTERN hw_pit_init
        EXTERN init_nrf24l01_io
        EXTERN keyboard_scan
        EXTERN matrix_keyboard_init
        EXTERN motor_run_nag
        EXTERN motor_run_pos
        EXTERN motor_stop
        EXTERN off_y
        EXTERN periph_clk_khz
        EXTERN run_constant_angle_nag
        EXTERN run_constant_angle_pos
        EXTERN serial_choose
        EXTERN set_irq_priority
        EXTERN uart_init
        EXTERN uart_send1

        PUBLIC AdjustPara
        PUBLIC Aver1
        PUBLIC Aver2
        PUBLIC Aver3
        PUBLIC Aver8_1
        PUBLIC Aver8_2
        PUBLIC Aver8_3
        PUBLIC BK
        PUBLIC Cnt
        PUBLIC End
        PUBLIC Mid1
        PUBLIC Mid2
        PUBLIC OFF_Y
        PUBLIC PIT1_CurrentVAL0
        PUBLIC PIT1_CurrentVAL1
        PUBLIC TmpPre
        PUBLIC Up
        PUBLIC UpBuf
        PUBLIC UpBuf1
        PUBLIC UpBuf1_pre
        PUBLIC UpCnt
        PUBLIC YBack
        PUBLIC YMax
        PUBLIC YMin
        PUBLIC avr_count
        PUBLIC first
        PUBLIC key_no
        PUBLIC key_num
        PUBLIC main
        PUBLIC system_init
        PUBLIC temp
        PUBLIC tmp_buf
        PUBLIC tmp_buf_cn

// C:\Users\ZXJ\Desktop\人体生理指数测试系统\下位机\K60 new board\PhysiologicalTests\src\Sources\C\main.c
//    1 //头文件
//    2 #include "includes.h"
//    3 
//    4 //全局变量声明
//    5 extern int periph_clk_khz;
//    6 
//    7 extern  uint8   BUF[8];                             	                    
//    8 extern  int    off_y[20];

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    9         int     OFF_Y=0;
OFF_Y:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   10         int     YBack=0;
YBack:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   11         uint8   temp=0;
temp:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   12         int     YMax=0,YMin=0;
YMax:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
YMin:
        DS8 4
//   13         

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   14         int16   Up[1000]={0};
Up:
        DS8 2000

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   15         uint16  Mid1=0,Mid2=0,End=0,Cnt=0;
Mid1:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
Mid2:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
End:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
Cnt:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   16         int16   Aver1=0,Aver2=0,Aver3=0;
Aver1:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
Aver2:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
Aver3:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   17         uint8   Aver8_1=0,Aver8_2=0,Aver8_3=0;
Aver8_1:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
Aver8_2:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
Aver8_3:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   18         int16   UpBuf=0;
UpBuf:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   19         uint8   UpBuf1=0,UpBuf1_pre=0;
UpBuf1:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
UpBuf1_pre:
        DS8 1
//   20         

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   21         uint8  UpCnt=0;
UpCnt:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   22         uint8  tmp_buf[33],TmpPre=0;
tmp_buf:
        DS8 36

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
TmpPre:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   23         uint8  tmp_buf_cn=0;
tmp_buf_cn:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   24         uint8  avr_count=0;
avr_count:
        DS8 1
//   25         
//   26 

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   27         uint8  key_num=255;
key_num:
        DATA
        DC8 255

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   28         uint8  key_no=255;
key_no:
        DATA
        DC8 255

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   29         uint8  BK=255;
BK:
        DATA
        DC8 255
//   30         
//   31 extern  uint16 add;
//   32 extern  uint32 PwmStart;
//   33 extern  uint32 PwmStop;
//   34 extern  uint32 PwmMid;
//   35 extern  uint32 PwmBack;
//   36 
//   37 extern  uint16 SecStart,SecMid,SecStop,SecBack1,SecBack2;
//   38 
//   39 
//   40 extern  int32  PwmDuty;
//   41 extern  int32  PwmSet;
//   42 extern  uint8  g_n1msEventCount;
//   43 extern  uint8  g_n1msEventFlag;
//   44 
//   45 extern  uint8  command_str[10];
//   46 extern  uint8  analyse_over;
//   47 extern  int    FTM_Count;
//   48 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   49 uint32 PIT1_CurrentVAL0=0,PIT1_CurrentVAL1=0;
PIT1_CurrentVAL0:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
PIT1_CurrentVAL1:
        DS8 4
//   50 
//   51 
//   52 extern uint16 OutData[4];
//   53 extern uint8 PB1,PE24;
//   54 extern uint8 StepOk;
//   55 extern uint8 PB1_flag,PE24_flag;
//   56 
//   57 extern uint8 ForB;
//   58 
//   59 extern uint8 BufBegin;
//   60 
//   61 extern int16 g_nMotorPulseSigma;
//   62 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   63 uint8 first=0;
first:
        DS8 1
//   64 extern int32  BatteryVoltage;
//   65 extern int16  chainage;
//   66 
//   67 //函数声明
//   68 
//   69 void AdjustPara();
//   70 void system_init();
//   71 
//   72 //主函数8

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   73 void main(void)
//   74 {
main:
        PUSH     {R4,LR}
//   75   uint8 i=0;
        MOVS     R4,#+0
//   76   
//   77   system_init();
        BL       system_init
//   78   serial_choose();
        BL       serial_choose
        B.N      ??main_0
//   79   
//   80   while(NRF24L01_Check())
//   81   {
//   82     LCD_P8x16Str(0,0,"nrf24l01 err");
??main_1:
        LDR.W    R2,??DataTable1_3
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//   83     delay_ms(1000);
        MOV      R0,#+1000
        BL       delay_ms
//   84   }
??main_0:
        BL       NRF24L01_Check
        CMP      R0,#+0
        BNE.N    ??main_1
//   85   LCD_P8x16Str(0,0,"nrf24l01 ok");
        LDR.W    R2,??DataTable1_4
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//   86   delay_ms(500);
        MOV      R0,#+500
        BL       delay_ms
//   87   LCD_CLS();
        BL       LCD_CLS
//   88   NRF24L01_RX_Mode();
        BL       NRF24L01_RX_Mode
        B.N      ??main_2
//   89   
//   90   while(1)
//   91   {
//   92     //1-步进电机--------------------
//   93     while(1)
//   94     {     
//   95        first=1;
//   96        if(g_n1msEventCount==0)
//   97        { //2---        
//   98          LCD_P8x16Str(0,2,"B:");LCD_P8x16_number(30,2,PB1_flag);
//   99          LCD_P8x16Str(60,2,"E:");LCD_P8x16_number(100,2,PE24_flag);
//  100          //4---
//  101          LCD_P8x16Str(0,4,"Sok:");LCD_P8x16_number(30,4,StepOk);
//  102          LCD_P8x16Str(60,4,"fir:");LCD_P8x16_number(100,4,first);
//  103          //6---
//  104          LCD_P8x16Str(60,6,"BV:");LCD_P8x16_number_4(85,6,BatteryVoltage);
//  105        }
//  106        if(!analyse_over)
//  107        {
//  108          analyse_over=1;
//  109          Command_analy(command_str);
//  110          LCD_CLS();
//  111          LCD_P8x16Str(0,0,"C:");LCD_P8x16Str(20,0,command_str);
//  112          for(i=0;i<10;i++)
//  113            command_str[i]=0;
//  114          
//  115          //体重输入---
//  116          if(DM_start==1) 
//  117          {
//  118            DM_start=0;
//  119            if(constant_angle<=50)
//  120              chainage=+50;
//  121            else if(constant_angle>50&&constant_angle<=100)
//  122              chainage=0;
//  123            else if(constant_angle>100)
//  124              chainage=-50;
//  125            constant_angle=0;
//  126            break;
//  127          }
//  128          //圆盘定方向转---
//  129          if(motor_run_pos==1)
//  130          {
//  131            Car_Control_PWM(MOTOR_LEFT,1800);
//  132            motor_run_pos=0;
//  133          }
//  134          if(motor_run_nag==1) 
//  135          {
//  136            Car_Control_PWM(MOTOR_LEFT,-1800);
//  137            motor_run_nag=0;
//  138          }
//  139          if(motor_stop==1)
//  140          {
//  141            Car_Control_PWM(MOTOR_LEFT,0);
//  142            motor_stop=0;
//  143          }
//  144        }
//  145        //圆盘定方向、定角度转---
//  146        if(run_constant_angle_pos==1)
//  147        {
//  148          Car_Control_PWM(MOTOR_LEFT,1800); 
//  149          if(FTM_Count>(int)(61.5*constant_angle))
//  150          {
//  151            disable_irq(63);
//  152            FTM_Count=0;
//  153            Car_Control_PWM(MOTOR_LEFT,0);
//  154            run_constant_angle_pos=0;
//  155          }
//  156        }
//  157        if(run_constant_angle_nag==1)
//  158        {
//  159          Car_Control_PWM(MOTOR_LEFT,-1800);
//  160          if(FTM_Count>=(int)(61.5*constant_angle))
//  161          {
//  162            disable_irq(62);
//  163            FTM_Count=0;
//  164            Car_Control_PWM(MOTOR_LEFT,0);
//  165            run_constant_angle_nag=0;
//  166          }
//  167        }
//  168     }
//  169     //2-无刷直流-------------------
//  170     while(1)
//  171     {  
//  172       first=0;
//  173       //指令解析---
//  174       if(!analyse_over)
//  175       {
//  176         analyse_over=1;
//  177         Command_analy(command_str);
//  178         //0-----
//  179         LCD_CLS();
//  180         LCD_P8x16Str(0,0,"C:");LCD_P8x16Str(20,0,command_str);
//  181         for(i=0;i<10;i++)
//  182           command_str[i]=0;
//  183       }
//  184       //归位---
//  185       if(StepOk==1)
//  186       {
//  187         StepOk=0;
??main_3:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable1_5
        STRB     R0,[R1, #+0]
//  188         LCD_CLS();
        BL       LCD_CLS
//  189         break;
//  190       }
??main_2:
        B.N      ??main_4
??main_5:
        LDR.W    R0,??DataTable1_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??main_6
        MOV      R1,#+1800
        MOVS     R0,#+0
        BL       Car_Control_PWM
        MOVS     R0,#+0
        LDR.W    R1,??DataTable1_6
        STRB     R0,[R1, #+0]
??main_6:
        LDR.W    R0,??DataTable1_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??main_7
        LDR.W    R1,??DataTable1_8  ;; 0xfffff8f8
        MOVS     R0,#+0
        BL       Car_Control_PWM
        MOVS     R0,#+0
        LDR.W    R1,??DataTable1_7
        STRB     R0,[R1, #+0]
??main_7:
        LDR.W    R0,??DataTable1_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??main_8
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       Car_Control_PWM
        MOVS     R0,#+0
        LDR.W    R1,??DataTable1_9
        STRB     R0,[R1, #+0]
??main_8:
        LDR.W    R0,??DataTable1_10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??main_9
        MOV      R1,#+1800
        MOVS     R0,#+0
        BL       Car_Control_PWM
        LDR.W    R0,??DataTable1_11
        LDRD     R2,R3,[R0, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable1_12  ;; 0x404ec000
        BL       __aeabi_dmul
        BL       __aeabi_d2iz
        LDR.W    R1,??DataTable1_13
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??main_9
        MOVS     R0,#+63
        BL       disable_irq
        MOVS     R0,#+0
        LDR.W    R1,??DataTable1_13
        STR      R0,[R1, #+0]
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       Car_Control_PWM
        MOVS     R0,#+0
        LDR.W    R1,??DataTable1_10
        STRB     R0,[R1, #+0]
??main_9:
        LDR.W    R0,??DataTable1_14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??main_4
        LDR.W    R1,??DataTable1_8  ;; 0xfffff8f8
        MOVS     R0,#+0
        BL       Car_Control_PWM
        LDR.W    R0,??DataTable1_11
        LDRD     R2,R3,[R0, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable1_12  ;; 0x404ec000
        BL       __aeabi_dmul
        BL       __aeabi_d2iz
        LDR.W    R1,??DataTable1_13
        LDR      R1,[R1, #+0]
        CMP      R1,R0
        BLT.N    ??main_4
        MOVS     R0,#+62
        BL       disable_irq
        MOVS     R0,#+0
        LDR.W    R1,??DataTable1_13
        STR      R0,[R1, #+0]
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       Car_Control_PWM
        MOVS     R0,#+0
        LDR.W    R1,??DataTable1_14
        STRB     R0,[R1, #+0]
??main_4:
        MOVS     R0,#+1
        LDR.W    R1,??DataTable2
        STRB     R0,[R1, #+0]
        LDR.W    R0,??DataTable1_15
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??main_10
        ADR.N    R2,??main_11     ;; 0x42, 0x3A, 0x00, 0x00
        MOVS     R1,#+2
        MOVS     R0,#+0
        BL       LCD_P8x16Str
        LDR.W    R0,??DataTable1_16
        LDRB     R2,[R0, #+0]
        MOVS     R1,#+2
        MOVS     R0,#+30
        BL       LCD_P8x16_number
        ADR.N    R2,??main_11+0x4  ;; 0x45, 0x3A, 0x00, 0x00
        MOVS     R1,#+2
        MOVS     R0,#+60
        BL       LCD_P8x16Str
        LDR.W    R0,??DataTable2_1
        LDRB     R2,[R0, #+0]
        MOVS     R1,#+2
        MOVS     R0,#+100
        BL       LCD_P8x16_number
        LDR.W    R2,??DataTable2_2
        MOVS     R1,#+4
        MOVS     R0,#+0
        BL       LCD_P8x16Str
        LDR.W    R0,??DataTable1_5
        LDRB     R2,[R0, #+0]
        MOVS     R1,#+4
        MOVS     R0,#+30
        BL       LCD_P8x16_number
        LDR.W    R2,??DataTable2_3
        MOVS     R1,#+4
        MOVS     R0,#+60
        BL       LCD_P8x16Str
        LDR.W    R0,??DataTable2
        LDRB     R2,[R0, #+0]
        MOVS     R1,#+4
        MOVS     R0,#+100
        BL       LCD_P8x16_number
        ADR.N    R2,??main_12     ;; "BV:"
        MOVS     R1,#+6
        MOVS     R0,#+60
        BL       LCD_P8x16Str
        LDR.W    R0,??DataTable1_17
        LDR      R2,[R0, #+0]
        MOVS     R1,#+6
        MOVS     R0,#+85
        BL       LCD_P8x16_number_4
??main_10:
        LDR.W    R0,??DataTable1_18
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.W    ??main_8
        MOVS     R0,#+1
        LDR.W    R1,??DataTable1_18
        STRB     R0,[R1, #+0]
        LDR.W    R0,??DataTable2_4
        BL       Command_analy
        BL       LCD_CLS
        ADR.N    R2,??main_12+0x4  ;; 0x43, 0x3A, 0x00, 0x00
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LCD_P8x16Str
        LDR.W    R2,??DataTable2_4
        MOVS     R1,#+0
        MOVS     R0,#+20
        BL       LCD_P8x16Str
        MOVS     R4,#+0
        B.N      ??main_13
??main_14:
        MOVS     R0,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R1,??DataTable2_4
        STRB     R0,[R4, R1]
        ADDS     R4,R4,#+1
??main_13:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+10
        BLT.N    ??main_14
        LDR.W    R0,??DataTable2_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.W    ??main_5
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_7
        STRB     R0,[R1, #+0]
        LDR.W    R2,??DataTable1_11
        LDRD     R0,R1,[R2, #+0]
        MOVS     R2,#+1
        LDR.W    R3,??DataTable2_9  ;; 0x40490000
        BL       __aeabi_cdcmple
        BCS.N    ??main_15
        MOVS     R0,#+50
        LDR.W    R1,??DataTable2_10
        STRH     R0,[R1, #+0]
        B.N      ??main_16
??main_15:
        LDR.W    R2,??DataTable1_11
        LDRD     R0,R1,[R2, #+0]
        MOVS     R2,#+1
        LDR.W    R3,??DataTable2_9  ;; 0x40490000
        BL       __aeabi_cdrcmple
        BHI.N    ??main_17
        LDR.W    R2,??DataTable1_11
        LDRD     R0,R1,[R2, #+0]
        MOVS     R2,#+1
        LDR.W    R3,??DataTable2_11  ;; 0x40590000
        BL       __aeabi_cdcmple
        BCS.N    ??main_17
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_10
        STRH     R0,[R1, #+0]
        B.N      ??main_16
??main_17:
        LDR.W    R2,??DataTable1_11
        LDRD     R0,R1,[R2, #+0]
        MOVS     R2,#+1
        LDR.W    R3,??DataTable2_11  ;; 0x40590000
        BL       __aeabi_cdrcmple
        BHI.N    ??main_16
        MVNS     R0,#+49
        LDR.W    R1,??DataTable2_10
        STRH     R0,[R1, #+0]
??main_16:
        MOVS     R0,#+0
        MOVS     R1,#+0
        LDR.W    R2,??DataTable1_11
        STRD     R0,R1,[R2, #+0]
        B.N      ??main_18
//  191       //加速度---  
//  192       if(NRF24L01_RxPacket(tmp_buf)==0)
//  193       {
//  194         UpBuf1_pre=UpBuf1;
//  195         UpBuf1=tmp_buf[0];
//  196         //上位机数据---
//  197         //1-----
//  198 //        Up[UpCnt]=tmp_buf[2];
//  199 //        if(Up[UpCnt]>=128)
//  200 //          Up[UpCnt]=Up[UpCnt]-256;
//  201 //        UpCnt++;
//  202 //        if(UpCnt>=3)
//  203 //        {
//  204 //          UpCnt=0;
//  205 //          UpBuf=(Up[0]+Up[1]+Up[2])/3;
//  206 //          if(UpBuf<=0)
//  207 //            UpBuf=UpBuf+256;
//  208 //          UpBuf1=UpBuf&0x00ff;
//  209 //        }
//  210 
//  211         //下位机数据---
//  212         off_y[avr_count]=(tmp_buf[0]<<8)|tmp_buf[1];    
//  213         off_y[avr_count]>>=4;       
//  214         if(off_y[avr_count]>=2048) 
//  215           off_y[avr_count]=off_y[avr_count]-4096;
//  216 
//  217         if(avr_count==0)
//  218         {
//  219           YMin=off_y[0];
//  220           YMax=off_y[0];
//  221         }
//  222         if(off_y[avr_count]<=YMin)
//  223           YMin=off_y[avr_count];
//  224         if(off_y[avr_count]>=YMax)
//  225           YMax=off_y[avr_count];
//  226         
//  227         avr_count++;
//  228         if(avr_count==5)
//  229         {
//  230           avr_count=0;
//  231           for(i=0;i<5;i++)
//  232             OFF_Y=OFF_Y+off_y[i];
//  233           YBack=(OFF_Y-YMax-YMin)/3;
//  234           OFF_Y=0;
//  235         }
//  236         //6-----
//  237         if(YBack>=0)
//  238         {
//  239           LCD_P8x16Str(60,6,"x+");
//  240           LCD_P8x16_number_5(80,6,YBack);
//  241         }
//  242         else
//  243         {
//  244           LCD_P8x16Str(60,6,"x-");
//  245           LCD_P8x16_number_5(80,6,-YBack);
//  246         }
//  247       }
//  248       //显示---
//  249       if(g_n1msEventCount==0)
//  250       {   
//  251         //上位机-----
//  252         if(BufBegin==1)
//  253         {
//  254           if(g_nMotorPulseSigma>=0&&g_nMotorPulseSigma<2160)
//  255           {
//  256 //            if(UpBuf1>=128)
//  257 //              UpBuf1=UpBuf1_pre;//UpBuf1=UpBuf1+UpBuf1/2;
//  258           }
//  259           if(g_nMotorPulseSigma>=2160&&g_nMotorPulseSigma<5040)
//  260           {
//  261             //UpBuf1=255;
//  262           }
//  263           else if(g_nMotorPulseSigma>=5040)
//  264           {
//  265 //            if(UpBuf1<128)
//  266 //              UpBuf1=UpBuf1_pre;//UpBuf1=UpBuf1-UpBuf1/2;
//  267           }
//  268           uart_send1(UART3,UpBuf1);
//  269         }
//  270         //0-----
//  271         if(PwmDuty<0) 
//  272         {
//  273           LCD_P8x16Str(60,0,"D:-");
//  274           LCD_P8x16_number_4(85,0,-PwmDuty);
//  275         }
//  276         else
//  277         {
//  278           LCD_P8x16Str(60,0,"D:+");
//  279           LCD_P8x16_number_4(85,0,PwmDuty);
//  280         }
//  281         //2-----
//  282         LCD_P8x16Str(0,2,"B:");LCD_P8x16_number(30,2,PB1_flag);
//  283         LCD_P8x16Str(60,2,"E:");LCD_P8x16_number(90,2,PE24_flag);
//  284         //4-----
//  285         LCD_P8x16Str(0,4,"Sok:");LCD_P8x16_number(30,4,StepOk);
//  286         LCD_P8x16Str(60,4,"fir:");LCD_P8x16_number(90,4,first);
//  287         //6-----
//  288         if(g_nMotorPulseSigma>0)
//  289         {
//  290           LCD_P8x16Str(0,6,"P:+");
??main_19:
        ADR.N    R2,??DataTable0  ;; "P:+"
        MOVS     R1,#+6
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//  291           LCD_P8x16_number_4(25,6,g_nMotorPulseSigma);
        LDR.W    R0,??DataTable2_12
        LDRSH    R2,[R0, #+0]
        MOVS     R1,#+6
        MOVS     R0,#+25
        BL       LCD_P8x16_number_4
//  292         }
??main_18:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2
        STRB     R0,[R1, #+0]
        LDR.W    R0,??DataTable1_18
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??main_20
        MOVS     R0,#+1
        LDR.W    R1,??DataTable1_18
        STRB     R0,[R1, #+0]
        LDR.W    R0,??DataTable2_4
        BL       Command_analy
        BL       LCD_CLS
        ADR.N    R2,??main_12+0x4  ;; 0x43, 0x3A, 0x00, 0x00
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LCD_P8x16Str
        LDR.W    R2,??DataTable2_4
        MOVS     R1,#+0
        MOVS     R0,#+20
        BL       LCD_P8x16Str
        MOVS     R4,#+0
        B.N      ??main_21
??main_22:
        MOVS     R0,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R1,??DataTable2_4
        STRB     R0,[R4, R1]
        ADDS     R4,R4,#+1
??main_21:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+10
        BLT.N    ??main_22
??main_20:
        LDR.W    R0,??DataTable1_5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.W    ??main_3
        LDR.W    R0,??DataTable2_13
        BL       NRF24L01_RxPacket
        CMP      R0,#+0
        BNE.W    ??main_23
        LDR.W    R0,??DataTable2_14
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable2_15
        STRB     R0,[R1, #+0]
        LDR.W    R0,??DataTable2_13
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable2_14
        STRB     R0,[R1, #+0]
        LDR.W    R0,??DataTable2_13
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable2_13
        LDRB     R1,[R1, #+1]
        ORRS     R0,R1,R0, LSL #+8
        LDR.W    R1,??DataTable2_16
        LDRB     R1,[R1, #+0]
        LDR.W    R2,??DataTable2_17
        STR      R0,[R2, R1, LSL #+2]
        LDR.W    R0,??DataTable2_16
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable2_17
        LDR      R0,[R1, R0, LSL #+2]
        ASRS     R0,R0,#+4
        LDR.W    R1,??DataTable2_16
        LDRB     R1,[R1, #+0]
        LDR.W    R2,??DataTable2_17
        STR      R0,[R2, R1, LSL #+2]
        LDR.W    R0,??DataTable2_16
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable2_17
        LDR      R0,[R1, R0, LSL #+2]
        CMP      R0,#+2048
        BLT.N    ??main_24
        LDR.W    R0,??DataTable2_16
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable2_17
        LDR      R0,[R1, R0, LSL #+2]
        SUBS     R0,R0,#+4096
        LDR.W    R1,??DataTable2_16
        LDRB     R1,[R1, #+0]
        LDR.W    R2,??DataTable2_17
        STR      R0,[R2, R1, LSL #+2]
??main_24:
        LDR.W    R0,??DataTable2_16
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??main_25
        LDR.W    R0,??DataTable2_17
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_18
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable2_17
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_19
        STR      R0,[R1, #+0]
??main_25:
        LDR.W    R0,??DataTable2_18
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_16
        LDRB     R1,[R1, #+0]
        LDR.W    R2,??DataTable2_17
        LDR      R1,[R2, R1, LSL #+2]
        CMP      R0,R1
        BLT.N    ??main_26
        LDR.W    R0,??DataTable2_16
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable2_17
        LDR      R0,[R1, R0, LSL #+2]
        LDR.W    R1,??DataTable2_18
        STR      R0,[R1, #+0]
??main_26:
        LDR.W    R0,??DataTable2_16
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable2_17
        LDR      R0,[R1, R0, LSL #+2]
        LDR.W    R1,??DataTable2_19
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BLT.N    ??main_27
        LDR.W    R0,??DataTable2_16
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable2_17
        LDR      R0,[R1, R0, LSL #+2]
        LDR.W    R1,??DataTable2_19
        STR      R0,[R1, #+0]
??main_27:
        LDR.W    R0,??DataTable2_16
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable2_16
        STRB     R0,[R1, #+0]
        LDR.W    R0,??DataTable2_16
        LDRB     R0,[R0, #+0]
        CMP      R0,#+5
        BNE.N    ??main_28
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_16
        STRB     R0,[R1, #+0]
        MOVS     R4,#+0
        B.N      ??main_29
??main_30:
        LDR.W    R0,??DataTable2_20
        LDR      R0,[R0, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R1,??DataTable2_17
        LDR      R1,[R1, R4, LSL #+2]
        ADDS     R0,R1,R0
        LDR.W    R1,??DataTable2_20
        STR      R0,[R1, #+0]
        ADDS     R4,R4,#+1
??main_29:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+5
        BLT.N    ??main_30
        LDR.W    R0,??DataTable2_20
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_19
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        LDR.W    R1,??DataTable2_18
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        MOVS     R1,#+3
        SDIV     R0,R0,R1
        LDR.W    R1,??DataTable2_21
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_20
        STR      R0,[R1, #+0]
??main_28:
        LDR.W    R0,??DataTable2_21
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BMI.N    ??main_31
        ADR.N    R2,??DataTable0_1  ;; 0x78, 0x2B, 0x00, 0x00
        MOVS     R1,#+6
        MOVS     R0,#+60
        BL       LCD_P8x16Str
        LDR.W    R0,??DataTable2_21
        LDR      R2,[R0, #+0]
        MOVS     R1,#+6
        MOVS     R0,#+80
        BL       LCD_P8x16_number_5
        B.N      ??main_23
        DATA
??main_11:
        DC8      0x42, 0x3A, 0x00, 0x00
        DC8      0x45, 0x3A, 0x00, 0x00
        THUMB
??main_31:
        ADR.N    R2,??DataTable0_2  ;; 0x78, 0x2D, 0x00, 0x00
        MOVS     R1,#+6
        MOVS     R0,#+60
        BL       LCD_P8x16Str
        LDR.W    R0,??DataTable2_21
        LDR      R0,[R0, #+0]
        RSBS     R2,R0,#+0
        MOVS     R1,#+6
        MOVS     R0,#+80
        BL       LCD_P8x16_number_5
??main_23:
        LDR.N    R0,??DataTable1_15
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.W    ??main_18
        LDR.W    R0,??DataTable2_22
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??main_32
        LDR.W    R0,??DataTable2_12
        LDRSH    R0,[R0, #+0]
        SUBS     R0,R0,#+2160
        CMP      R0,#+2880
??main_33:
        LDR.W    R0,??DataTable2_14
        LDRB     R1,[R0, #+0]
        LDR.W    R0,??DataTable2_23  ;; 0x4006d000
        BL       uart_send1
??main_32:
        LDR.W    R0,??DataTable2_24
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??main_34
        ADR.N    R2,??DataTable0_3  ;; "D:-"
        MOVS     R1,#+0
        MOVS     R0,#+60
        BL       LCD_P8x16Str
        LDR.W    R0,??DataTable2_24
        LDR      R0,[R0, #+0]
        RSBS     R2,R0,#+0
        MOVS     R1,#+0
        MOVS     R0,#+85
        BL       LCD_P8x16_number_4
        B.N      ??main_35
        Nop      
        DATA
??main_12:
        DC8      "BV:"
        DC8      0x43, 0x3A, 0x00, 0x00
        THUMB
??main_34:
        ADR.N    R2,??DataTable0_4  ;; "D:+"
        MOVS     R1,#+0
        MOVS     R0,#+60
        BL       LCD_P8x16Str
        LDR.W    R0,??DataTable2_24
        LDR      R2,[R0, #+0]
        MOVS     R1,#+0
        MOVS     R0,#+85
        BL       LCD_P8x16_number_4
??main_35:
        ADR.N    R2,??DataTable1  ;; 0x42, 0x3A, 0x00, 0x00
        MOVS     R1,#+2
        MOVS     R0,#+0
        BL       LCD_P8x16Str
        LDR.N    R0,??DataTable1_16
        LDRB     R2,[R0, #+0]
        MOVS     R1,#+2
        MOVS     R0,#+30
        BL       LCD_P8x16_number
        ADR.N    R2,??DataTable1_1  ;; 0x45, 0x3A, 0x00, 0x00
        MOVS     R1,#+2
        MOVS     R0,#+60
        BL       LCD_P8x16Str
        LDR.W    R0,??DataTable2_1
        LDRB     R2,[R0, #+0]
        MOVS     R1,#+2
        MOVS     R0,#+90
        BL       LCD_P8x16_number
        LDR.W    R2,??DataTable2_2
        MOVS     R1,#+4
        MOVS     R0,#+0
        BL       LCD_P8x16Str
        LDR.N    R0,??DataTable1_5
        LDRB     R2,[R0, #+0]
        MOVS     R1,#+4
        MOVS     R0,#+30
        BL       LCD_P8x16_number
        LDR.W    R2,??DataTable2_3
        MOVS     R1,#+4
        MOVS     R0,#+60
        BL       LCD_P8x16Str
        LDR.W    R0,??DataTable2
        LDRB     R2,[R0, #+0]
        MOVS     R1,#+4
        MOVS     R0,#+90
        BL       LCD_P8x16_number
        LDR.W    R0,??DataTable2_12
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+1
        BGE.W    ??main_19
//  293         else
//  294         {
//  295           LCD_P8x16Str(0,6,"P:-");
        ADR.N    R2,??DataTable1_2  ;; "P:-"
        MOVS     R1,#+6
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//  296           LCD_P8x16_number_4(25,6,-g_nMotorPulseSigma);
        LDR.W    R0,??DataTable2_12
        LDRSH    R0,[R0, #+0]
        RSBS     R2,R0,#+0
        MOVS     R1,#+6
        MOVS     R0,#+25
        BL       LCD_P8x16_number_4
        B.N      ??main_18
//  297         }
//  298       }
//  299     }
//  300   }
//  301 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC8      "P:+"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC8      0x78, 0x2B, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC8      0x78, 0x2D, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC8      "D:-"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_4:
        DC8      "D:+"
//  302 
//  303 //---------system_init()---------

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  304 void system_init()
//  305 {   
system_init:
        PUSH     {R7,LR}
//  306   DisableInterrupts;
        CPSID i
//  307   
//  308   //制动初始化
//  309   gpio_init(PORTE , 25, 1, 0);
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+25
        LDR.W    R0,??DataTable2_25  ;; 0x400ff100
        BL       gpio_init
//  310     
//  311   //电量检测初化
//  312   gpio_init(PORTE , 3, 1, 0);
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+3
        LDR.W    R0,??DataTable2_25  ;; 0x400ff100
        BL       gpio_init
//  313   hw_adc_init(1);
        MOVS     R0,#+1
        BL       hw_adc_init
//  314   //电量指示灯初始化
//  315   gpio_init(PORTB , 3, 1, 0);
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+3
        LDR.W    R0,??DataTable2_26  ;; 0x400ff040
        BL       gpio_init
//  316   
//  317   //半桥驱动初始化
//  318   gpio_init(PORTC , 4, 1, 0);
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+4
        LDR.W    R0,??DataTable2_27  ;; 0x400ff080
        BL       gpio_init
//  319   gpio_init(PORTC , 6, 1, 0);
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+6
        LDR.W    R0,??DataTable2_27  ;; 0x400ff080
        BL       gpio_init
//  320   
//  321   gpio_ctrl(PORTC,4,1);
        MOVS     R2,#+1
        MOVS     R1,#+4
        LDR.W    R0,??DataTable2_27  ;; 0x400ff080
        BL       gpio_ctrl
//  322   gpio_ctrl(PORTC,6,0);
        MOVS     R2,#+0
        MOVS     R1,#+6
        LDR.W    R0,??DataTable2_27  ;; 0x400ff080
        BL       gpio_ctrl
//  323   
//  324   //OLED液晶初始化
//  325   LCD_Init();
        BL       LCD_Init
//  326   
//  327   //NRF24L01
//  328   init_nrf24l01_io();
        BL       init_nrf24l01_io
//  329   
//  330   //直流电机初始化 
//  331   FTM_PWM_Init(0,1000);//10khz                       //电机频率初始化 pwm频率为10kHz，周期0.1ms
        MOV      R1,#+1000
        MOVS     R0,#+0
        BL       FTM_PWM_Init
//  332   FTM_PWM_Open(0,2,0);
        MOVS     R2,#+0
        MOVS     R1,#+2
        MOVS     R0,#+0
        BL       FTM_PWM_Open
//  333   PID_SetKpid(1.7,0.05,0.3);                   //速度PID初始化参数设置
        LDR.W    R2,??DataTable2_28  ;; 0x3e99999a
        LDR.W    R1,??DataTable2_29  ;; 0x3d4ccccd
        LDR.W    R0,??DataTable2_30  ;; 0x3fd9999a
        BL       PID_SetKpid
//  334   PID_SetPoint(300);                          //初始加速度设定
        MOV      R0,#+300
        BL       PID_SetPoint
//  335   
//  336   //编码器初始化
//  337   FTM2_QUAD_Iint();
        BL       FTM2_QUAD_Iint
//  338   
//  339   //步进电机初始化
//  340   /* Turn on all port clocks */
//  341   SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
        LDR.W    R0,??DataTable2_31  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.W    R1,??DataTable2_31  ;; 0x40048038
        STR      R0,[R1, #+0]
//  342   PORT_PCR_REG(PORTB_BASE_PTR,9)=(0|PORT_PCR_MUX(1))|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;//DIR0 PB9
        MOVW     R0,#+259
        LDR.W    R1,??DataTable2_32  ;; 0x4004a024
        STR      R0,[R1, #+0]
//  343   GPIO_PDDR_REG(DIR_PORT_BASE) |= (1<<9);//Dir:OUT
        LDR.W    R0,??DataTable2_33  ;; 0x400ff054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200
        LDR.W    R1,??DataTable2_33  ;; 0x400ff054
        STR      R0,[R1, #+0]
//  344   
//  345   DIR_LEFT_F;
        LDR.W    R0,??DataTable2_26  ;; 0x400ff040
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x200
        LDR.W    R1,??DataTable2_26  ;; 0x400ff040
        STR      R0,[R1, #+0]
//  346 
//  347   FTM_PWM_Init(1,500); //500
        MOV      R1,#+500
        MOVS     R0,#+1
        BL       FTM_PWM_Init
//  348   FTM1_SC|=FTM_SC_TOIE_MASK;
        LDR.W    R0,??DataTable2_34  ;; 0x40039000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40
        LDR.W    R1,??DataTable2_34  ;; 0x40039000
        STR      R0,[R1, #+0]
//  349   FTM_PWM_Open(1,0,0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       FTM_PWM_Open
//  350   
//  351   //限位开关的IO口中断初始化
//  352   //PORTB1
//  353   SIM_SCGC5|=SIM_SCGC5_PORTB_MASK;// 启用PORTB时钟
        LDR.W    R0,??DataTable2_31  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.W    R1,??DataTable2_31  ;; 0x40048038
        STR      R0,[R1, #+0]
//  354   PORTB_PCR1=(1<<8)|(0x9<<16);  // GPIO , 上升边沿触发 ,开启下拉电阻 
        LDR.W    R0,??DataTable2_35  ;; 0x90100
        LDR.W    R1,??DataTable2_36  ;; 0x4004a004
        STR      R0,[R1, #+0]
//  355   GPIOB_PDDR &= ~(1<<1);           // 中断必须是输入模式
        LDR.W    R0,??DataTable2_33  ;; 0x400ff054
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x2
        LDR.W    R1,??DataTable2_33  ;; 0x400ff054
        STR      R0,[R1, #+0]
//  356   PORTB_DFER|=(1<<1);
        LDR.W    R0,??DataTable2_37  ;; 0x4004a0c0
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.W    R1,??DataTable2_37  ;; 0x4004a0c0
        STR      R0,[R1, #+0]
//  357   PORTB_DFWR|=0x1f;
        LDR.W    R0,??DataTable2_38  ;; 0x4004a0c8
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1F
        LDR.W    R1,??DataTable2_38  ;; 0x4004a0c8
        STR      R0,[R1, #+0]
//  358   //enable_irq(88);                 // 启用PORTB中断*/
//  359   //PORTE24
//  360   SIM_SCGC5|=SIM_SCGC5_PORTE_MASK;// 启用PORTE时钟
        LDR.W    R0,??DataTable2_31  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000
        LDR.W    R1,??DataTable2_31  ;; 0x40048038
        STR      R0,[R1, #+0]
//  361   PORTE_PCR24=(1<<8)|(0x9<<16);  // GPIO , 上升边沿触发 ,开启下拉电阻 
        LDR.W    R0,??DataTable2_35  ;; 0x90100
        LDR.W    R1,??DataTable2_39  ;; 0x4004d060
        STR      R0,[R1, #+0]
//  362   GPIOE_PDDR &= ~(1<<24);           // 中断必须是输入模式
        LDR.W    R0,??DataTable2_40  ;; 0x400ff114
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x1000000
        LDR.W    R1,??DataTable2_40  ;; 0x400ff114
        STR      R0,[R1, #+0]
//  363   PORTE_DFER|=(1<<24);
        LDR.W    R0,??DataTable2_41  ;; 0x4004d0c0
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.W    R1,??DataTable2_41  ;; 0x4004d0c0
        STR      R0,[R1, #+0]
//  364   PORTE_DFWR|=0x1f;
        LDR.W    R0,??DataTable2_42  ;; 0x4004d0c8
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1F
        LDR.W    R1,??DataTable2_42  ;; 0x4004d0c8
        STR      R0,[R1, #+0]
//  365   enable_irq(91);                 // 启用PORTE中断*/
        MOVS     R0,#+91
        BL       enable_irq
//  366   
//  367   
//  368   //可调参数初始化
//  369   //AdjustPara();
//  370   
//  371   //串口初始化
//  372   uart_init(UART3,periph_clk_khz,9600);
        MOV      R2,#+9600
        LDR.W    R0,??DataTable2_43
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable2_23  ;; 0x4006d000
        BL       uart_init
//  373   enableuartreint(UART3,UART3irq);
        MOVS     R1,#+51
        LDR.W    R0,??DataTable2_23  ;; 0x4006d000
        BL       enableuartreint
//  374   
//  375   //PIT0中断初始化
//  376   hw_pit_init(0,60000);                       //配置pit定时器0,1ms中断(60000)
        MOVW     R1,#+60000
        MOVS     R0,#+0
        BL       hw_pit_init
//  377   enable_pit_interrupt(0);                    //开pit中断0通道
        MOVS     R0,#+0
        BL       enable_pit_interrupt
//  378   set_irq_priority (68,0);
        MOVS     R1,#+0
        MOVS     R0,#+68
        BL       set_irq_priority
//  379   
//  380   //计时PIT1
//  381   //hw_pit_init(1,6000000);                       //配置pit定时器0,1ms中断(60000)
//  382   //enable_pit_interrupt(1);                    //开pit中断0通道
//  383   
//  384   EnableInterrupts;                           //开启总中断,中断开启后，此刻就进行1ms的定时吗？
        CPSIE i
//  385 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC8      0x42, 0x3A, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC8      0x45, 0x3A, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC8      "P:-"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     `?<Constant "nrf24l01 err">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     `?<Constant "nrf24l01 ok">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     StepOk

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     motor_run_pos

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     motor_run_nag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     0xfffff8f8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     motor_stop

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     run_constant_angle_pos

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_11:
        DC32     constant_angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_12:
        DC32     0x404ec000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_13:
        DC32     FTM_Count

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_14:
        DC32     run_constant_angle_nag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_15:
        DC32     g_n1msEventCount

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_16:
        DC32     PB1_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_17:
        DC32     BatteryVoltage

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_18:
        DC32     analyse_over
//  386 
//  387 
//  388 //---------AdjustPara()------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  389 void AdjustPara()
//  390 {
AdjustPara:
        PUSH     {R7,LR}
//  391   while(1)
//  392    {
//  393       //---
//  394       //break;
//  395       //user GUI
//  396       LCD_P8x16Str(0,0,"SSrt:1"); LCD_P8x16Str(70,0,"PBack:5");
??AdjustPara_0:
        LDR.W    R2,??DataTable2_44
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LCD_P8x16Str
        LDR.W    R2,??DataTable2_45
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P8x16Str
//  397       LCD_P8x16Str(0,2,"SBack1:2");
        LDR.W    R2,??DataTable2_46
        MOVS     R1,#+2
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//  398       LCD_P8x16Str(0,4,"SSop:3");
        LDR.W    R2,??DataTable2_47
        MOVS     R1,#+4
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//  399       LCD_P8x16Str(0,6,"SBack2:4");
        LDR.W    R2,??DataTable2_48
        MOVS     R1,#+6
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//  400 
//  401       matrix_keyboard_init();
        BL       matrix_keyboard_init
//  402       key_no=keyboard_scan();
        BL       keyboard_scan
        LDR.W    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  403       
//  404       delay_ms(110);
        MOVS     R0,#+110
        BL       delay_ms
//  405 
//  406       //1号按键按下的时候调节SecStart
//  407       if(key_no==1)
        LDR.W    R0,??DataTable2_49
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.W    ??AdjustPara_1
//  408        {
//  409         key_no=255;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  410         BK=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable2_50
        STRB     R0,[R1, #+0]
//  411         LCD_CLS();
        BL       LCD_CLS
        B.N      ??AdjustPara_2
//  412         while(BK==1)
//  413         {
//  414           LCD_P8x16Str(0,0,"SSrt:");
??AdjustPara_3:
        LDR.W    R2,??DataTable2_51
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//  415           LCD_P8x16_number_4(60,0,SecStart);
        LDR.W    R0,??DataTable2_52
        LDRH     R2,[R0, #+0]
        MOVS     R1,#+0
        MOVS     R0,#+60
        BL       LCD_P8x16_number_4
//  416           
//  417           LCD_P8x16Str(0,2,"+:");
        ADR.N    R2,??AdjustPara_4  ;; 0x2B, 0x3A, 0x00, 0x00
        MOVS     R1,#+2
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//  418           LCD_P8x16Str(60,2,"Key7");
        LDR.W    R2,??DataTable2_53
        MOVS     R1,#+2
        MOVS     R0,#+60
        BL       LCD_P8x16Str
//  419           LCD_P8x16Str(0,4,"-:");
        ADR.N    R2,??AdjustPara_4+0x4  ;; 0x2D, 0x3A, 0x00, 0x00
        MOVS     R1,#+4
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//  420           LCD_P8x16Str(60,4,"Key8");
        LDR.W    R2,??DataTable2_54
        MOVS     R1,#+4
        MOVS     R0,#+60
        BL       LCD_P8x16Str
//  421           LCD_P8x16Str(0,6,"Re:");
        ADR.N    R2,??AdjustPara_4+0x8  ;; "Re:"
        MOVS     R1,#+6
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//  422           LCD_P8x16Str(60,6,"Key9");
        LDR.W    R2,??DataTable2_55
        MOVS     R1,#+6
        MOVS     R0,#+60
        BL       LCD_P8x16Str
//  423           
//  424           delay_ms(110);
        MOVS     R0,#+110
        BL       delay_ms
//  425           matrix_keyboard_init();
        BL       matrix_keyboard_init
//  426           key_num=keyboard_scan();
        BL       keyboard_scan
        LDR.W    R1,??DataTable2_56
        STRB     R0,[R1, #+0]
//  427           if(key_num!=255)
        LDR.W    R0,??DataTable2_56
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??AdjustPara_5
//  428           {
//  429             key_no=key_num;
        LDR.W    R0,??DataTable2_56
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  430           }          
//  431 
//  432           if(key_no==7)
??AdjustPara_5:
        LDR.W    R0,??DataTable2_49
        LDRB     R0,[R0, #+0]
        CMP      R0,#+7
        BNE.N    ??AdjustPara_6
//  433           {
//  434             SecStart=SecStart+10;
        LDR.W    R0,??DataTable2_52
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+10
        LDR.W    R1,??DataTable2_52
        STRH     R0,[R1, #+0]
//  435             key_no=255;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  436           }
//  437         
//  438           if(key_no==8)
??AdjustPara_6:
        LDR.W    R0,??DataTable2_49
        LDRB     R0,[R0, #+0]
        CMP      R0,#+8
        BNE.N    ??AdjustPara_7
//  439           {
//  440             SecStart=SecStart-10;
        LDR.W    R0,??DataTable2_52
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+10
        LDR.W    R1,??DataTable2_52
        STRH     R0,[R1, #+0]
//  441             key_no=255;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  442           }
//  443         
//  444           if(key_no==9)
??AdjustPara_7:
        LDR.W    R0,??DataTable2_49
        LDRB     R0,[R0, #+0]
        CMP      R0,#+9
        BNE.N    ??AdjustPara_2
//  445           {
//  446             BK=255;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable2_50
        STRB     R0,[R1, #+0]
//  447             key_no=255;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  448             key_num=255;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable2_56
        STRB     R0,[R1, #+0]
//  449           }
//  450         }
??AdjustPara_2:
        LDR.W    R0,??DataTable2_50
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.N    ??AdjustPara_3
//  451         LCD_CLS();
        BL       LCD_CLS
//  452       }
//  453       
//  454       //2号按键按下的时候调节SecBack1
//  455       if(key_no==2)
??AdjustPara_1:
        LDR.W    R0,??DataTable2_49
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE.W    ??AdjustPara_8
//  456        {
//  457         key_no=255;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  458         BK=2;
        MOVS     R0,#+2
        LDR.W    R1,??DataTable2_50
        STRB     R0,[R1, #+0]
//  459         LCD_CLS();
        BL       LCD_CLS
        B.N      ??AdjustPara_9
//  460         while(BK==2)
//  461         {
//  462           delay_ms(110);
??AdjustPara_10:
        MOVS     R0,#+110
        BL       delay_ms
//  463           matrix_keyboard_init();
        BL       matrix_keyboard_init
//  464           key_num=keyboard_scan();
        BL       keyboard_scan
        LDR.W    R1,??DataTable2_56
        STRB     R0,[R1, #+0]
//  465           if(key_num!=255)
        LDR.W    R0,??DataTable2_56
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??AdjustPara_11
//  466           {
//  467             key_no=key_num;
        LDR.W    R0,??DataTable2_56
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  468           }          
//  469           LCD_P8x16Str(0,0,"SBack1:");
??AdjustPara_11:
        LDR.W    R2,??DataTable2_57
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//  470           LCD_P8x16_number_4(60,0,SecBack1);
        LDR.W    R0,??DataTable2_58
        LDRH     R2,[R0, #+0]
        MOVS     R1,#+0
        MOVS     R0,#+60
        BL       LCD_P8x16_number_4
//  471           
//  472           LCD_P8x16Str(0,2,"+:");
        ADR.N    R2,??AdjustPara_4  ;; 0x2B, 0x3A, 0x00, 0x00
        MOVS     R1,#+2
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//  473           LCD_P8x16Str(60,2,"Key4");
        LDR.W    R2,??DataTable2_59
        MOVS     R1,#+2
        MOVS     R0,#+60
        BL       LCD_P8x16Str
//  474           LCD_P8x16Str(0,4,"-:");
        ADR.N    R2,??AdjustPara_4+0x4  ;; 0x2D, 0x3A, 0x00, 0x00
        MOVS     R1,#+4
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//  475           LCD_P8x16Str(60,4,"Key5");
        LDR.W    R2,??DataTable2_60
        MOVS     R1,#+4
        MOVS     R0,#+60
        BL       LCD_P8x16Str
//  476           LCD_P8x16Str(0,6,"Re:");
        ADR.N    R2,??AdjustPara_4+0x8  ;; "Re:"
        MOVS     R1,#+6
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//  477           LCD_P8x16Str(60,6,"Key6");
        LDR.W    R2,??DataTable2_61
        MOVS     R1,#+6
        MOVS     R0,#+60
        BL       LCD_P8x16Str
//  478           
//  479           if(key_no==7)
        LDR.W    R0,??DataTable2_49
        LDRB     R0,[R0, #+0]
        CMP      R0,#+7
        BNE.N    ??AdjustPara_12
//  480           {
//  481             SecBack1=SecBack1+10;
        LDR.W    R0,??DataTable2_58
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+10
        LDR.W    R1,??DataTable2_58
        STRH     R0,[R1, #+0]
//  482             key_no=255;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  483           }
//  484         
//  485           if(key_no==8)
??AdjustPara_12:
        LDR.W    R0,??DataTable2_49
        LDRB     R0,[R0, #+0]
        CMP      R0,#+8
        BNE.N    ??AdjustPara_13
//  486           {
//  487             SecBack1=SecBack1-10;
        LDR.W    R0,??DataTable2_58
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+10
        LDR.W    R1,??DataTable2_58
        STRH     R0,[R1, #+0]
//  488             key_no=255;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  489           }
//  490         
//  491           if(key_no==9)
??AdjustPara_13:
        LDR.W    R0,??DataTable2_49
        LDRB     R0,[R0, #+0]
        CMP      R0,#+9
        BNE.N    ??AdjustPara_9
//  492           {
//  493             BK=255;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable2_50
        STRB     R0,[R1, #+0]
//  494             key_no=255;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  495           }
//  496         }
??AdjustPara_9:
        LDR.W    R0,??DataTable2_50
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BEQ.N    ??AdjustPara_10
//  497         LCD_CLS();
        BL       LCD_CLS
//  498        }
//  499       //3号按键按下的时候调节SecStop
//  500       if(key_no==3)
??AdjustPara_8:
        LDR.W    R0,??DataTable2_49
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BNE.N    ??AdjustPara_14
//  501        {
//  502         key_no=255;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  503         BK=3;
        MOVS     R0,#+3
        LDR.W    R1,??DataTable2_50
        STRB     R0,[R1, #+0]
//  504         LCD_CLS();
        BL       LCD_CLS
        B.N      ??AdjustPara_15
//  505         while(BK==3)
//  506         {
//  507           delay_ms(110);
??AdjustPara_16:
        MOVS     R0,#+110
        BL       delay_ms
//  508           matrix_keyboard_init();
        BL       matrix_keyboard_init
//  509           key_num=keyboard_scan();
        BL       keyboard_scan
        LDR.W    R1,??DataTable2_56
        STRB     R0,[R1, #+0]
//  510           if(key_num!=255)
        LDR.W    R0,??DataTable2_56
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??AdjustPara_17
//  511           {
//  512             key_no=key_num;
        LDR.W    R0,??DataTable2_56
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  513           }          
//  514           LCD_P8x16Str(0,0,"SSop:");
??AdjustPara_17:
        LDR.W    R2,??DataTable2_62
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//  515           LCD_P8x16_number_4(60,0,SecStop);
        LDR.W    R0,??DataTable2_63
        LDRH     R2,[R0, #+0]
        MOVS     R1,#+0
        MOVS     R0,#+60
        BL       LCD_P8x16_number_4
//  516           
//  517           LCD_P8x16Str(0,2,"+:");
        ADR.N    R2,??AdjustPara_4  ;; 0x2B, 0x3A, 0x00, 0x00
        MOVS     R1,#+2
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//  518           LCD_P8x16Str(60,2,"Key4");
        LDR.W    R2,??DataTable2_59
        MOVS     R1,#+2
        MOVS     R0,#+60
        BL       LCD_P8x16Str
//  519           LCD_P8x16Str(0,4,"-:");
        ADR.N    R2,??AdjustPara_4+0x4  ;; 0x2D, 0x3A, 0x00, 0x00
        MOVS     R1,#+4
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//  520           LCD_P8x16Str(60,4,"Key5");
        LDR.N    R2,??DataTable2_60
        MOVS     R1,#+4
        MOVS     R0,#+60
        BL       LCD_P8x16Str
//  521           LCD_P8x16Str(0,6,"Re:");
        ADR.N    R2,??AdjustPara_4+0x8  ;; "Re:"
        MOVS     R1,#+6
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//  522           LCD_P8x16Str(60,6,"Key6");
        LDR.N    R2,??DataTable2_61
        MOVS     R1,#+6
        MOVS     R0,#+60
        BL       LCD_P8x16Str
//  523           
//  524           if(key_no==7)
        LDR.N    R0,??DataTable2_49
        LDRB     R0,[R0, #+0]
        CMP      R0,#+7
        BNE.N    ??AdjustPara_18
//  525           {
//  526             SecStop=SecStop+10;
        LDR.N    R0,??DataTable2_63
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+10
        LDR.N    R1,??DataTable2_63
        STRH     R0,[R1, #+0]
//  527             key_no=255;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  528           }
//  529         
//  530           if(key_no==8)
??AdjustPara_18:
        LDR.N    R0,??DataTable2_49
        LDRB     R0,[R0, #+0]
        CMP      R0,#+8
        BNE.N    ??AdjustPara_19
//  531           {
//  532             SecStop=SecStop-10;
        LDR.N    R0,??DataTable2_63
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+10
        LDR.N    R1,??DataTable2_63
        STRH     R0,[R1, #+0]
//  533             key_no=255;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  534           }
//  535         
//  536           if(key_no==9)
??AdjustPara_19:
        LDR.N    R0,??DataTable2_49
        LDRB     R0,[R0, #+0]
        CMP      R0,#+9
        BNE.N    ??AdjustPara_15
//  537           {
//  538             BK=255;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable2_50
        STRB     R0,[R1, #+0]
//  539             key_no=255;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  540           }
//  541         }
??AdjustPara_15:
        LDR.N    R0,??DataTable2_50
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BEQ.N    ??AdjustPara_16
//  542         LCD_CLS();
        BL       LCD_CLS
//  543        }
//  544       
//  545       //4号按键按下的时候调节SecBack2
//  546       if(key_no==4)
??AdjustPara_14:
        LDR.N    R0,??DataTable2_49
        LDRB     R0,[R0, #+0]
        CMP      R0,#+4
        BNE.N    ??AdjustPara_20
//  547        {
//  548         key_no=255;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  549         BK=4;
        MOVS     R0,#+4
        LDR.N    R1,??DataTable2_50
        STRB     R0,[R1, #+0]
//  550         LCD_CLS();
        BL       LCD_CLS
        B.N      ??AdjustPara_21
//  551         while(BK==4)
//  552         {
//  553           delay_ms(110);
??AdjustPara_22:
        MOVS     R0,#+110
        BL       delay_ms
//  554           matrix_keyboard_init();
        BL       matrix_keyboard_init
//  555           key_num=keyboard_scan();
        BL       keyboard_scan
        LDR.N    R1,??DataTable2_56
        STRB     R0,[R1, #+0]
//  556           if(key_num!=255)
        LDR.N    R0,??DataTable2_56
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??AdjustPara_23
//  557           {
//  558             key_no=key_num;
        LDR.N    R0,??DataTable2_56
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  559           }          
//  560           LCD_P8x16Str(0,0,"SBack2:");
??AdjustPara_23:
        LDR.N    R2,??DataTable2_64
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//  561           LCD_P8x16_number_4(60,0,SecBack2);
        LDR.N    R0,??DataTable2_65
        LDRH     R2,[R0, #+0]
        MOVS     R1,#+0
        MOVS     R0,#+60
        BL       LCD_P8x16_number_4
//  562           
//  563           LCD_P8x16Str(0,2,"+:");
        ADR.N    R2,??AdjustPara_4  ;; 0x2B, 0x3A, 0x00, 0x00
        MOVS     R1,#+2
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//  564           LCD_P8x16Str(60,2,"Key4");
        LDR.N    R2,??DataTable2_59
        MOVS     R1,#+2
        MOVS     R0,#+60
        BL       LCD_P8x16Str
//  565           LCD_P8x16Str(0,4,"-:");
        ADR.N    R2,??AdjustPara_4+0x4  ;; 0x2D, 0x3A, 0x00, 0x00
        MOVS     R1,#+4
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//  566           LCD_P8x16Str(60,4,"Key5");
        LDR.N    R2,??DataTable2_60
        MOVS     R1,#+4
        MOVS     R0,#+60
        BL       LCD_P8x16Str
//  567           LCD_P8x16Str(0,6,"Re:");
        ADR.N    R2,??AdjustPara_4+0x8  ;; "Re:"
        B.N      ??AdjustPara_24
        Nop      
        DATA
??AdjustPara_4:
        DC8      0x2B, 0x3A, 0x00, 0x00
        DC8      0x2D, 0x3A, 0x00, 0x00
        DC8      "Re:"
        THUMB
??AdjustPara_24:
        MOVS     R1,#+6
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//  568           LCD_P8x16Str(60,6,"Key6");
        LDR.N    R2,??DataTable2_61
        MOVS     R1,#+6
        MOVS     R0,#+60
        BL       LCD_P8x16Str
//  569           
//  570           if(key_no==7)
        LDR.N    R0,??DataTable2_49
        LDRB     R0,[R0, #+0]
        CMP      R0,#+7
        BNE.N    ??AdjustPara_25
//  571           {
//  572             SecBack2=SecBack2+10;
        LDR.N    R0,??DataTable2_65
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+10
        LDR.N    R1,??DataTable2_65
        STRH     R0,[R1, #+0]
//  573             key_no=255;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  574           }
//  575         
//  576           if(key_no==8)
??AdjustPara_25:
        LDR.N    R0,??DataTable2_49
        LDRB     R0,[R0, #+0]
        CMP      R0,#+8
        BNE.N    ??AdjustPara_26
//  577           {
//  578             SecBack2=SecBack2-10;
        LDR.N    R0,??DataTable2_65
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+10
        LDR.N    R1,??DataTable2_65
        STRH     R0,[R1, #+0]
//  579             key_no=255;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  580           }
//  581         
//  582           if(key_no==9)
??AdjustPara_26:
        LDR.N    R0,??DataTable2_49
        LDRB     R0,[R0, #+0]
        CMP      R0,#+9
        BNE.N    ??AdjustPara_21
//  583           {
//  584             BK=255;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable2_50
        STRB     R0,[R1, #+0]
//  585             key_no=255;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  586           }
//  587         }
??AdjustPara_21:
        LDR.N    R0,??DataTable2_50
        LDRB     R0,[R0, #+0]
        CMP      R0,#+4
        BEQ.N    ??AdjustPara_22
//  588         LCD_CLS();
        BL       LCD_CLS
//  589        }//PwmBack
//  590       //5号按键按下的时候调节PwmBack
//  591       if(key_no==5)
??AdjustPara_20:
        LDR.N    R0,??DataTable2_49
        LDRB     R0,[R0, #+0]
        CMP      R0,#+5
        BNE.N    ??AdjustPara_27
//  592        {
//  593         key_no=255;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  594         BK=5;
        MOVS     R0,#+5
        LDR.N    R1,??DataTable2_50
        STRB     R0,[R1, #+0]
//  595         LCD_CLS();
        BL       LCD_CLS
        B.N      ??AdjustPara_28
//  596         while(BK==5)
//  597         {
//  598           delay_ms(110);
??AdjustPara_29:
        MOVS     R0,#+110
        BL       delay_ms
//  599           matrix_keyboard_init();
        BL       matrix_keyboard_init
//  600           key_num=keyboard_scan();
        BL       keyboard_scan
        LDR.N    R1,??DataTable2_56
        STRB     R0,[R1, #+0]
//  601           if(key_num!=255)
        LDR.N    R0,??DataTable2_56
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??AdjustPara_30
//  602           {
//  603             key_no=key_num;
        LDR.N    R0,??DataTable2_56
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  604           }          
//  605           LCD_P8x16Str(0,0,"PBack:");
??AdjustPara_30:
        LDR.N    R2,??DataTable2_66
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//  606           LCD_P8x16_number_4(60,0,PwmBack);
        LDR.N    R0,??DataTable2_67
        LDR      R2,[R0, #+0]
        MOVS     R1,#+0
        MOVS     R0,#+60
        BL       LCD_P8x16_number_4
//  607           
//  608           LCD_P8x16Str(0,2,"+:");
        ADR.N    R2,??DataTable2_5  ;; 0x2B, 0x3A, 0x00, 0x00
        MOVS     R1,#+2
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//  609           LCD_P8x16Str(60,2,"Key4");
        LDR.N    R2,??DataTable2_59
        MOVS     R1,#+2
        MOVS     R0,#+60
        BL       LCD_P8x16Str
//  610           LCD_P8x16Str(0,4,"-:");
        ADR.N    R2,??DataTable2_6  ;; 0x2D, 0x3A, 0x00, 0x00
        MOVS     R1,#+4
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//  611           LCD_P8x16Str(60,4,"Key5");
        LDR.N    R2,??DataTable2_60
        MOVS     R1,#+4
        MOVS     R0,#+60
        BL       LCD_P8x16Str
//  612           LCD_P8x16Str(0,6,"Re:");
        ADR.N    R2,??DataTable2_8  ;; "Re:"
        MOVS     R1,#+6
        MOVS     R0,#+0
        BL       LCD_P8x16Str
//  613           LCD_P8x16Str(60,6,"Key6");
        LDR.N    R2,??DataTable2_61
        MOVS     R1,#+6
        MOVS     R0,#+60
        BL       LCD_P8x16Str
//  614           
//  615           if(key_no==7)
        LDR.N    R0,??DataTable2_49
        LDRB     R0,[R0, #+0]
        CMP      R0,#+7
        BNE.N    ??AdjustPara_31
//  616           {
//  617             PwmBack=PwmBack+5;
        LDR.N    R0,??DataTable2_67
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+5
        LDR.N    R1,??DataTable2_67
        STR      R0,[R1, #+0]
//  618             key_no=255;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  619           }
//  620         
//  621           if(key_no==8)
??AdjustPara_31:
        LDR.N    R0,??DataTable2_49
        LDRB     R0,[R0, #+0]
        CMP      R0,#+8
        BNE.N    ??AdjustPara_32
//  622           {
//  623             PwmBack=PwmBack-5;
        LDR.N    R0,??DataTable2_67
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+5
        LDR.N    R1,??DataTable2_67
        STR      R0,[R1, #+0]
//  624             key_no=255;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  625           }
//  626         
//  627           if(key_no==9)
??AdjustPara_32:
        LDR.N    R0,??DataTable2_49
        LDRB     R0,[R0, #+0]
        CMP      R0,#+9
        BNE.N    ??AdjustPara_28
//  628           {
//  629             BK=255;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable2_50
        STRB     R0,[R1, #+0]
//  630             key_no=255;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  631           }
//  632         }
??AdjustPara_28:
        LDR.N    R0,??DataTable2_50
        LDRB     R0,[R0, #+0]
        CMP      R0,#+5
        BEQ.N    ??AdjustPara_29
//  633         LCD_CLS();
        BL       LCD_CLS
//  634        }/*
//  635       //6号按键按下的时候调节QPX_SET
//  636       if(key_no==6)
//  637        {
//  638         key_no=255;
//  639         BK=6;
//  640         LCD_CLS();
//  641         while(BK==6)
//  642         {
//  643           delay_ms(110);
//  644           matrix_keyboard_init();
//  645           key_num=keyboard_scan();
//  646           if(key_num!=255)
//  647           {
//  648             key_no=key_num;
//  649           }          
//  650           LCD_P8x16Str(0,0,"QPX_S:");
//  651 
//  652           LCD_P8x16Str(0,2,"+:");
//  653           LCD_P8x16Str(60,2,"Key4");
//  654           LCD_P8x16Str(0,4,"-:");
//  655           LCD_P8x16Str(60,4,"Key5");
//  656           LCD_P8x16Str(0,6,"Re:");
//  657           LCD_P8x16Str(60,6,"Key6");
//  658           
//  659           if(key_no==7)
//  660           {
//  661    
//  662             key_no=255;
//  663           }
//  664         
//  665           if(key_no==8)
//  666           {
//  667          
//  668             key_no=255;
//  669           }
//  670         
//  671           if(key_no==9)
//  672           {
//  673             BK=255;
//  674             key_no=255;
//  675           }
//  676         }
//  677         LCD_CLS();
//  678        }*/
//  679      //10号按键按下 采集数据
//  680      if(key_no==10)
??AdjustPara_27:
        LDR.N    R0,??DataTable2_49
        LDRB     R0,[R0, #+0]
        CMP      R0,#+10
        BNE.W    ??AdjustPara_0
//  681      {
//  682        key_no=255;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable2_49
        STRB     R0,[R1, #+0]
//  683        LCD_CLS();
        BL       LCD_CLS
//  684        break;
//  685      }
//  686    } 
//  687 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     first

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     PE24_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     `?<Constant "Sok:">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     `?<Constant "fir:">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     command_str

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC8      0x2B, 0x3A, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC8      0x2D, 0x3A, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     DM_start

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC8      "Re:"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     0x40490000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     chainage

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     0x40590000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     g_nMotorPulseSigma

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_13:
        DC32     tmp_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_14:
        DC32     UpBuf1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_15:
        DC32     UpBuf1_pre

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_16:
        DC32     avr_count

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_17:
        DC32     off_y

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_18:
        DC32     YMin

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_19:
        DC32     YMax

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_20:
        DC32     OFF_Y

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_21:
        DC32     YBack

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_22:
        DC32     BufBegin

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_23:
        DC32     0x4006d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_24:
        DC32     PwmDuty

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_25:
        DC32     0x400ff100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_26:
        DC32     0x400ff040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_27:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_28:
        DC32     0x3e99999a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_29:
        DC32     0x3d4ccccd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_30:
        DC32     0x3fd9999a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_31:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_32:
        DC32     0x4004a024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_33:
        DC32     0x400ff054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_34:
        DC32     0x40039000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_35:
        DC32     0x90100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_36:
        DC32     0x4004a004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_37:
        DC32     0x4004a0c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_38:
        DC32     0x4004a0c8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_39:
        DC32     0x4004d060

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_40:
        DC32     0x400ff114

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_41:
        DC32     0x4004d0c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_42:
        DC32     0x4004d0c8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_43:
        DC32     periph_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_44:
        DC32     `?<Constant "SSrt:1">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_45:
        DC32     `?<Constant "PBack:5">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_46:
        DC32     `?<Constant "SBack1:2">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_47:
        DC32     `?<Constant "SSop:3">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_48:
        DC32     `?<Constant "SBack2:4">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_49:
        DC32     key_no

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_50:
        DC32     BK

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_51:
        DC32     `?<Constant "SSrt:">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_52:
        DC32     SecStart

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_53:
        DC32     `?<Constant "Key7">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_54:
        DC32     `?<Constant "Key8">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_55:
        DC32     `?<Constant "Key9">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_56:
        DC32     key_num

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_57:
        DC32     `?<Constant "SBack1:">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_58:
        DC32     SecBack1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_59:
        DC32     `?<Constant "Key4">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_60:
        DC32     `?<Constant "Key5">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_61:
        DC32     `?<Constant "Key6">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_62:
        DC32     `?<Constant "SSop:">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_63:
        DC32     SecStop

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_64:
        DC32     `?<Constant "SBack2:">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_65:
        DC32     SecBack2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_66:
        DC32     `?<Constant "PBack:">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_67:
        DC32     PwmBack

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "nrf24l01 err">`:
        DATA
        DC8 "nrf24l01 err"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "nrf24l01 ok">`:
        DATA
        DC8 "nrf24l01 ok"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "B:"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "E:"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Sok:">`:
        DATA
        DC8 "Sok:"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "fir:">`:
        DATA
        DC8 "fir:"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "BV:"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "C:"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "x+"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "x-"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "D:-"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "D:+"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "P:+"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "P:-"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "SSrt:1">`:
        DATA
        DC8 "SSrt:1"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PBack:5">`:
        DATA
        DC8 "PBack:5"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "SBack1:2">`:
        DATA
        DC8 "SBack1:2"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "SSop:3">`:
        DATA
        DC8 "SSop:3"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "SBack2:4">`:
        DATA
        DC8 "SBack2:4"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "SSrt:">`:
        DATA
        DC8 "SSrt:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "+:"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Key7">`:
        DATA
        DC8 "Key7"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "-:"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Key8">`:
        DATA
        DC8 "Key8"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "Re:"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Key9">`:
        DATA
        DC8 "Key9"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "SBack1:">`:
        DATA
        DC8 "SBack1:"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Key4">`:
        DATA
        DC8 "Key4"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Key5">`:
        DATA
        DC8 "Key5"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Key6">`:
        DATA
        DC8 "Key6"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "SSop:">`:
        DATA
        DC8 "SSop:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "SBack2:">`:
        DATA
        DC8 "SBack2:"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PBack:">`:
        DATA
        DC8 "PBack:"
        DC8 0

        END
//  688 
// 
// 2 087 bytes in section .bss
//     3 bytes in section .data
//   232 bytes in section .rodata
// 3 718 bytes in section .text
// 
// 3 718 bytes of CODE  memory
//   232 bytes of CONST memory
// 2 090 bytes of DATA  memory
//
//Errors: none
//Warnings: none
