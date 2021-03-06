///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      10/Feb/2015  19:50:58 /
// IAR ANSI C/C++ Compiler V6.30.4.23288/W32 EVALUATION for ARM               /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  E:\单片机\K60\K60核心板源代码\03_LQ_uart_int\src\Source /
//                    s\C\Component_C\decoder.c                               /
//    Command line =  E:\单片机\K60\K60核心板源代码\03_LQ_uart_int\src\Source /
//                    s\C\Component_C\decoder.c -D IAR -D TWR_K60N512 -lCN    /
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
//                    List\decoder.s                                          /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME decoder

        #define SHT_PROGBITS 0x1



        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// E:\单片机\K60\K60核心板源代码\03_LQ_uart_int\src\Sources\C\Component_C\decoder.c
//    1 #include "common.h"
//    2 #include "decoder.h"
//    3 /*==============================================================================
//    4 功能：FTM1、FTM2模块双路正交脉冲计数
//    5 引脚：PTA12、PTA13、PTB18、PTB19
//    6 内容：初始化FTM1、FTM2的正交解码功能
//    7 参数：无
//    8 E6A2-CW3C光电编码器引脚：
//    9          蓝色：GND
//   10          棕色：VCC
//   11          黑色：A相
//   12          白色：B相
//   13 ==============================================================================*/
//   14 /*
//   15 void FTM_QUAD_init()
//   16 {
//   17   
//   18   SIM_SCGC6|=SIM_SCGC6_FTM1_MASK;//使能FTM1、FTM2时钟
//   19   SIM_SCGC3|=SIM_SCGC3_FTM2_MASK;
//   20   
//   21   SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;//开启端口时钟
//   22   
//   23  
//   24   PORTA_PCR12 = PORT_PCR_MUX(7);  // 选择管脚复用功能                      //特定芯片是什么功能
//   25   PORTA_PCR13 = PORT_PCR_MUX(7);
//   26 
//   27   PORTB_PCR18 = PORT_PCR_MUX(6);
//   28   PORTB_PCR19 = PORT_PCR_MUX(6);
//   29  
//   30   FTM1_CNTIN = 0;                                          //FTM1初始值
//   31   FTM2_CNTIN = 0;                                          //FTM2初始值
//   32   FTM1_MOD = 65535;                                        //可根据需要设置结束值
//   33   FTM2_MOD = 65535;                                        
//   34   
//   35   FTM1_MODE |= FTM_MODE_WPDIS_MASK;                        //禁止写保护
//   36   FTM2_MODE |= FTM_MODE_WPDIS_MASK;                        //禁止写保护
//   37  
//   38   FTM1_QDCTRL|=FTM_QDCTRL_QUADMODE_MASK;                   //AB相同时确定方向和计数值  
//   39   FTM2_QDCTRL|=FTM_QDCTRL_QUADMODE_MASK;                   //AB相同时确定方向和计数值  
//   40 
//   41   FTM1_QDCTRL |= FTM_QDCTRL_QUADEN_MASK;                   //使能正交解码模式
//   42   FTM2_QDCTRL |= FTM_QDCTRL_QUADEN_MASK;                   //使能正交解码模式
//   43   
//   44   FTM1_MODE |= FTM_MODE_FTMEN_MASK;                        //FTMEN=1,关闭TPM兼容模式，开启FTM所有功能
//   45   FTM2_MODE |= FTM_MODE_FTMEN_MASK;                        //FTMEN=1,关闭TPM兼容模式，开启FTM所有功能
//   46   
//   47   FTM1_CNT=0; 
//   48   FTM2_CNT=0; 
//   49 }
//   50 
//   51 */
//   52 
//   53 /*************************************************************************
//   54 *  函数名称：FTM2_QUAD_DIR_init
//   55 *  功能说明：正交解码 方向计数模式初始化函数
//   56 *  函数返回：无
//   57 *  修改时间：2012-1-26
//   58 *  备    注：
//   59              该例程使用 A10 和A11 引脚输入作为旋转编码器的 A相和B 相输入。 
//   60               B路控制计数器方向  高电平时计数器正向计数
//   61               A路计数脉冲
//   62               对B路默认上拉
//   63 *************************************************************************/
//   64 /*void FTM_QUAD_DIR_init()
//   65 {
//   66    
//   67     SIM_SCGC6 |=SIM_SCGC6_FTM1_MASK;                             //使能FTM1时钟
//   68     SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;                           //使能FTM2时钟
//   69     
//   70     SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
//   71     SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
//   72     
//   73     PORT_PCR_REG(PORTA_BASE_PTR, 12) = (0|PORT_PCR_MUX(7)|0x10);     // PTA12
//   74     PORT_PCR_REG(PORTA_BASE_PTR, 13) = (0|PORT_PCR_MUX(7)|0x13);     // PTA13
//   75     PORT_PCR_REG(PORTB_BASE_PTR, 18) = PORT_PCR_MUX(6);              // PTB18
//   76     PORT_PCR_REG(PORTB_BASE_PTR, 19) = PORT_PCR_MUX(6);              // PTB19
//   77       
//   78     FTM_MODE_REG(FTM1_BASE_PTR)    |= FTM_MODE_WPDIS_MASK;           //写保护禁止
//   79     FTM_QDCTRL_REG(FTM1_BASE_PTR)  &=~FTM_QDCTRL_QUADMODE_MASK;       //AB相同时确定方向和计数值
//   80     FTM_CNTIN_REG(FTM1_BASE_PTR)    = 0;                             //FTM1计数器初始值为0
//   81     FTM_MOD_REG(FTM1_BASE_PTR)      = 0xFFFF;                        //FTM1计数器终值为0
//   82     
//   83     FTM_MODE_REG(FTM2_BASE_PTR)    |= FTM_MODE_WPDIS_MASK;           //写保护禁止
//   84     FTM_QDCTRL_REG(FTM2_BASE_PTR)  &= ~FTM_QDCTRL_QUADMODE_MASK;     //AB 正交解码模式
//   85     FTM_CNTIN_REG(FTM2_BASE_PTR)    = 0;                             //FTM计数器初始值为0
//   86     FTM_MOD_REG(FTM2_BASE_PTR)      = 0xFFFF;                        //FTM计数器初始值为0
//   87     
//   88     FTM_QDCTRL_REG(FTM1_BASE_PTR)  |=FTM_QDCTRL_QUADEN_MASK;         //使能FTM1正交解码模式
//   89     FTM_MODE_REG(FTM1_BASE_PTR)    |= FTM_MODE_FTMEN_MASK;           //FTM1EN=1	
//   90     FTM_CNT_REG(FTM1_BASE_PTR)     = 0; 
//   91     
//   92     FTM_QDCTRL_REG(FTM2_BASE_PTR)  |=FTM_QDCTRL_QUADEN_MASK;         //使能FTM2正交解码模式
//   93     FTM_MODE_REG(FTM2_BASE_PTR)    |= FTM_MODE_FTMEN_MASK;           //FTM2EN=1	
//   94     FTM_CNT_REG(FTM2_BASE_PTR)     = 0; 	
//   95 }*/
//   96 
//   97 
//   98 
//   99 /*************************************************************************
//  100 *  函数名称：FTM2_init
//  101 *  功能说明：正交解码 方向计数模式初始化函数
//  102 *  函数返回：无
//  103 *  修改时间：2012-1-26
//  104 *  备    注：CH0~CH3可以使用过滤器，未添加这功能
//  105              该例程使用 A10 和A11 引脚输入作为旋转编码器的 A相和B 相输入。 
//  106 *************************************************************************
//  107 void FTM_QUAD_init()
//  108 {
//  109     SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;                                 //使能FTM2时钟
//  110 
//  111     SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
//  112     PORT_PCR_REG(PORTB_BASE_PTR, 18) = PORT_PCR_MUX(6);               // PTB18
//  113     PORT_PCR_REG(PORTB_BASE_PTR, 19) = PORT_PCR_MUX(6);               // PTB19
//  114        
//  115     FTM_MODE_REG(FTM2_BASE_PTR)    |= FTM_MODE_WPDIS_MASK;           //写保护禁止
//  116     FTM_QDCTRL_REG(FTM2_BASE_PTR)  &= ~FTM_QDCTRL_QUADMODE_MASK;     //AB 正交解码模式
//  117     FTM_CNTIN_REG(FTM2_BASE_PTR)    = 0;                             //FTM计数器初始值为0
//  118     FTM_MOD_REG(FTM2_BASE_PTR)      = 0xFFFF;                        //FTM计数器初始值为0
//  119    
//  120     FTM_QDCTRL_REG(FTM2_BASE_PTR)  |=FTM_QDCTRL_QUADEN_MASK;         //使能FTM2正交解码模式
//  121     FTM_MODE_REG(FTM2_BASE_PTR)    |= FTM_MODE_FTMEN_MASK;                             //FTM2EN=1	
//  122     FTM_CNT_REG(FTM2_BASE_PTR)    = 0; 	
//  123 }*/
// 
//
// 
//
//
//Errors: none
//Warnings: none
