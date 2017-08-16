///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      10/Feb/2015  20:04:46 /
// IAR ANSI C/C++ Compiler V6.30.4.23288/W32 EVALUATION for ARM               /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  E:\��Ƭ��\K60\K60���İ�Դ����\03_LQ_uart_int\src\Source /
//                    s\C\Component_C\light.c                                 /
//    Command line =  E:\��Ƭ��\K60\K60���İ�Դ����\03_LQ_uart_int\src\Source /
//                    s\C\Component_C\light.c -D IAR -D TWR_K60N512 -lCN      /
//                    E:\��Ƭ��\K60\K60���İ�Դ����\03_LQ_uart_int\bin\Flash\ /
//                    List\ -lB E:\��Ƭ��\K60\K60���İ�Դ����\03_LQ_uart_int\ /
//                    bin\Flash\List\ -o E:\��Ƭ��\K60\K60���İ�Դ����\03_LQ_ /
//                    uart_int\bin\Flash\Obj\ --no_cse --no_unroll            /
//                    --no_inline --no_code_motion --no_tbaa --no_clustering  /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "D:\MyProgramFiles\IAR V6.3\arm\INC\c\DLib_Config_Norma /
//                    l.h" -I E:\��Ƭ��\K60\K60���İ�Դ����\03_LQ_uart_int\sr /
//                    c\Sources\H\ -I E:\��Ƭ��\K60\K60���İ�Դ����\03_LQ_uar /
//                    t_int\src\Sources\H\Component_H\ -I                     /
//                    E:\��Ƭ��\K60\K60���İ�Դ����\03_LQ_uart_int\src\Source /
//                    s\H\Frame_H\ -Ol --use_c++_inline                       /
//    List file    =  E:\��Ƭ��\K60\K60���İ�Դ����\03_LQ_uart_int\bin\Flash\ /
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

// E:\��Ƭ��\K60\K60���İ�Դ����\03_LQ_uart_int\src\Sources\C\Component_C\light.c
//    1 //-------------------------------------------------------------------------*
//    2 // �ļ���: light.c                                                         *
//    3 // ˵  ��: С�����������ļ�                                                *
//    4 //-------------------------------------------------------------------------*
//    5 
//    6 #include "light.h"               //ָʾ����������ͷ�ļ�   
//    7 
//    8 //-------------------------------------------------------------------------*
//    9 //������: light_init                                                       *
//   10 //��  ��: ��ʼ��ָʾ��״̬                                                 *
//   11 //��  ��: port:�˿���                                                      *
//   12 //        name:ָ���˿����ź�                                              *
//   13 //        state:��ʼ״̬,1=�ߵ�ƽ,0=�͵�ƽ                                 *
//   14 //��  ��: ��                                                               *
//   15 //˵  ��: ����gpio_init����                                                * 
//   16 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   17 void light_init(GPIO_MemMapPtr port,int name,int state)
//   18 {
light_init:
        PUSH     {R7,LR}
//   19 	gpio_init(port,name,1,state);//��ʼ��ָʾ��
        MOVS     R3,R2
        MOVS     R2,#+1
        BL       gpio_init
//   20 }
        POP      {R0,PC}          ;; return
//   21 
//   22 //-------------------------------------------------------------------------* 
//   23 //������: light_control                                                    *
//   24 //��  ��: ���ƵƵ����Ͱ�                                                   *
//   25 //��  ��: port:�˿���                                                      *
//   26 //        name:ָ���˿����ź�                                              *
//   27 //        state:״̬,1=�ߵ�ƽ,0=�͵�ƽ                                     *
//   28 //��  ��: ��                                                               *
//   29 //˵  ��: ����gpio_ctrl����                                                * 
//   30 //-------------------------------------------------------------------------*   

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   31 void light_control(GPIO_MemMapPtr port,int name,int state)
//   32 {
light_control:
        PUSH     {R7,LR}
//   33 	gpio_ctrl(port,name,state);   //��������״̬     
        BL       gpio_ctrl
//   34 } 
        POP      {R0,PC}          ;; return
//   35 
//   36 //-------------------------------------------------------------------------* 
//   37 //������: light_change                                                     *
//   38 //��  ��: ״̬�л�:ԭ��"��",���"��";ԭ��"��",���"��"                     *
//   39 //��  ��: port:�˿���                                                      *
//   40 //        name:ָ���˿����ź�                                              *
//   41 //��  ��: ��                                                               *
//   42 //˵  ��: ����gpio_reverse����                                             *
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
