///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.10.1.52143/W32 for ARM    07/Jan/2012  00:38:37 /
// Copyright 1999-2010 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  F:\Kinetis\IARK60X256\03_LQ_uart_int\src\Sources\C\isr. /
//                    c                                                       /
//    Command line =  F:\Kinetis\IARK60X256\03_LQ_uart_int\src\Sources\C\isr. /
//                    c -D IAR -D TWR_K60N512 -lCN                            /
//                    F:\Kinetis\IARK60X256\03_LQ_uart_int\bin\Ram\List\ -lB  /
//                    F:\Kinetis\IARK60X256\03_LQ_uart_int\bin\Ram\List\ -o   /
//                    F:\Kinetis\IARK60X256\03_LQ_uart_int\bin\Ram\Obj\       /
//                    --no_cse --no_unroll --no_inline --no_code_motion       /
//                    --no_tbaa --no_clustering --no_scheduling --debug       /
//                    --endian=little --cpu=Cortex-M4 -e --fpu=None           /
//                    --dlib_config "C:\Program Files\IAR Systems\Embedded    /
//                    Workbench 6.0\arm\INC\c\DLib_Config_Normal.h" -I        /
//                    F:\Kinetis\IARK60X256\03_LQ_uart_int\src\Sources\H\ -I  /
//                    F:\Kinetis\IARK60X256\03_LQ_uart_int\src\Sources\H\Comp /
//                    onent_H\ -I F:\Kinetis\IARK60X256\03_LQ_uart_int\src\So /
//                    urces\H\Frame_H\ -Ol --use_c++_inline                   /
//    List file    =  F:\Kinetis\IARK60X256\03_LQ_uart_int\bin\Ram\List\isr.s /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME isr

        EXTERN uart_re1
        EXTERN uart_send1

        PUBLIC uart0_isr

// F:\Kinetis\IARK60X256\03_LQ_uart_int\src\Sources\C\isr.c
//    1 //-------------------------------------------------------------------------*
//    2 // 文件名: isr.c                                                           *
//    3 // 说  明: 中断处理例程                                                    *
//    4 //---------------苏州大学飞思卡尔嵌入式系统实验室2011年--------------------*
//    5 
//    6 #include "includes.h"
//    7 
//    8 //-------------------------------------------------------------------------*
//    9 //函数名: uart3_isr                                                        *
//   10 //功  能: 串口3数据接收中断例程                                            *
//   11 //说  明: 无                                                               *
//   12 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   13 void uart0_isr(void)
//   14 {
uart0_isr:
        PUSH     {R7,LR}
//   15     uint8 ch;
//   16     DisableInterrupts;		//关总中断
        CPSID i         
//   17     //接收一个字节数据并回发
//   18 	if(uart_re1 (UART0,&ch))
        ADD      R1,SP,#+0
        LDR.N    R0,??uart0_isr_0  ;; 0x4006a000
        BL       uart_re1
        CMP      R0,#+0
        BEQ.N    ??uart0_isr_1
//   19 		uart_send1(UART0,ch);
        LDRB     R1,[SP, #+0]
        LDR.N    R0,??uart0_isr_0  ;; 0x4006a000
        BL       uart_send1
//   20 	EnableInterrupts;		//开总中断
??uart0_isr_1:
        CPSIE i         
//   21 }
        POP      {R0,PC}          ;; return
        Nop      
        DATA
??uart0_isr_0:
        DC32     0x4006a000

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)

        END
// 
// 36 bytes in section .text
// 
// 36 bytes of CODE memory
//
//Errors: none
//Warnings: none
