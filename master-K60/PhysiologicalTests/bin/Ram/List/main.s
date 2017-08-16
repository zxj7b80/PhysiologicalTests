///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.10.1.52143/W32 for ARM    07/Jan/2012  00:38:37 /
// Copyright 1999-2010 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  F:\Kinetis\IARK60X256\03_LQ_uart_int\src\Sources\C\main /
//                    .c                                                      /
//    Command line =  F:\Kinetis\IARK60X256\03_LQ_uart_int\src\Sources\C\main /
//                    .c -D IAR -D TWR_K60N512 -lCN                           /
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
//    List file    =  F:\Kinetis\IARK60X256\03_LQ_uart_int\bin\Ram\List\main. /
//                    s                                                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME main

        EXTERN enableuartreint
        EXTERN light_change
        EXTERN light_init
        EXTERN periph_clk_khz
        EXTERN uart_init
        EXTERN uart_sendN

        PUBLIC main

// F:\Kinetis\IARK60X256\03_LQ_uart_int\src\Sources\C\main.c
//    1 /********************************************************   
//    2 【平    台】龙丘K60X256多功能开发板
//    3 【编    写】龙丘
//    4 【Designed】by Chiu Sir
//    5 【E-mail  】chiusir@yahoo.cn
//    6 【软件版本】V1.0
//    7 【最后更新】2012年1月3日
//    8 【相关信息参考下列地址】
//    9 【网    站】http://www.lqist.cn
//   10 【淘宝店铺】http://shop36265907.taobao.com
//   11 ------------------------------------------------
//   12 【dev.env.】CodeWarrior 10.1/IAR
//   13 【Target  】K60X256
//   14 【Crystal 】50.000Mhz
//   15 【busclock】???.000MHz
//   16 【pllclock】100.000MHz    
//   17 ***************************
//   18 ------------------------------------
//   19   使用说明：
//   20  PTD6接串口模块的RX
//   21  PTD7接串口模块的TX 
//   22  串口波特率9600n，n，8，1
//   23  在串口调试助手窗口发送任意字符，返回相应字符加1。 
//   24   
//   25  *********************************************************/
//   26 
//   27 //头文件
//   28 #include "includes.h"
//   29 
//   30 //全局变量声明
//   31 extern int periph_clk_khz;
//   32 
//   33 //主函数

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   34 void main(void)
//   35 {
main:
        PUSH     {R4,LR}
//   36     //1 主程序使用的变量定义
//   37     uint32 runcount;		//运行计数器
//   38     
//   39     //2 关中断
//   40     DisableInterrupts;      //禁止总中断
        CPSID i         
//   41     
//   42     //3 模块初始化
//   43     light_init(Light_Run_PORT,Light_Run1,Light_OFF); //指示灯初始化
        MOVS     R2,#+1
        MOVS     R1,#+17
        LDR.N    R0,??DataTable1  ;; 0x400ff000
        BL       light_init
//   44     uart_init (UART0,periph_clk_khz,9600);			 //串口初始化
        MOV      R2,#+9600
        LDR.N    R0,??DataTable1_1
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable1_2  ;; 0x4006a000
        BL       uart_init
//   45 
//   46     //4 开中断
//   47     enableuartreint(UART0,UART0irq);		//开串口3接收中断
        MOVS     R1,#+45
        LDR.N    R0,??DataTable1_2  ;; 0x4006a000
        BL       enableuartreint
//   48     EnableInterrupts;			        //开总中断
        CPSIE i         
//   49     
//   50     uart_sendN(UART0,(uint8*)"Hello World!",12);
        MOVS     R2,#+12
        ADR.W    R1,`?<Constant "Hello World!">`
        LDR.N    R0,??DataTable1_2  ;; 0x4006a000
        BL       uart_sendN
//   51     //主循环
//   52     while(1)
//   53     {
//   54         //1 主循环计数到一定的值，使小灯的亮、暗状态切换
//   55         runcount++;
??main_0:
        ADDS     R4,R4,#+1
//   56         if(runcount>=5000000)
        LDR.N    R0,??DataTable1_3  ;; 0x4c4b40
        CMP      R4,R0
        BCC.N    ??main_0
//   57         {
//   58             light_change(Light_Run_PORT,Light_Run1);//指示灯的亮、暗状态切换
        MOVS     R1,#+17
        LDR.N    R0,??DataTable1  ;; 0x400ff000
        BL       light_change
//   59             runcount=0;
        MOVS     R4,#+0
        B.N      ??main_0
//   60         }			
//   61     }
//   62 }

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_1:
        DC32     periph_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_2:
        DC32     0x4006a000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_3:
        DC32     0x4c4b40

        SECTION `.text`:CODE:NOROOT(2)
        DATA
`?<Constant "Hello World!">`:
        ; Initializer data, 16 bytes
        DC8 72, 101, 108, 108, 111, 32, 87, 111, 114, 108
        DC8 100, 33, 0, 0, 0, 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)

        END
//   63 
//   64 
//   65 
//   66 
// 
// 102 bytes in section .text
// 
// 102 bytes of CODE memory
//
//Errors: none
//Warnings: none
