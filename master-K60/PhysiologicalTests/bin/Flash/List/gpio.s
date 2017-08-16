///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      11/Feb/2015  17:06:45 /
// IAR ANSI C/C++ Compiler V6.30.4.23288/W32 EVALUATION for ARM               /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  D:\MyProgramFiles\IAR V6.3\MyIAR\PhysiologicalTests\src /
//                    \Sources\C\Component_C\gpio.c                           /
//    Command line =  "D:\MyProgramFiles\IAR V6.3\MyIAR\PhysiologicalTests\sr /
//                    c\Sources\C\Component_C\gpio.c" -D IAR -D TWR_K60N512   /
//                    -lCN "D:\MyProgramFiles\IAR                             /
//                    V6.3\MyIAR\PhysiologicalTests\bin\Flash\List\" -lB      /
//                    "D:\MyProgramFiles\IAR V6.3\MyIAR\PhysiologicalTests\bi /
//                    n\Flash\List\" -o "D:\MyProgramFiles\IAR                /
//                    V6.3\MyIAR\PhysiologicalTests\bin\Flash\Obj\" --no_cse  /
//                    --no_unroll --no_inline --no_code_motion --no_tbaa      /
//                    --no_clustering --no_scheduling --debug                 /
//                    --endian=little --cpu=Cortex-M4 -e --fpu=None           /
//                    --dlib_config "D:\MyProgramFiles\IAR                    /
//                    V6.3\arm\INC\c\DLib_Config_Normal.h" -I                 /
//                    "D:\MyProgramFiles\IAR V6.3\MyIAR\PhysiologicalTests\sr /
//                    c\Sources\H\" -I "D:\MyProgramFiles\IAR                 /
//                    V6.3\MyIAR\PhysiologicalTests\src\Sources\H\Component_H /
//                    \" -I "D:\MyProgramFiles\IAR                            /
//                    V6.3\MyIAR\PhysiologicalTests\src\Sources\H\Frame_H\"   /
//                    -Ol --use_c++_inline                                    /
//    List file    =  D:\MyProgramFiles\IAR V6.3\MyIAR\PhysiologicalTests\bin /
//                    \Flash\List\gpio.s                                      /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME gpio

        #define SHT_PROGBITS 0x1

        PUBLIC gpio_ctrl
        PUBLIC gpio_init
        PUBLIC gpio_read
        PUBLIC gpio_reverse

// D:\MyProgramFiles\IAR V6.3\MyIAR\PhysiologicalTests\src\Sources\C\Component_C\gpio.c
//    1 //-------------------------------------------------------------------------*
//    2 // 文件名: gpio.c                                                          *
//    3 // 说  明: gpio驱动程序文件                                                *
//    4 //-------------------------------------------------------------------------*
//    5 
//    6 #include "gpio.h"     //包含gpio头文件
//    7 
//    8 //-------------------------------------------------------------------------*
//    9 //函数名: gpio_init                                                        *
//   10 //功  能: 初始化gpio                                                       * 
//   11 //参  数: port:端口名                                                      *
//   12 //        index:指定端口引脚                                               *
//   13 //        dir:引脚方向,0=输入,1=输出                                       * 
//   14 //        data:初始状态,0=低电平,1=高电平                                  *
//   15 //返  回: 无                                                               *
//   16 //说  明: 无                                                               *
//   17 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   18 void gpio_init(GPIO_MemMapPtr port, int index, int dir,int data)
//   19 {
gpio_init:
        PUSH     {R4-R6}
//   20      PORT_MemMapPtr p;
//   21      switch((uint32)port)
        MOVS     R5,R0
        LDR.N    R6,??DataTable0  ;; 0x400ff000
        SUBS     R5,R5,R6
        BEQ.N    ??gpio_init_0
        SUBS     R5,R5,#+64
        BEQ.N    ??gpio_init_1
        SUBS     R5,R5,#+64
        BEQ.N    ??gpio_init_2
        SUBS     R5,R5,#+64
        BEQ.N    ??gpio_init_3
        SUBS     R5,R5,#+64
        BEQ.N    ??gpio_init_4
        B.N      ??gpio_init_5
