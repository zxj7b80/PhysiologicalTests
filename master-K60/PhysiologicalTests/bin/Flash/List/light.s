///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      10/Feb/2015  20:04:46 /
// IAR ANSI C/C++ Compiler V6.30.4.23288/W32 EVALUATION for ARM               /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  E:\单片机\K60\K60核心板源代码\03_LQ_uart_int\src\Source /
//                    s\C\Component_C\light.c                                 /
//    Command line =  E:\单片机\K60\K60核心板源代码\03_LQ_uart_int\src\Source /
//                    s\C\Component_C\light.c -D IAR -D TWR_K60N512 -lCN      /
//                    E:\单片机\K60\K60核心板源代码\03_LQ_uart_int\bin\Flash\ /
//                    List\ -lB E:\单片机\K60\K60核心板源代码\03_LQ_uart_int\ /
//                    bin\Flash\List\ -o E:\单片机\K60\K60核心板源代码\03_LQ_ /
//                    uart_int\bin\Flash\Obj\ --no_cse --no_unroll            /
//                    --no_inline --no_code_motion --no_tbaa --no_clustering  /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "D:\MyProgramFiles\IAR V6.3\arm\INC\c\DLib_Config_Norma /
//                    l.h" -I E:\单片机\K60\K60核心板源代码\03_LQ_uart_int\sr /
//                    c\Sources\H\ -I E:\单片机\K60\K60核心板源代码\03_LQ_uar /
//                    t_int\src\Sources\H\Component_H\ -I                     /
//                    E:\单片机\K60\K60核心板源代码\03_LQ_uart_int\src\Source /
//                    s\H\Frame_H\ -Ol --use_c++_inline                       /
//    List file    =  E:\单片机\K60\K60核心板源代码\03_LQ_uart_int\bin\Flash\ /
//                    List\light.s                                            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME light

        #define SHT_PROGBITS 0x1

        EXTERN gpio_ctrl
        EXTERN gpio_init
        EXTERN gpio_reverse

        PUBLIC light_change
        PUBLIC light_control
        PUBLIC light_init

// E:\单片机\K60\K60核心板源代码\03_LQ_uart_int\src\Sources\C\Component_C\light.c
//    1 //-------------------------------------------------------------------------*
//    2 // 文件名: light.c                                                         *
//    3 // 说  明: 小灯驱动函数文件                                                *
//    4 //-------------------------------------------------------------------------*
//    5 
//    6 #include "light.h"               //指示灯驱动程序头文件   
//    7 
//    8 //-------------------------------------------------------------------------*
//    9 //函数名: light_init                                                       *
//   10 //功  能: 初始化指示灯状态                                                 *
//   11 //参  数: port:端口名                                                      *
//   12 //        name:指定端口引脚号                                              *
//   13 //        state:初始状态,1=高电平,0=低电平                                 *
//   14 //返  回: 无                                                               *
//   15 //说  明: 调用gpio_init函数                                                * 
//   16 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   17 void light_init(GPIO_MemMapPtr port,int name,int state)
//   18 {
light_init:
        PUSH     {R7,LR}
//   19 	gpio_init(port,name,1,state);//初始化指示灯
        MOVS     R3,R2
        MOVS     R2,#+1
        BL       gpio_init
//   20 }
        POP      {R0,PC}          ;; return
//   21 
//   22 //-------------------------------------------------------------------------* 
//   23 //函数名: light_control                                                    *
//   24 //功  能: 控制灯的亮和暗                                                   *
//   25 //参  数: port:端口名                                                      *
//   26 //        name:指定端口引脚号                                              *
//   27 //        state:状态,1=高电平,0=低电平                                     *
//   28 //返  回: 无                                                               *
//   29 //说  明: 调用gpio_ctrl函数                                                * 
//   30 //-------------------------------------------------------------------------*   

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   31 void light_control(GPIO_MemMapPtr port,int name,int state)
//   32 {
light_control:
        PUSH     {R7,LR}
//   33 	gpio_ctrl(port,name,state);   //控制引脚状态     
        BL       gpio_ctrl
//   34 } 
        POP      {R0,PC}          ;; return
//   35 
//   36 //-------------------------------------------------------------------------* 
//   37 //函数名: light_change                                                     *
//   38 //功  能: 状态切换:原来"暗",则变"亮";原来"亮",则变"暗"                     *
//   39 //参  数: port:端口名                                                      *
//   40 //        name:指定端口引脚号                                              *
//   41 //返  回: 无                                                               *
//   42 //说  明: 调用gpio_reverse函数                                             *
//   43 //-------------------------------------------------------------------------*  

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   44 void light_change(GPIO_MemMapPtr port,int name)
//   45 {
light_change:
        PUSH     {R7,LR}
//   46 	gpio_reverse(port,name);
        BL       gpio_reverse
//   47 }
        POP      {R0,PC}          ;; return

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
// 28 bytes in section .text
// 
// 28 bytes of CODE memory
//
//Errors: none
//Warnings: none
