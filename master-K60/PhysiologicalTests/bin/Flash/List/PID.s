///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       19/Mar/2015  18:42:09
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\ZXJ\Desktop\K60老板子程序\PhysiologicalTests\src\Sources\C\Component_C\PID.c
//    Command line =  
//        C:\Users\ZXJ\Desktop\K60老板子程序\PhysiologicalTests\src\Sources\C\Component_C\PID.c
//        -D IAR -D TWR_K60N512 -lCN
//        C:\Users\ZXJ\Desktop\K60老板子程序\PhysiologicalTests\bin\Flash\List\
//        -lB
//        C:\Users\ZXJ\Desktop\K60老板子程序\PhysiologicalTests\bin\Flash\List\
//        -o
//        C:\Users\ZXJ\Desktop\K60老板子程序\PhysiologicalTests\bin\Flash\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M4 -e --fpu=None --dlib_config "D:\MyProgramFiles\IAR
//        V7.1\arm\INC\c\DLib_Config_Normal.h" -I
//        C:\Users\ZXJ\Desktop\K60老板子程序\PhysiologicalTests\src\Sources\H\
//        -I
//        C:\Users\ZXJ\Desktop\K60老板子程序\PhysiologicalTests\src\Sources\H\Component_H\
//        -I
//        C:\Users\ZXJ\Desktop\K60老板子程序\PhysiologicalTests\src\Sources\H\Frame_H\
//        -Ol --use_c++_inline
//    List file    =  
//        C:\Users\ZXJ\Desktop\K60老板子程序\PhysiologicalTests\bin\Flash\List\PID.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_f2iz
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2f

        PUBLIC IncPID_Calculate
        PUBLIC LocPID_Calculate
        PUBLIC PID_Init
        PUBLIC PID_SetKd
        PUBLIC PID_SetKi
        PUBLIC PID_SetKp
        PUBLIC PID_SetKpid
        PUBLIC PID_SetPoint
        PUBLIC __PID
        PUBLIC sPID

// C:\Users\ZXJ\Desktop\K60老板子程序\PhysiologicalTests\src\Sources\C\Component_C\PID.c
//    1 /****************************************Copyright (c)****************************************************
//    2 **                            Guangzhou ZLGMCU Development Co., LTD
//    3 **
//    4 **                                 http://www.zlgmcu.com
//    5 **
//    6 **--------------File Info---------------------------------------------------------------------------------
//    7 ** File name:           PID.c
//    8 ** Last modified Date:  2012-05-05
//    9 ** Last Version:        V1.0
//   10 ** Descriptions:        PID控制算法
//   11 **
//   12 **--------------------------------------------------------------------------------------------------------
//   13 ** Created by:          Bai Dongcheng
//   14 ** Created date:        2012-05-05
//   15 ** Version:             V1.00
//   16 ** Descriptions:        整理模板，添加用户应用程序
//   17 **
//   18 **--------------------------------------------------------------------------------------------------------
//   19 ** Modified by:        
//   20 ** Modified date:      
//   21 ** Version:            
//   22 ** Descriptions:       
//   23 **
//   24 ** Rechecked by:
//   25 *********************************************************************************************************/
//   26 
//   27 #include "PID.h" 
//   28 #define  FORWARD   1
//   29 #define  BACK      0
//   30 typedef struct PID{
//   31     
//   32     int   Point;                                                        /* 目标值                       */
//   33     long  SumError;                                                     /* 累计误差                     */
//   34     
//   35     float P;                                                            /* 比例系数                     */
//   36     float I;                                                            /* 积分系数                     */
//   37     float D;                                                            /* 微分系数                     */
//   38     
//   39     int   LastError;                                                    /* Error[-1]                    */
//   40     int   PrevError;                                                    /* Error[-2]                    */
//   41                                                                         
//   42 }PID;
//   43 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   44 PID __PID;
__PID:
        DS8 28

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   45 PID *sPID = &__PID;
sPID:
        DATA
        DC32 __PID