//   22      {
//   23      case 0x400FF000u:
//   24          p = PORTA_BASE_PTR;
??gpio_init_0:
        LDR.N    R4,??DataTable0_1  ;; 0x40049000
//   25          break;
        B.N      ??gpio_init_6
//   26      case 0x400FF040u:
//   27          p = PORTB_BASE_PTR;
??gpio_init_1:
        LDR.N    R4,??DataTable0_2  ;; 0x4004a000
//   28          break;
        B.N      ??gpio_init_6
//   29      case 0x400FF080u:
//   30          p = PORTC_BASE_PTR;
??gpio_init_2:
        LDR.N    R4,??DataTable0_3  ;; 0x4004b000
//   31          break;
        B.N      ??gpio_init_6
//   32      case 0x400FF0C0u:
//   33          p = PORTD_BASE_PTR;
??gpio_init_3:
        LDR.N    R4,??DataTable0_4  ;; 0x4004c000
//   34          break;
        B.N      ??gpio_init_6
//   35      case 0x400FF100u:
//   36          p = PORTE_BASE_PTR;
??gpio_init_4:
        LDR.N    R4,??DataTable0_5  ;; 0x4004d000
//   37          break;
        B.N      ??gpio_init_6
//   38      default:
//   39          break;
//   40      }
//   41      PORT_PCR_REG(p,index)=(0|PORT_PCR_MUX(1));
??gpio_init_5:
??gpio_init_6:
        MOV      R5,#+256
        STR      R5,[R4, R1, LSL #+2]
//   42 
//   43      if(dir == 1)//output
        CMP      R2,#+1
        BNE.N    ??gpio_init_7
//   44      {
//   45     	 GPIO_PDDR_REG(port) |= (1<<index);
        LDR      R2,[R0, #+20]
        MOVS     R4,#+1
        LSLS     R4,R4,R1
        ORRS     R2,R4,R2
        STR      R2,[R0, #+20]
//   46     	 if(data == 1)
        CMP      R3,#+1
        BNE.N    ??gpio_init_8
//   47            GPIO_PDOR_REG(port) |= (1<<index);
        LDR      R2,[R0, #+0]
        MOVS     R3,#+1
        LSLS     R1,R3,R1
        ORRS     R1,R1,R2
        STR      R1,[R0, #+0]
        B.N      ??gpio_init_9
//   48          else
//   49            GPIO_PDOR_REG(port) &= ~(1<<index);
??gpio_init_8:
        LDR      R2,[R0, #+0]
        MOVS     R3,#+1
        LSLS     R1,R3,R1
        BICS     R1,R2,R1
        STR      R1,[R0, #+0]
        B.N      ??gpio_init_9
//   50      }       
//   51      else
//   52          GPIO_PDDR_REG(port) &= ~(1<<index);
??gpio_init_7:
        LDR      R2,[R0, #+20]
        MOVS     R3,#+1
        LSLS     R1,R3,R1
        BICS     R1,R2,R1
        STR      R1,[R0, #+20]
//   53 
//   54 }
??gpio_init_9:
        POP      {R4-R6}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     0x40049000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     0x4004a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC32     0x4004b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_4:
        DC32     0x4004c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_5:
        DC32     0x4004d000
//   55 
//   56 //-------------------------------------------------------------------------* 
//   57 //函数名: gpio_ctrl                                                        *
//   58 //功  能: 设置引脚状态                                                     *
//   59 //参  数: port:端口名                                                      *
//   60 //        index:指定端口引脚                                               *
//   61 //        data: 状态,0=低电平,1=高电平                                     *
//   62 //返  回: 无                                                               *
//   63 //说  明: 无                                                               *
//   64 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   65 void gpio_ctrl (GPIO_MemMapPtr port, int index, int data)
//   66 {
//   67     if(data == 1)//output
gpio_ctrl:
        CMP      R2,#+1
        BNE.N    ??gpio_ctrl_0
//   68          GPIO_PDOR_REG(port) |= (1<<index);
        LDR      R2,[R0, #+0]
        MOVS     R3,#+1
        LSLS     R1,R3,R1
        ORRS     R1,R1,R2
        STR      R1,[R0, #+0]
        B.N      ??gpio_ctrl_1
//   69     else
//   70          GPIO_PDOR_REG(port) &= ~(1<<index);
??gpio_ctrl_0:
        LDR      R2,[R0, #+0]
        MOVS     R3,#+1
        LSLS     R1,R3,R1
        BICS     R1,R2,R1
        STR      R1,[R0, #+0]
//   71 }
??gpio_ctrl_1:
        BX       LR               ;; return
//   72 
//   73 //-----------------------------------------------------------------------* 
//   74 //函数名: gpio_reverse                                                   *
//   75 //功  能: 改变引脚状态                                                   *
//   76 //参  数: port:端口名;                                                   *
//   77 //        index:指定端口引脚                                             *
//   78 //返  回: 无                                                             *
//   79 //说  明: 无                                                             *
//   80 //-----------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   81 void gpio_reverse (GPIO_MemMapPtr port, int index)
//   82 {
//   83     GPIO_PDOR_REG(port) ^= (1<<index);
gpio_reverse:
        LDR      R2,[R0, #+0]
        MOVS     R3,#+1
        LSLS     R1,R3,R1
        EORS     R1,R1,R2
        STR      R1,[R0, #+0]
//   84 }
        BX       LR               ;; return
//   85 
//   86 //-----------------------------------------------------------------------* 
//   87 //函数名: gpio_read                                                      *
//   88 //功  能: 检测输入引脚的状态                                             *
//   89 //参  数: port:端口名;                                                   *
//   90 //        index:指定端口引脚                                             *
//   91 //返  回: 无                                                             *
//   92 //说  明: 无                                                             *
//   93 //-----------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   94 uint32 gpio_read(GPIO_MemMapPtr port,uint8 index)
//   95 {
//   96   uint32 a;
//   97   uint8  b;
//   98   a=GPIO_PDIR_REG(port);
gpio_read:
        LDR      R0,[R0, #+16]
//   99   b=(a&(1<<index))>>index;
        MOVS     R2,#+1
        LSLS     R2,R2,R1
        ANDS     R0,R2,R0
        LSRS     R0,R0,R1
//  100   return b;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
//  101 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  102 
//  103 /*void hw_gpio_set(GPIO_MemMapPtr port, uint8 pin,uint8 state)
//  104 {
//  105    GPIO_MemMapPtr pt=hw_gpio_get_pt_addr(port);
//  106    if(state==0)
//  107      (GPIO_PDOR_REG(pt))&=~(1<<(pin));
//  108    else
//  109      (GPIO_PDOR_REG(pt))|=(1<<(pin));
//  110 }
//  111 
//  112 uint8 hw_gpio_get(GPIO_MemMapPtr port,uint8 pin)
//  113 {
//  114   uint8 i;
//  115   GPIO_MemMapPtr pt=hw_gpio_get_pt_addr(port);
//  116   i=(((GPIO_PDOR_REG(pt))>>(pin))&1);
//  117   return i;
//  118 }
//  119 
//  120 GPIO_MemMapPtr hw_gpio_get_pt_addr(GPIO_MemMapPtr port)
//  121 {
//  122    GPIO_MemMapPtr p;
//  123    switch(port)
//  124    {
//  125       case 0x400FF000u:
//  126          p = PORTA_BASE_PTR;
//  127          break;
//  128      case 0x400FF040u:
//  129          p = PORTB_BASE_PTR;
//  130          break;
//  131      case 0x400FF080u:
//  132          p = PORTC_BASE_PTR;
//  133          break;
//  134      case 0x400FF0C0u:
//  135          p = PORTD_BASE_PTR;
//  136          break;
//  137      case 0x400FF100u:
//  138          p = PORTE_BASE_PTR;
//  139          break;
//  140      default:
//  141          break;
//  142    }
//  143    return p;
//  144 }*/
//  145 
// 
// 208 bytes in section .text
// 
// 208 bytes of CODE memory
//
//Errors: none
//Warnings: none