//   46 //uint16 speed;
//   47 
//   48 /*********************************************************************************************************
//   49 ** Function name:       PID_Init
//   50 ** Descriptions:        PID所有参数清零
//   51 ** input parameters:    *sPID:PID结构体指针                         
//   52 ** output parameters:   无
//   53 ** Returned value:      无
//   54 *********************************************************************************************************/ 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   55 void PID_Init(void) 
//   56 {
//   57     sPID->Point     = 0;
PID_Init:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+0]
//   58 
//   59     sPID->P         = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+8]
//   60     sPID->I         = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+12]
//   61     sPID->D         = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+16]
//   62     
//   63     sPID->SumError  = 0;    
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+4]
//   64     sPID->LastError = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+20]
//   65     sPID->PrevError = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+24]
//   66 }
        BX       LR               ;; return
//   67 
//   68 /*********************************************************************************************************
//   69 ** Function name:       PID_SetPoint
//   70 ** Descriptions:        设置PID调节的目标值
//   71 ** input parameters:    AimValue:目标值                         
//   72 ** output parameters:   无
//   73 ** Returned value:      无
//   74 *********************************************************************************************************/ 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   75 void PID_SetPoint(int AimValue) 
//   76 {
//   77     sPID->Point = AimValue;
PID_SetPoint:
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+0]
//   78 }
        BX       LR               ;; return
//   79 
//   80 
//   81 /*********************************************************************************************************
//   82 ** Function name:       PID_SetKp
//   83 ** Descriptions:        设置P值
//   84 ** input parameters:    Kp:                         
//   85 ** output parameters:   无
//   86 ** Returned value:      无
//   87 *********************************************************************************************************/ 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   88 void PID_SetKp(float Kp) 
//   89 {
//   90     sPID->P     = Kp; 
PID_SetKp:
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+8]
//   91 }
        BX       LR               ;; return
//   92 
//   93 
//   94 /*********************************************************************************************************
//   95 ** Function name:       PID_SetKi
//   96 ** Descriptions:        设置I值
//   97 ** input parameters:    Ki:                         
//   98 ** output parameters:   无
//   99 ** Returned value:      无
//  100 *********************************************************************************************************/ 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  101 void PID_SetKi(float Ki) 
//  102 {
//  103     sPID->I     = Ki;
PID_SetKi:
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+12]
//  104 }
        BX       LR               ;; return
//  105 
//  106 
//  107 /*********************************************************************************************************
//  108 ** Function name:       PID_SetKd
//  109 ** Descriptions:        设置D值
//  110 ** input parameters:    Kd:                         
//  111 ** output parameters:   无
//  112 ** Returned value:      无
//  113 *********************************************************************************************************/ 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  114 void PID_SetKd(float Kd) 
//  115 {
//  116     sPID->D     = Kd;
PID_SetKd:
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+16]
//  117 }
        BX       LR               ;; return
//  118 
//  119 /*********************************************************************************************************
//  120 ** Function name:       PID_SetKpid
//  121 ** Descriptions:        设置D值
//  122 ** input parameters:    Kd:                         
//  123 ** output parameters:   无
//  124 ** Returned value:      无
//  125 *********************************************************************************************************/ 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  126 void PID_SetKpid(float Kp,float Ki,float Kd) 
//  127 {
//  128     sPID->P     = Kp;
PID_SetKpid:
        LDR.N    R3,??DataTable7
        LDR      R3,[R3, #+0]
        STR      R0,[R3, #+8]
//  129     sPID->I     = Ki;
        LDR.N    R0,??DataTable7
        LDR      R0,[R0, #+0]
        STR      R1,[R0, #+12]
//  130     sPID->D     = Kd;
        LDR.N    R0,??DataTable7
        LDR      R0,[R0, #+0]
        STR      R2,[R0, #+16]
//  131 }
        BX       LR               ;; return
//  132 
//  133 /*********************************************************************************************************
//  134 ** Function name:       IncPID_Calculate
//  135 ** Descriptions:        增量式PID控制
//  136 ** input parameters:    BackValue:反馈值                         
//  137 ** output parameters:   无
//  138 ** Returned value:      无
//  139 *********************************************************************************************************/ 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  140 int IncPID_Calculate(int BackValue) 
//  141 {
IncPID_Calculate:
        PUSH     {R4,LR}
//  142     static int Error,Inc;
//  143    
//  144     Error   = sPID->Point - BackValue;                                  /* 计算当前误差Error[0]         */
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+0]
        SUBS     R0,R1,R0
        LDR.N    R1,??DataTable7_1
        STR      R0,[R1, #+0]
//  145     /********************************
//  146     Δu(k)=u(k)-u(k-1)
//  147           =Kp*(      e(k)-e(k-1) + T/Ti*e(k) +Td*(e(k)  - 2*e(k-1)+e(k-2))/T)
//  148           =Kp*(1+T/Ti+Td/T)*e(k) - Kp*(1+2*Td/T)*e(k-1) + Kp*Td/T*e(k-2))
//  149           =
//  150     ***********************************/
//  151     Inc     = (int) ( sPID->P * Error
//  152               - sPID->I * sPID->LastError
//  153               + sPID->D * sPID->PrevError);
        LDR.N    R0,??DataTable7_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+8]
        BL       __aeabi_fmul
        MOVS     R4,R0
        LDR.N    R0,??DataTable7
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+20]
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+12]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fsub
        MOVS     R4,R0
        LDR.N    R0,??DataTable7
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+24]
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+16]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        BL       __aeabi_f2iz
        LDR.N    R1,??DataTable7_2
        STR      R0,[R1, #+0]
//  154    
//  155     sPID->PrevError = sPID->LastError;
        LDR.N    R0,??DataTable7
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+20]
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+24]
//  156     sPID->LastError = Error;
        LDR.N    R0,??DataTable7_1
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+20]
//  157     
//  158     return Inc;
        LDR.N    R0,??DataTable7_2
        LDR      R0,[R0, #+0]
        POP      {R4,PC}          ;; return
//  159 }

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??Error:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??Inc:
        DS8 4
//  160 
//  161 /*********************************************************************************************************
//  162 ** Function name:       LocPID_Calculate
//  163 ** Descriptions:        位置式PID控制
//  164 ** input parameters:    BackValue:反馈值                         
//  165 ** output parameters:   无
//  166 ** Returned value:      无
//  167 *********************************************************************************************************/ 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  168 int LocPID_Calculate(int BackValue) 
//  169 {
LocPID_Calculate:
        PUSH     {R4,LR}
//  170     static int Error,delta,Loc;
//  171    
//  172     Error           = sPID->Point - BackValue;                          /* 计算当前误差Error[0]         */
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+0]
        SUBS     R0,R1,R0
        LDR.N    R1,??DataTable7_3
        STR      R0,[R1, #+0]
//  173     sPID->SumError += Error;
        LDR.N    R0,??DataTable7
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+4]
        LDR.N    R1,??DataTable7_3
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+4]
//  174     delta           = Error - sPID->LastError;
        LDR.N    R0,??DataTable7_3
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+20]
        SUBS     R0,R0,R1
        LDR.N    R1,??DataTable7_4
        STR      R0,[R1, #+0]
//  175     /********************************
//  176     Δu(k)=u(k)-u(k-1)
//  177           =Kp*(      e(k)-e(k-1) + T/Ti*e(k) +Td*(e(k)  - 2*e(k-1)+e(k-2))/T)
//  178           =Kp*(1+T/Ti+Td/T)*e(k) - Kp*(1+2*Td/T)*e(k-1) + Kp*Td/T*e(k-2))
//  179           =
//  180     ***********************************/
//  181     Loc     = (int) ( sPID->P * Error
//  182               - sPID->I * sPID->SumError
//  183               + sPID->D * delta);
        LDR.N    R0,??DataTable7_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+8]
        BL       __aeabi_fmul
        MOVS     R4,R0
        LDR.N    R0,??DataTable7
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+4]
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+12]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fsub
        MOVS     R4,R0
        LDR.N    R0,??DataTable7_4
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+16]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        BL       __aeabi_f2iz
        LDR.N    R1,??DataTable7_5
        STR      R0,[R1, #+0]
//  184    
//  185     sPID->LastError = Error;
        LDR.N    R0,??DataTable7_3
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable7
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+20]
//  186     
//  187     return Loc;
        LDR.N    R0,??DataTable7_5
        LDR      R0,[R0, #+0]
        POP      {R4,PC}          ;; return
//  188 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     sPID

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     ??Error

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     ??Inc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     ??Error_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     ??delta

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_5:
        DC32     ??Loc

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??Error_1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??delta:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??Loc:
        DS8 4

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  189 
//  190 
// 
//  48 bytes in section .bss
//   4 bytes in section .data
// 406 bytes in section .text
// 
// 406 bytes of CODE memory
//  52 bytes of DATA memory
//
//Errors: none
//Warnings: none
