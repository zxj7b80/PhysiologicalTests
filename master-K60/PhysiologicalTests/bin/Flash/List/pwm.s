///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       08/Apr/2015  15:29:17
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\C\Component_C\pwm.c
//    Command line =  
//        C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\C\Component_C\pwm.c
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
//        C:\Users\Administrator\Desktop\PhysiologicalTests\bin\Flash\List\pwm.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN periph_clk_khz

        PUBLIC FTM2_QUAD_Iint
        PUBLIC FTM_ChanceFrequence
        PUBLIC FTM_MOD0
        PUBLIC FTM_MOD1
        PUBLIC FTM_MOD2
        PUBLIC FTM_PWM_ChangeDuty
        PUBLIC FTM_PWM_Init
        PUBLIC FTM_PWM_Open
        PUBLIC Motor_init

// C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\C\Component_C\pwm.c
//    1 #include<pwm.h>
//    2 #include<gpio.h>    
//    3 
//    4 extern int periph_clk_khz;

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    5 uint32 FTM_MOD0=0;
FTM_MOD0:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    6 uint32 FTM_MOD1=0;
FTM_MOD1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    7 uint32 FTM_MOD2=0;
FTM_MOD2:
        DS8 4
//    8  
//    9 
//   10 /***************************************************************
//   11 *函数名：uint8 FTM_PWM_Init(uint8 FTMx,uint32 freq)
//   12 *功能：  将特定的FTMx初始化为pwm输出，并且设置频率
//   13 *入口参数：(1)FTMx : 0
//   14                      1
//   15                      2
//   16            
//   17           (2)fre  :  Hz
//   18 *出口参数：无
//   19 *说明：无
//   20 ***************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   21 uint8 FTM_PWM_Init(uint8 FTMx,uint32 freq)
//   22 {
FTM_PWM_Init:
        PUSH     {R4,R5}
//   23   uint32 bus_clk_hz;
//   24   uint32 mod;
//   25   uint8  ps=0;
        MOVS     R3,#+0
//   26   
//   27   bus_clk_hz = periph_clk_khz*1000;
        LDR.W    R2,??DataTable5
        LDR      R2,[R2, #+0]
        MOV      R4,#+1000
        MULS     R2,R4,R2
//   28     
//   29   if(freq>bus_clk_hz) return 0;
        CMP      R2,R1
        BCS.N    ??FTM_PWM_Init_0
        MOVS     R0,#+0
        B.N      ??FTM_PWM_Init_1
//   30   //128分频
//   31   if((mod=bus_clk_hz/(freq*128)) < 0xFFFFu)
??FTM_PWM_Init_0:
        MOVS     R3,#+128
        MUL      R3,R3,R1
        UDIV     R4,R2,R3
        MOVW     R3,#+65535
        CMP      R4,R3
        BCS.W    ??FTM_PWM_Init_2
//   32   {
//   33     ps = 7;
        MOVS     R3,#+7
//   34     if(FTMx==0)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.W    ??FTM_PWM_Init_3
//   35     {
//   36       FTM_MOD0=mod;
        LDR.W    R5,??DataTable5_1
        STR      R4,[R5, #+0]
//   37     }
//   38     else if(FTMx==1)
//   39     {
//   40       FTM_MOD1=mod;
//   41     }
//   42     else if(FTMx==2)
//   43     {
//   44       FTM_MOD2=mod;  
//   45     }
//   46     else
//   47       return 0;
//   48     //64分频
//   49     if((mod=bus_clk_hz/(freq*64)) < 0xFFFFu)
??FTM_PWM_Init_4:
        MOVS     R4,#+64
        MUL      R4,R4,R1
        UDIV     R4,R2,R4
        MOVW     R5,#+65535
        CMP      R4,R5
        BCS.N    ??FTM_PWM_Init_5
//   50     {
//   51       ps = 6;   
        MOVS     R3,#+6
//   52       if(FTMx==0)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.W    ??FTM_PWM_Init_6
//   53       {
//   54         FTM_MOD0= mod;
        LDR.W    R5,??DataTable5_1
        STR      R4,[R5, #+0]
//   55       }
//   56       else if(FTMx==1)
//   57       {
//   58         FTM_MOD1=mod;
//   59       }
//   60       else if(FTMx==2)
//   61       {
//   62         FTM_MOD2=mod;  
//   63       }
//   64       else
//   65         return 0;
//   66       //32分频
//   67       if((mod=bus_clk_hz/(freq*32)) < 0xFFFFu)
??FTM_PWM_Init_7:
        LSLS     R4,R1,#+5
        UDIV     R4,R2,R4
        MOVW     R5,#+65535
        CMP      R4,R5
        BCS.N    ??FTM_PWM_Init_5
//   68       {
//   69         ps = 5; 
        MOVS     R3,#+5
//   70         if(FTMx==0)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.W    ??FTM_PWM_Init_8
//   71         {
//   72           FTM_MOD0= mod;
        LDR.W    R5,??DataTable5_1
        STR      R4,[R5, #+0]
//   73         }
//   74         else if(FTMx==1)
//   75         {
//   76           FTM_MOD1=mod;
//   77         }
//   78         else if(FTMx==2)
//   79         {
//   80           FTM_MOD2=mod;  
//   81         }
//   82         else
//   83           return 0;
//   84         //16分频
//   85         if((mod=bus_clk_hz/(freq*16)) < 0xFFFFu)
??FTM_PWM_Init_9:
        LSLS     R4,R1,#+4
        UDIV     R4,R2,R4
        MOVW     R5,#+65535
        CMP      R4,R5
        BCS.N    ??FTM_PWM_Init_5
//   86         {
//   87           ps = 4;  
        MOVS     R3,#+4
//   88           if(FTMx==0)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.W    ??FTM_PWM_Init_10
//   89           {
//   90             FTM_MOD0= mod;
        LDR.W    R5,??DataTable5_1
        STR      R4,[R5, #+0]
//   91           }
//   92           else if(FTMx==1)
//   93           {
//   94             FTM_MOD1=mod;
//   95           }
//   96           else if(FTMx==2)
//   97           {
//   98             FTM_MOD2=mod;  
//   99           }
//  100           else
//  101             return 0;
//  102           //8分频
//  103           if((mod=bus_clk_hz/(freq*8)) < 0xFFFFu)
??FTM_PWM_Init_11:
        LSLS     R4,R1,#+3
        UDIV     R4,R2,R4
        MOVW     R5,#+65535
        CMP      R4,R5
        BCS.N    ??FTM_PWM_Init_5
//  104           {
//  105             ps = 3;
        MOVS     R3,#+3
//  106             if(FTMx==0)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.W    ??FTM_PWM_Init_12
//  107             {
//  108               FTM_MOD0= mod;
        LDR.W    R5,??DataTable5_1
        STR      R4,[R5, #+0]
//  109             }
//  110             else if(FTMx==1)
//  111             {
//  112               FTM_MOD1=mod;
//  113             }
//  114             else if(FTMx==2)
//  115             {
//  116               FTM_MOD2=mod;  
//  117             }
//  118             else
//  119               return 0;
//  120             //4分频
//  121             if((mod=bus_clk_hz/(freq*4)) < 0xFFFFu)
??FTM_PWM_Init_13:
        LSLS     R4,R1,#+2
        UDIV     R4,R2,R4
        MOVW     R5,#+65535
        CMP      R4,R5
        BCS.N    ??FTM_PWM_Init_5
//  122             {
//  123               ps = 2;
        MOVS     R3,#+2
//  124               if(FTMx==0)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.W    ??FTM_PWM_Init_14
//  125               {
//  126                 FTM_MOD0= mod;
        LDR.W    R5,??DataTable5_1
        STR      R4,[R5, #+0]
//  127               }
//  128               else if(FTMx==1)
//  129               {
//  130                 FTM_MOD1=mod;
//  131               }
//  132               else if(FTMx==2)
//  133               {
//  134                 FTM_MOD2=mod;  
//  135               }
//  136               else
//  137                 return 0;
//  138               //2分频
//  139               if((mod=bus_clk_hz/(freq*2)) < 0xFFFFu)
??FTM_PWM_Init_15:
        LSLS     R4,R1,#+1
        UDIV     R4,R2,R4
        MOVW     R5,#+65535
        CMP      R4,R5
        BCS.N    ??FTM_PWM_Init_5
//  140               {
//  141                 ps = 1;
        MOVS     R3,#+1
//  142                 if(FTMx==0)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.W    ??FTM_PWM_Init_16
//  143                 {
//  144                   FTM_MOD0= mod;
        LDR.W    R5,??DataTable5_1
        STR      R4,[R5, #+0]
//  145                 }
//  146                 else if(FTMx==1)
//  147                 {
//  148                   FTM_MOD1=mod;
//  149                 }
//  150                 else if(FTMx==2)
//  151                 {
//  152                   FTM_MOD2=mod;  
//  153                 }
//  154                 else
//  155                   return 0;
//  156                 //1分频
//  157                 if((mod=bus_clk_hz/(freq*1)) < 0xFFFFu)
??FTM_PWM_Init_17:
        UDIV     R4,R2,R1
        MOVW     R1,#+65535
        CMP      R4,R1
        BCS.N    ??FTM_PWM_Init_5
//  158                 {
//  159                   ps = 0;
        MOVS     R3,#+0
//  160                   if(FTMx==0)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.W    ??FTM_PWM_Init_18
//  161                   {
//  162                     FTM_MOD0= mod;
        LDR.W    R1,??DataTable5_1
        STR      R4,[R1, #+0]
//  163                   }
//  164                   else if(FTMx==1)
//  165                   {
//  166                     FTM_MOD1=mod;
//  167                   }
//  168                   else if(FTMx==2)
//  169                   {
//  170                     FTM_MOD2=mod;  
//  171                   }
//  172                   else
//  173                     return 0;
//  174                 }
//  175               }
//  176             }
//  177           }
//  178         }  
//  179       }
//  180     }
//  181   }
//  182   else
//  183   {
//  184     return 0;
//  185   }
//  186   
//  187   if(FTMx==0)
??FTM_PWM_Init_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.W    ??FTM_PWM_Init_19
//  188   {
//  189     // 使能FTM时钟模块
//  190     SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;
        LDR.W    R0,??DataTable5_2  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.W    R1,??DataTable5_2  ;; 0x4004803c
        STR      R0,[R1, #+0]
//  191 
//  192     // 配置FTM控制寄存器
//  193     // 禁用中断, 加计数模式, 时钟源:System clock（Bus Clk）, 分频系数:8
//  194     // 假设SysClk = 50MHz, SC_PS=3, FTM Clk = 50MHz/2^3 = 6.25MHz
//  195     FTM0_SC = FTM_SC_CLKS(1)|FTM_SC_PS(ps);
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        ANDS     R0,R3,#0x7
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable5_3  ;; 0x40038000
        STR      R0,[R1, #+0]
//  196 
//  197     // 设置PWM周期及占空比
//  198     // PWM周期 = (MOD-CNTIN+1)*FTM时钟周期 :
//  199     // 配置FTM计数初始值
//  200     FTM0_CNT = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable5_4  ;; 0x40038004
        STR      R0,[R1, #+0]
//  201     FTM0_CNTIN = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable5_5  ;; 0x4003804c
        STR      R0,[R1, #+0]
//  202     
//  203     // 配置FTM计数MOD值
//  204     FTM0_MOD = FTM_MOD0;
        LDR.W    R0,??DataTable5_1
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable5_6  ;; 0x40038008
        STR      R0,[R1, #+0]
//  205   }
//  206   else if(FTMx==1)
//  207   {
//  208     // 使能FTM时钟模块
//  209     SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;
//  210 
//  211     // 配置FTM控制寄存器
//  212     // 禁用中断, 加计数模式, 时钟源:System clock（Bus Clk）, 分频系数:8
//  213     // 假设SysClk = 50MHz, SC_PS=3, FTM Clk = 50MHz/2^3 = 6.25MHz
//  214     FTM1_SC = FTM_SC_CLKS(1)|FTM_SC_PS(ps);
//  215 
//  216     // 设置PWM周期及占空比
//  217     // PWM周期 = (MOD-CNTIN+1)*FTM时钟周期 :
//  218     // 配置FTM计数初始值
//  219     FTM1_CNT = 0;
//  220     FTM1_CNTIN = 0;
//  221     
//  222     // 配置FTM计数MOD值
//  223     FTM1_MOD = FTM_MOD1;
//  224   } 
//  225   else if(FTMx==2)
//  226   {
//  227     // 使能FTM时钟模块
//  228     SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;
//  229 
//  230     // 配置FTM控制寄存器
//  231     // 禁用中断, 加计数模式, 时钟源:System clock（Bus Clk）, 分频系数:8
//  232     // 假设SysClk = 50MHz, SC_PS=3, FTM Clk = 50MHz/2^3 = 6.25MHz
//  233     FTM2_SC = FTM_SC_CLKS(1)|FTM_SC_PS(ps);
//  234 
//  235     // 设置PWM周期及占空比
//  236     // PWM周期 = (MOD-CNTIN+1)*FTM时钟周期 :
//  237     // 配置FTM计数初始值
//  238     FTM2_CNT = 0;
//  239     FTM2_CNTIN = 0;
//  240     
//  241     // 配置FTM计数MOD值
//  242     FTM2_MOD = FTM_MOD2;
//  243   }  
//  244   else
//  245     return 0;
//  246 
//  247   return 1;
??FTM_PWM_Init_20:
        MOVS     R0,#+1
??FTM_PWM_Init_1:
        POP      {R4,R5}
        BX       LR               ;; return
??FTM_PWM_Init_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??FTM_PWM_Init_21
        LDR.W    R5,??DataTable5_7
        STR      R4,[R5, #+0]
        B.N      ??FTM_PWM_Init_4
??FTM_PWM_Init_21:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??FTM_PWM_Init_22
        LDR.W    R5,??DataTable5_8
        STR      R4,[R5, #+0]
        B.N      ??FTM_PWM_Init_4
??FTM_PWM_Init_22:
        MOVS     R0,#+0
        B.N      ??FTM_PWM_Init_1
??FTM_PWM_Init_6:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??FTM_PWM_Init_23
        LDR.W    R5,??DataTable5_7
        STR      R4,[R5, #+0]
        B.N      ??FTM_PWM_Init_7
??FTM_PWM_Init_23:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??FTM_PWM_Init_24
        LDR.W    R5,??DataTable5_8
        STR      R4,[R5, #+0]
        B.N      ??FTM_PWM_Init_7
??FTM_PWM_Init_24:
        MOVS     R0,#+0
        B.N      ??FTM_PWM_Init_1
??FTM_PWM_Init_8:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??FTM_PWM_Init_25
        LDR.W    R5,??DataTable5_7
        STR      R4,[R5, #+0]
        B.N      ??FTM_PWM_Init_9
??FTM_PWM_Init_25:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??FTM_PWM_Init_26
        LDR.W    R5,??DataTable5_8
        STR      R4,[R5, #+0]
        B.N      ??FTM_PWM_Init_9
??FTM_PWM_Init_26:
        MOVS     R0,#+0
        B.N      ??FTM_PWM_Init_1
??FTM_PWM_Init_10:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??FTM_PWM_Init_27
        LDR.W    R5,??DataTable5_7
        STR      R4,[R5, #+0]
        B.N      ??FTM_PWM_Init_11
??FTM_PWM_Init_27:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??FTM_PWM_Init_28
        LDR.W    R5,??DataTable5_8
        STR      R4,[R5, #+0]
        B.N      ??FTM_PWM_Init_11
??FTM_PWM_Init_28:
        MOVS     R0,#+0
        B.N      ??FTM_PWM_Init_1
??FTM_PWM_Init_12:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??FTM_PWM_Init_29
        LDR.W    R5,??DataTable5_7
        STR      R4,[R5, #+0]
        B.N      ??FTM_PWM_Init_13
??FTM_PWM_Init_29:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??FTM_PWM_Init_30
        LDR.W    R5,??DataTable5_8
        STR      R4,[R5, #+0]
        B.N      ??FTM_PWM_Init_13
??FTM_PWM_Init_30:
        MOVS     R0,#+0
        B.N      ??FTM_PWM_Init_1
??FTM_PWM_Init_14:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??FTM_PWM_Init_31
        LDR.W    R5,??DataTable5_7
        STR      R4,[R5, #+0]
        B.N      ??FTM_PWM_Init_15
??FTM_PWM_Init_31:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??FTM_PWM_Init_32
        LDR.W    R5,??DataTable5_8
        STR      R4,[R5, #+0]
        B.N      ??FTM_PWM_Init_15
??FTM_PWM_Init_32:
        MOVS     R0,#+0
        B.N      ??FTM_PWM_Init_1
??FTM_PWM_Init_16:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??FTM_PWM_Init_33
        LDR.W    R5,??DataTable5_7
        STR      R4,[R5, #+0]
        B.N      ??FTM_PWM_Init_17
??FTM_PWM_Init_33:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??FTM_PWM_Init_34
        LDR.W    R5,??DataTable5_8
        STR      R4,[R5, #+0]
        B.N      ??FTM_PWM_Init_17
??FTM_PWM_Init_34:
        MOVS     R0,#+0
        B.N      ??FTM_PWM_Init_1
??FTM_PWM_Init_18:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??FTM_PWM_Init_35
        LDR.W    R1,??DataTable5_7
        STR      R4,[R1, #+0]
        B.N      ??FTM_PWM_Init_5
??FTM_PWM_Init_35:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??FTM_PWM_Init_36
        LDR.W    R1,??DataTable5_8
        STR      R4,[R1, #+0]
        B.N      ??FTM_PWM_Init_5
??FTM_PWM_Init_36:
        MOVS     R0,#+0
        B.N      ??FTM_PWM_Init_1
??FTM_PWM_Init_2:
        MOVS     R0,#+0
        B.N      ??FTM_PWM_Init_1
??FTM_PWM_Init_19:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??FTM_PWM_Init_37
        LDR.W    R0,??DataTable5_2  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.W    R1,??DataTable5_2  ;; 0x4004803c
        STR      R0,[R1, #+0]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        ANDS     R0,R3,#0x7
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable5_9  ;; 0x40039000
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable5_10  ;; 0x40039004
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable5_11  ;; 0x4003904c
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5_7
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable5_12  ;; 0x40039008
        STR      R0,[R1, #+0]
        B.N      ??FTM_PWM_Init_20
??FTM_PWM_Init_37:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??FTM_PWM_Init_38
        LDR.W    R0,??DataTable5_13  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.W    R1,??DataTable5_13  ;; 0x40048030
        STR      R0,[R1, #+0]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        ANDS     R0,R3,#0x7
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable5_14  ;; 0x400b8000
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable5_15  ;; 0x400b8004
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable5_16  ;; 0x400b804c
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5_8
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable5_17  ;; 0x400b8008
        STR      R0,[R1, #+0]
        B.N      ??FTM_PWM_Init_20
??FTM_PWM_Init_38:
        MOVS     R0,#+0
        B.N      ??FTM_PWM_Init_1
//  248 }
//  249 
//  250 /***************************************************************
//  251 *函数名：uint8 FTM_ChanceFrequence(uint8 FTMx,uint32 freq)
//  252 *功能：  将特定的FTMx初始化为pwm输出，并且设置频率
//  253 *入口参数：(1)FTMx : 0
//  254                      1
//  255                      2
//  256            
//  257           (2)fre  :  Hz
//  258 *出口参数：无
//  259 *说明：无
//  260 ***************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  261 uint8 FTM_ChanceFrequence(uint8 FTMx,uint32 freq)
//  262 {
FTM_ChanceFrequence:
        PUSH     {R4}
//  263   uint32 bus_clk_hz;
//  264   uint32 mod;
//  265   uint8  ps=0;
        MOVS     R4,#+0
//  266   
//  267   bus_clk_hz = periph_clk_khz*1000;
        LDR.W    R2,??DataTable5
        LDR      R2,[R2, #+0]
        MOV      R3,#+1000
        MULS     R2,R3,R2
//  268     
//  269   if(freq>bus_clk_hz) return 0;
        CMP      R2,R1
        BCS.N    ??FTM_ChanceFrequence_0
        MOVS     R0,#+0
        B.N      ??FTM_ChanceFrequence_1
//  270   //128分频
//  271   if((mod=bus_clk_hz/(freq*128)) < 0xFFFFu)
??FTM_ChanceFrequence_0:
        MOVS     R3,#+128
        MUL      R3,R3,R1
        UDIV     R3,R2,R3
        MOVW     R4,#+65535
        CMP      R3,R4
        BCS.W    ??FTM_ChanceFrequence_2
//  272   {
//  273     ps = 7;
        MOVS     R4,#+7
//  274     if(FTMx==0)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.W    ??FTM_ChanceFrequence_3
//  275     {
//  276       FTM_MOD0=mod;
        LDR.W    R4,??DataTable5_1
        STR      R3,[R4, #+0]
//  277     }
//  278     else if(FTMx==1)
//  279     {
//  280       FTM_MOD1=mod;
//  281     }
//  282     else if(FTMx==2)
//  283     {
//  284       FTM_MOD2=mod;  
//  285     }
//  286     else
//  287       return 0;
//  288     //64分频
//  289     if((mod=bus_clk_hz/(freq*64)) < 0xFFFFu)
??FTM_ChanceFrequence_4:
        MOVS     R3,#+64
        MUL      R3,R3,R1
        UDIV     R3,R2,R3
        MOVW     R4,#+65535
        CMP      R3,R4
        BCS.N    ??FTM_ChanceFrequence_5
//  290     {
//  291       ps = 6;   
        MOVS     R4,#+6
//  292       if(FTMx==0)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.W    ??FTM_ChanceFrequence_6
//  293       {
//  294         FTM_MOD0= mod;
        LDR.W    R4,??DataTable5_1
        STR      R3,[R4, #+0]
//  295       }
//  296       else if(FTMx==1)
//  297       {
//  298         FTM_MOD1=mod;
//  299       }
//  300       else if(FTMx==2)
//  301       {
//  302         FTM_MOD2=mod;  
//  303       }
//  304       else
//  305         return 0;
//  306       //32分频
//  307       if((mod=bus_clk_hz/(freq*32)) < 0xFFFFu)
??FTM_ChanceFrequence_7:
        LSLS     R3,R1,#+5
        UDIV     R3,R2,R3
        MOVW     R4,#+65535
        CMP      R3,R4
        BCS.N    ??FTM_ChanceFrequence_5
//  308       {
//  309         ps = 5; 
        MOVS     R4,#+5
//  310         if(FTMx==0)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.W    ??FTM_ChanceFrequence_8
//  311         {
//  312           FTM_MOD0= mod;
        LDR.W    R4,??DataTable5_1
        STR      R3,[R4, #+0]
//  313         }
//  314         else if(FTMx==1)
//  315         {
//  316           FTM_MOD1=mod;
//  317         }
//  318         else if(FTMx==2)
//  319         {
//  320           FTM_MOD2=mod;  
//  321         }
//  322         else
//  323           return 0;
//  324         //16分频
//  325         if((mod=bus_clk_hz/(freq*16)) < 0xFFFFu)
??FTM_ChanceFrequence_9:
        LSLS     R3,R1,#+4
        UDIV     R3,R2,R3
        MOVW     R4,#+65535
        CMP      R3,R4
        BCS.N    ??FTM_ChanceFrequence_5
//  326         {
//  327           ps = 4;  
        MOVS     R4,#+4
//  328           if(FTMx==0)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.W    ??FTM_ChanceFrequence_10
//  329           {
//  330             FTM_MOD0= mod;
        LDR.W    R4,??DataTable5_1
        STR      R3,[R4, #+0]
//  331           }
//  332           else if(FTMx==1)
//  333           {
//  334             FTM_MOD1=mod;
//  335           }
//  336           else if(FTMx==2)
//  337           {
//  338             FTM_MOD2=mod;  
//  339           }
//  340           else
//  341             return 0;
//  342           //8分频
//  343           if((mod=bus_clk_hz/(freq*8)) < 0xFFFFu)
??FTM_ChanceFrequence_11:
        LSLS     R3,R1,#+3
        UDIV     R3,R2,R3
        MOVW     R4,#+65535
        CMP      R3,R4
        BCS.N    ??FTM_ChanceFrequence_5
//  344           {
//  345             ps = 3;
        MOVS     R4,#+3
//  346             if(FTMx==0)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.W    ??FTM_ChanceFrequence_12
//  347             {
//  348               FTM_MOD0= mod;
        LDR.W    R4,??DataTable5_1
        STR      R3,[R4, #+0]
//  349             }
//  350             else if(FTMx==1)
//  351             {
//  352               FTM_MOD1=mod;
//  353             }
//  354             else if(FTMx==2)
//  355             {
//  356               FTM_MOD2=mod;  
//  357             }
//  358             else
//  359               return 0;
//  360             //4分频
//  361             if((mod=bus_clk_hz/(freq*4)) < 0xFFFFu)
??FTM_ChanceFrequence_13:
        LSLS     R3,R1,#+2
        UDIV     R3,R2,R3
        MOVW     R4,#+65535
        CMP      R3,R4
        BCS.N    ??FTM_ChanceFrequence_5
//  362             {
//  363               ps = 2;
        MOVS     R4,#+2
//  364               if(FTMx==0)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.W    ??FTM_ChanceFrequence_14
//  365               {
//  366                 FTM_MOD0= mod;
        LDR.W    R4,??DataTable5_1
        STR      R3,[R4, #+0]
//  367               }
//  368               else if(FTMx==1)
//  369               {
//  370                 FTM_MOD1=mod;
//  371               }
//  372               else if(FTMx==2)
//  373               {
//  374                 FTM_MOD2=mod;  
//  375               }
//  376               else
//  377                 return 0;
//  378               //2分频
//  379               if((mod=bus_clk_hz/(freq*2)) < 0xFFFFu)
??FTM_ChanceFrequence_15:
        LSLS     R3,R1,#+1
        UDIV     R3,R2,R3
        MOVW     R4,#+65535
        CMP      R3,R4
        BCS.N    ??FTM_ChanceFrequence_5
//  380               {
//  381                 ps = 1;
        MOVS     R4,#+1
//  382                 if(FTMx==0)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.W    ??FTM_ChanceFrequence_16
//  383                 {
//  384                   FTM_MOD0= mod;
        LDR.W    R4,??DataTable5_1
        STR      R3,[R4, #+0]
//  385                 }
//  386                 else if(FTMx==1)
//  387                 {
//  388                   FTM_MOD1=mod;
//  389                 }
//  390                 else if(FTMx==2)
//  391                 {
//  392                   FTM_MOD2=mod;  
//  393                 }
//  394                 else
//  395                   return 0;
//  396                 //1分频
//  397                 if((mod=bus_clk_hz/(freq*1)) < 0xFFFFu)
??FTM_ChanceFrequence_17:
        UDIV     R3,R2,R1
        MOVW     R1,#+65535
        CMP      R3,R1
        BCS.N    ??FTM_ChanceFrequence_5
//  398                 {
//  399                   ps = 0;
        MOVS     R4,#+0
//  400                   if(FTMx==0)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.W    ??FTM_ChanceFrequence_18
//  401                   {
//  402                     FTM_MOD0= mod;
        LDR.W    R1,??DataTable5_1
        STR      R3,[R1, #+0]
//  403                   }
//  404                   else if(FTMx==1)
//  405                   {
//  406                     FTM_MOD1=mod;
//  407                   }
//  408                   else if(FTMx==2)
//  409                   {
//  410                     FTM_MOD2=mod;  
//  411                   }
//  412                   else
//  413                     return 0;
//  414                 }
//  415               }
//  416             }
//  417           }
//  418         }  
//  419       }
//  420     }
//  421   }
//  422   else
//  423   {
//  424     return 0;
//  425   }
//  426   
//  427   if(FTMx==0)
??FTM_ChanceFrequence_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.W    ??FTM_ChanceFrequence_19
//  428   {
//  429     // 使能FTM时钟模块
//  430     SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;
        LDR.W    R0,??DataTable5_2  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.W    R1,??DataTable5_2  ;; 0x4004803c
        STR      R0,[R1, #+0]
//  431 
//  432     // 配置FTM控制寄存器
//  433     // 禁用中断, 加计数模式, 时钟源:System clock（Bus Clk）, 分频系数:8
//  434     // 假设SysClk = 50MHz, SC_PS=3, FTM Clk = 50MHz/2^3 = 6.25MHz
//  435     //FTM0_SC = FTM_SC_CLKS(1)|FTM_SC_PS(ps);
//  436 
//  437     // 设置PWM周期及占空比
//  438     // PWM周期 = (MOD-CNTIN+1)*FTM时钟周期 :
//  439     // 配置FTM计数初始值
//  440     //FTM0_CNT = 0;
//  441     //FTM0_CNTIN = 0;
//  442     
//  443     // 配置FTM计数MOD值
//  444     FTM0_MOD = FTM_MOD0;
        LDR.W    R0,??DataTable5_1
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable5_6  ;; 0x40038008
        STR      R0,[R1, #+0]
//  445   }
//  446   else if(FTMx==1)
//  447   {
//  448     // 使能FTM时钟模块
//  449     SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;
//  450 
//  451     // 配置FTM控制寄存器
//  452     // 禁用中断, 加计数模式, 时钟源:System clock（Bus Clk）, 分频系数:8
//  453     // 假设SysClk = 50MHz, SC_PS=3, FTM Clk = 50MHz/2^3 = 6.25MHz
//  454     //FTM1_SC = FTM_SC_CLKS(1)|FTM_SC_PS(ps);
//  455 
//  456     // 设置PWM周期及占空比
//  457     // PWM周期 = (MOD-CNTIN+1)*FTM时钟周期 :
//  458     // 配置FTM计数初始值
//  459     //FTM1_CNT = 0;
//  460     //FTM1_CNTIN = 0;
//  461     
//  462     // 配置FTM计数MOD值
//  463     FTM1_MOD = FTM_MOD1;
//  464   } 
//  465   else if(FTMx==2)
//  466   {
//  467     // 使能FTM时钟模块
//  468     SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;
//  469 
//  470     // 配置FTM控制寄存器
//  471     // 禁用中断, 加计数模式, 时钟源:System clock（Bus Clk）, 分频系数:8
//  472     // 假设SysClk = 50MHz, SC_PS=3, FTM Clk = 50MHz/2^3 = 6.25MHz
//  473     //FTM2_SC = FTM_SC_CLKS(1)|FTM_SC_PS(ps);
//  474 
//  475     // 设置PWM周期及占空比
//  476     // PWM周期 = (MOD-CNTIN+1)*FTM时钟周期 :
//  477     // 配置FTM计数初始值
//  478     //FTM2_CNT = 0;
//  479     //FTM2_CNTIN = 0;
//  480     
//  481     // 配置FTM计数MOD值
//  482     FTM2_MOD = FTM_MOD2;
//  483   }  
//  484   else
//  485     return 0;
//  486 
//  487   return 1;
??FTM_ChanceFrequence_20:
        MOVS     R0,#+1
??FTM_ChanceFrequence_1:
        POP      {R4}
        BX       LR               ;; return
??FTM_ChanceFrequence_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??FTM_ChanceFrequence_21
        LDR.W    R4,??DataTable5_7
        STR      R3,[R4, #+0]
        B.N      ??FTM_ChanceFrequence_4
??FTM_ChanceFrequence_21:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??FTM_ChanceFrequence_22
        LDR.W    R4,??DataTable5_8
        STR      R3,[R4, #+0]
        B.N      ??FTM_ChanceFrequence_4
??FTM_ChanceFrequence_22:
        MOVS     R0,#+0
        B.N      ??FTM_ChanceFrequence_1
??FTM_ChanceFrequence_6:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??FTM_ChanceFrequence_23
        LDR.W    R4,??DataTable5_7
        STR      R3,[R4, #+0]
        B.N      ??FTM_ChanceFrequence_7
??FTM_ChanceFrequence_23:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??FTM_ChanceFrequence_24
        LDR.W    R4,??DataTable5_8
        STR      R3,[R4, #+0]
        B.N      ??FTM_ChanceFrequence_7
??FTM_ChanceFrequence_24:
        MOVS     R0,#+0
        B.N      ??FTM_ChanceFrequence_1
??FTM_ChanceFrequence_8:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??FTM_ChanceFrequence_25
        LDR.W    R4,??DataTable5_7
        STR      R3,[R4, #+0]
        B.N      ??FTM_ChanceFrequence_9
??FTM_ChanceFrequence_25:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??FTM_ChanceFrequence_26
        LDR.W    R4,??DataTable5_8
        STR      R3,[R4, #+0]
        B.N      ??FTM_ChanceFrequence_9
??FTM_ChanceFrequence_26:
        MOVS     R0,#+0
        B.N      ??FTM_ChanceFrequence_1
??FTM_ChanceFrequence_10:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??FTM_ChanceFrequence_27
        LDR.W    R4,??DataTable5_7
        STR      R3,[R4, #+0]
        B.N      ??FTM_ChanceFrequence_11
??FTM_ChanceFrequence_27:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??FTM_ChanceFrequence_28
        LDR.W    R4,??DataTable5_8
        STR      R3,[R4, #+0]
        B.N      ??FTM_ChanceFrequence_11
??FTM_ChanceFrequence_28:
        MOVS     R0,#+0
        B.N      ??FTM_ChanceFrequence_1
??FTM_ChanceFrequence_12:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??FTM_ChanceFrequence_29
        LDR.W    R4,??DataTable5_7
        STR      R3,[R4, #+0]
        B.N      ??FTM_ChanceFrequence_13
??FTM_ChanceFrequence_29:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??FTM_ChanceFrequence_30
        LDR.W    R4,??DataTable5_8
        STR      R3,[R4, #+0]
        B.N      ??FTM_ChanceFrequence_13
??FTM_ChanceFrequence_30:
        MOVS     R0,#+0
        B.N      ??FTM_ChanceFrequence_1
??FTM_ChanceFrequence_14:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??FTM_ChanceFrequence_31
        LDR.W    R4,??DataTable5_7
        STR      R3,[R4, #+0]
        B.N      ??FTM_ChanceFrequence_15
??FTM_ChanceFrequence_31:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??FTM_ChanceFrequence_32
        LDR.W    R4,??DataTable5_8
        STR      R3,[R4, #+0]
        B.N      ??FTM_ChanceFrequence_15
??FTM_ChanceFrequence_32:
        MOVS     R0,#+0
        B.N      ??FTM_ChanceFrequence_1
??FTM_ChanceFrequence_16:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??FTM_ChanceFrequence_33
        LDR.W    R4,??DataTable5_7
        STR      R3,[R4, #+0]
        B.N      ??FTM_ChanceFrequence_17
??FTM_ChanceFrequence_33:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??FTM_ChanceFrequence_34
        LDR.W    R4,??DataTable5_8
        STR      R3,[R4, #+0]
        B.N      ??FTM_ChanceFrequence_17
??FTM_ChanceFrequence_34:
        MOVS     R0,#+0
        B.N      ??FTM_ChanceFrequence_1
??FTM_ChanceFrequence_18:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??FTM_ChanceFrequence_35
        LDR.W    R1,??DataTable5_7
        STR      R3,[R1, #+0]
        B.N      ??FTM_ChanceFrequence_5
??FTM_ChanceFrequence_35:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??FTM_ChanceFrequence_36
        LDR.W    R1,??DataTable5_8
        STR      R3,[R1, #+0]
        B.N      ??FTM_ChanceFrequence_5
??FTM_ChanceFrequence_36:
        MOVS     R0,#+0
        B.N      ??FTM_ChanceFrequence_1
??FTM_ChanceFrequence_2:
        MOVS     R0,#+0
        B.N      ??FTM_ChanceFrequence_1
??FTM_ChanceFrequence_19:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??FTM_ChanceFrequence_37
        LDR.W    R0,??DataTable5_2  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.W    R1,??DataTable5_2  ;; 0x4004803c
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5_7
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable5_12  ;; 0x40039008
        STR      R0,[R1, #+0]
        B.N      ??FTM_ChanceFrequence_20
??FTM_ChanceFrequence_37:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??FTM_ChanceFrequence_38
        LDR.W    R0,??DataTable5_13  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.W    R1,??DataTable5_13  ;; 0x40048030
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5_8
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable5_17  ;; 0x400b8008
        STR      R0,[R1, #+0]
        B.N      ??FTM_ChanceFrequence_20
??FTM_ChanceFrequence_38:
        MOVS     R0,#+0
        B.N      ??FTM_ChanceFrequence_1
//  488 }
//  489 
//  490 
//  491 /***************************************************************
//  492 *函数名：uint8 FTM_PWM_Open(uint8 FTMx,uint8 channel, uint32 duty)
//  493 *功能：  打开PWM通道，设置占空比
//  494 *入口参数：(1)FTMx : 0
//  495                      1
//  496                      2
//  497            
//  498           (2)channel  通道号 
//  499 
//  500           (3)duty     占空比
//  501 *出口参数：无
//  502 *说明：无
//  503 ***************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  504 uint8 FTM_PWM_Open(uint8 FTMx,uint8 channel, uint32 duty)
//  505 {
FTM_PWM_Open:
        PUSH     {R3,R4}
//  506   uint32 cv;
//  507   volatile uint32 mod;
//  508   
//  509   if(duty>10000) return 0;
        MOVW     R3,#+10001
        CMP      R2,R3
        BCC.N    ??FTM_PWM_Open_0
        MOVS     R0,#+0
        B.N      ??FTM_PWM_Open_1
//  510   //占空比 = (CnV-CNTIN)/(MOD-CNTIN+1)
//  511   if(FTMx==0)
??FTM_PWM_Open_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??FTM_PWM_Open_2
//  512   {
//  513     mod = FTM_MOD0;
        LDR.N    R3,??DataTable5_1
        LDR      R3,[R3, #+0]
        STR      R3,[SP, #+0]
//  514   }
//  515   else if(FTMx==1)
//  516   {
//  517     mod = FTM_MOD1;
//  518   }
//  519   else if(FTMx==2)
//  520   {
//  521     mod = FTM_MOD2;
//  522   }
//  523   else
//  524     return 0;
//  525   
//  526   cv = (duty*(mod-0+1)+0)/10000;
??FTM_PWM_Open_3:
        LDR      R3,[SP, #+0]
        ADDS     R3,R3,#+1
        MULS     R2,R3,R2
        MOVW     R3,#+10000
        UDIV     R2,R2,R3
//  527   
//  528   if(FTMx==0)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??FTM_PWM_Open_4
//  529   {
//  530     //选择并开启通道
//  531     switch(channel)
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R3,R1
        CMP      R3,#+0
        CMP      R3,#+2
        BLS.N    ??FTM_PWM_Open_5
        SUBS     R3,R3,#+3
        BEQ.N    ??FTM_PWM_Open_6
        SUBS     R3,R3,#+1
        CMP      R3,#+3
        BLS.N    ??FTM_PWM_Open_7
        B.N      ??FTM_PWM_Open_8
//  532       {
//  533         case 0:
//  534         case 1:
//  535         case 2:
//  536           SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
??FTM_PWM_Open_5:
        LDR.N    R3,??DataTable5_18  ;; 0x40048038
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x200
        LDR.N    R4,??DataTable5_18  ;; 0x40048038
        STR      R3,[R4, #+0]
//  537           PORT_PCR_REG(PORTA_BASE_PTR, channel+3) = PORT_PCR_MUX(3);
        MOV      R3,#+768
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R4,R1,#+2
        ADD      R4,R4,#+1073741824
        ADDS     R4,R4,#+299008
        STR      R3,[R4, #+12]
//  538           break;
//  539         case 3:
//  540           SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;
//  541           PORT_PCR_REG(PORTC_BASE_PTR, channel+1) = PORT_PCR_MUX(4);
//  542           break;
//  543         case 4:
//  544         case 5:
//  545         case 6:
//  546         case 7:
//  547           SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;
//  548           PORT_PCR_REG(PORTD_BASE_PTR, channel) = PORT_PCR_MUX(4);
//  549           break;
//  550         default:
//  551           return 0;
//  552       }  
//  553 
//  554     // 配置FTM通道控制寄存器 
//  555     // 通道模式 MSB:MSA-1X, 通道边缘选择 ELSB:ELSA-10
//  556     FTM_CnSC_REG(FTM0_BASE_PTR, channel) = FTM_CnSC_MSB_MASK|FTM_CnSC_ELSB_MASK;
??FTM_PWM_Open_9:
        MOVS     R3,#+40
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R4,??DataTable5_19  ;; 0x4003800c
        STR      R3,[R4, R1, LSL #+3]
//  557     // 配置FTM通道值
//  558     FTM_CnV_REG(FTM0_BASE_PTR, channel) = cv;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R3,??DataTable5_19  ;; 0x4003800c
        ADDS     R3,R3,R1, LSL #+3
        STR      R2,[R3, #+4]
//  559   } 
//  560   
//  561   if(FTMx==1)
??FTM_PWM_Open_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??FTM_PWM_Open_10
//  562   {
//  563     //选择并开启通道
//  564     switch(channel)
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??FTM_PWM_Open_11
//  565       {
//  566         case 0:
//  567               SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
        LDR.N    R3,??DataTable5_18  ;; 0x40048038
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x400
        LDR.N    R4,??DataTable5_18  ;; 0x40048038
        STR      R3,[R4, #+0]
//  568               PORT_PCR_REG(PORTB_BASE_PTR, channel) = PORT_PCR_MUX(3);
        MOV      R3,#+768
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R4,??DataTable5_20  ;; 0x4004a000
        STR      R3,[R4, R1, LSL #+2]
//  569                //SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
//  570                //PORTB_PCR0= PORT_PCR_MUX(0x3)| PORT_PCR_DSE_MASK;
//  571               break;
//  572         case 1:
//  573         case 2:
//  574         case 3:
//  575         case 4:
//  576         case 5:
//  577         case 6:
//  578         case 7:
//  579         default:
//  580           return 0;
//  581       }  
//  582   
//  583     // 配置FTM通道控制寄存器 
//  584     // 通道模式 MSB:MSA-1X, 通道边缘选择 ELSB:ELSA-10
//  585     FTM_CnSC_REG(FTM1_BASE_PTR, channel) = FTM_CnSC_MSB_MASK|FTM_CnSC_ELSB_MASK;
        MOVS     R3,#+40
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R4,??DataTable5_21  ;; 0x4003900c
        STR      R3,[R4, R1, LSL #+3]
//  586     // 配置FTM通道值
//  587     FTM_CnV_REG(FTM1_BASE_PTR, channel) = cv;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R3,??DataTable5_21  ;; 0x4003900c
        ADDS     R3,R3,R1, LSL #+3
        STR      R2,[R3, #+4]
//  588   } 
//  589   
//  590   if(FTMx==2)
??FTM_PWM_Open_10:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??FTM_PWM_Open_12
//  591   {
//  592     //选择并开启通道
//  593     switch(channel)
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??FTM_PWM_Open_13
//  594       {
//  595         case 0:
//  596           break;
//  597         case 1:
//  598         case 2:
//  599         case 3:
//  600         case 4:
//  601         case 5:
//  602         case 6:
//  603         case 7:
//  604         default:
//  605           return 0;
//  606       }  
//  607   
//  608     // 配置FTM通道控制寄存器 
//  609     // 通道模式 MSB:MSA-1X, 通道边缘选择 ELSB:ELSA-10
//  610     FTM_CnSC_REG(FTM2_BASE_PTR, channel) = FTM_CnSC_MSB_MASK|FTM_CnSC_ELSB_MASK;
        MOVS     R0,#+40
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R3,??DataTable5_22  ;; 0x400b800c
        STR      R0,[R3, R1, LSL #+3]
//  611     // 配置FTM通道值
//  612     FTM_CnV_REG(FTM2_BASE_PTR, channel) = cv;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable5_22  ;; 0x400b800c
        ADDS     R0,R0,R1, LSL #+3
        STR      R2,[R0, #+4]
//  613   } 
//  614   return 1;
??FTM_PWM_Open_12:
        MOVS     R0,#+1
??FTM_PWM_Open_1:
        POP      {R1,R4}
        BX       LR               ;; return
??FTM_PWM_Open_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??FTM_PWM_Open_14
        LDR.N    R3,??DataTable5_7
        LDR      R3,[R3, #+0]
        STR      R3,[SP, #+0]
        B.N      ??FTM_PWM_Open_3
??FTM_PWM_Open_14:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??FTM_PWM_Open_15
        LDR.N    R3,??DataTable5_8
        LDR      R3,[R3, #+0]
        STR      R3,[SP, #+0]
        B.N      ??FTM_PWM_Open_3
??FTM_PWM_Open_15:
        MOVS     R0,#+0
        B.N      ??FTM_PWM_Open_1
??FTM_PWM_Open_6:
        LDR.N    R3,??DataTable5_18  ;; 0x40048038
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x800
        LDR.N    R4,??DataTable5_18  ;; 0x40048038
        STR      R3,[R4, #+0]
        MOV      R3,#+1024
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R4,R1,#+2
        ADD      R4,R4,#+1073741824
        ADDS     R4,R4,#+307200
        STR      R3,[R4, #+4]
        B.N      ??FTM_PWM_Open_9
??FTM_PWM_Open_7:
        LDR.N    R3,??DataTable5_18  ;; 0x40048038
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x1000
        LDR.N    R4,??DataTable5_18  ;; 0x40048038
        STR      R3,[R4, #+0]
        MOV      R3,#+1024
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R4,??DataTable5_23  ;; 0x4004c000
        STR      R3,[R4, R1, LSL #+2]
        B.N      ??FTM_PWM_Open_9
??FTM_PWM_Open_8:
        MOVS     R0,#+0
        B.N      ??FTM_PWM_Open_1
??FTM_PWM_Open_11:
        MOVS     R0,#+0
        B.N      ??FTM_PWM_Open_1
??FTM_PWM_Open_13:
        MOVS     R0,#+0
        B.N      ??FTM_PWM_Open_1
//  615 }
//  616 
//  617 /***************************************************************
//  618 *函数名：uint8 FTM_PWM_ChangeDuty(uint8 FTMx,uint8 channel, uint32 duty)
//  619 *功能：  打开PWM通道，设置占空比
//  620 *入口参数：(1)FTMx : 0
//  621                      1
//  622                      2
//  623            
//  624           (2)channel  通道号 
//  625 
//  626           (3)duty     占空比
//  627 *出口参数：无
//  628 *说明：无
//  629 ***************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  630 uint8 FTM_PWM_ChangeDuty(uint8 FTMx,uint8 channel, uint32 duty)
//  631 {
FTM_PWM_ChangeDuty:
        SUB      SP,SP,#+4
//  632   uint32 cv;
//  633   volatile uint32 mod;
//  634   
//  635   if(duty>10000) return 0;
        MOVW     R3,#+10001
        CMP      R2,R3
        BCC.N    ??FTM_PWM_ChangeDuty_0
        MOVS     R0,#+0
        B.N      ??FTM_PWM_ChangeDuty_1
//  636   //占空比 = (CnV-CNTIN)/(MOD-CNTIN+1)
//  637   if(FTMx==0)
??FTM_PWM_ChangeDuty_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??FTM_PWM_ChangeDuty_2
//  638   {
//  639     mod=FTM_MOD0;
        LDR.N    R3,??DataTable5_1
        LDR      R3,[R3, #+0]
        STR      R3,[SP, #+0]
//  640   }
//  641   else if(FTMx==1)
//  642   {
//  643     mod=FTM_MOD1;
//  644   }
//  645   else if(FTMx==2)
//  646   {
//  647     mod=FTM_MOD2;
//  648   }
//  649   else
//  650     return 0;
//  651   
//  652   cv = (duty*(mod-0+1)+0)/10000;
??FTM_PWM_ChangeDuty_3:
        LDR      R3,[SP, #+0]
        ADDS     R3,R3,#+1
        MULS     R2,R3,R2
        MOVW     R3,#+10000
        UDIV     R2,R2,R3
//  653   
//  654   if(FTMx==0)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??FTM_PWM_ChangeDuty_4
//  655   {
//  656     switch(channel)// 配置FTM通道值
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??FTM_PWM_ChangeDuty_5
        CMP      R1,#+2
        BEQ.N    ??FTM_PWM_ChangeDuty_6
        BCC.N    ??FTM_PWM_ChangeDuty_7
        B.N      ??FTM_PWM_ChangeDuty_8
//  657     {  
//  658       case 0:
//  659          FTM_CnV_REG(FTM0_BASE_PTR, 0) = cv;
??FTM_PWM_ChangeDuty_5:
        LDR.N    R0,??DataTable5_24  ;; 0x40038010
        STR      R2,[R0, #+0]
//  660          break;
//  661       case 1:
//  662          FTM_CnV_REG(FTM0_BASE_PTR, 1) = cv;
//  663          break;
//  664       case 2:
//  665          FTM_CnV_REG(FTM0_BASE_PTR, 2) = cv;
//  666          break;
//  667       default:
//  668       return 0;
//  669     }
//  670   }
//  671   else if(FTMx==1)
//  672   {
//  673     // 配置FTM通道值
//  674     FTM_CnV_REG(FTM1_BASE_PTR, channel) = cv;
//  675   }
//  676   else if(FTMx==2)
//  677   {
//  678     // 配置FTM通道值
//  679     FTM_CnV_REG(FTM2_BASE_PTR, channel) = cv;
//  680   }
//  681   else
//  682     return 0;
//  683   return 1;
??FTM_PWM_ChangeDuty_9:
        MOVS     R0,#+1
??FTM_PWM_ChangeDuty_1:
        ADD      SP,SP,#+4
        BX       LR               ;; return
??FTM_PWM_ChangeDuty_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??FTM_PWM_ChangeDuty_10
        LDR.N    R3,??DataTable5_7
        LDR      R3,[R3, #+0]
        STR      R3,[SP, #+0]
        B.N      ??FTM_PWM_ChangeDuty_3
??FTM_PWM_ChangeDuty_10:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??FTM_PWM_ChangeDuty_11
        LDR.N    R3,??DataTable5_8
        LDR      R3,[R3, #+0]
        STR      R3,[SP, #+0]
        B.N      ??FTM_PWM_ChangeDuty_3
??FTM_PWM_ChangeDuty_11:
        MOVS     R0,#+0
        B.N      ??FTM_PWM_ChangeDuty_1
??FTM_PWM_ChangeDuty_7:
        LDR.N    R0,??DataTable5_25  ;; 0x40038018
        STR      R2,[R0, #+0]
        B.N      ??FTM_PWM_ChangeDuty_9
??FTM_PWM_ChangeDuty_6:
        LDR.N    R0,??DataTable5_26  ;; 0x40038020
        STR      R2,[R0, #+0]
        B.N      ??FTM_PWM_ChangeDuty_9
??FTM_PWM_ChangeDuty_8:
        MOVS     R0,#+0
        B.N      ??FTM_PWM_ChangeDuty_1
??FTM_PWM_ChangeDuty_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??FTM_PWM_ChangeDuty_12
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable5_21  ;; 0x4003900c
        ADDS     R0,R0,R1, LSL #+3
        STR      R2,[R0, #+4]
        B.N      ??FTM_PWM_ChangeDuty_9
??FTM_PWM_ChangeDuty_12:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??FTM_PWM_ChangeDuty_13
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable5_22  ;; 0x400b800c
        ADDS     R0,R0,R1, LSL #+3
        STR      R2,[R0, #+4]
        B.N      ??FTM_PWM_ChangeDuty_9
??FTM_PWM_ChangeDuty_13:
        MOVS     R0,#+0
        B.N      ??FTM_PWM_ChangeDuty_1
//  684 }
//  685 /***************************************************************
//  686 *函数名：void Motor_init(void)   
//  687 *功能：  直流电机PWM调速引脚初始化,用FTM1模块
//  688 *入口参数：无
//  689 *出口参数：无
//  690 *说明：无
//  691 ***************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  692 void Motor_init(void)    //直流电机
//  693 {      	   
//  694   //DIR_B;                     //右电机B10  正转
//  695   //DIL_B;                     //左电机B9   反转
//  696   
//  697   /* Turn on all port clocks */
//  698   //SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;
//  699   SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
Motor_init:
        LDR.N    R0,??DataTable5_18  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.N    R1,??DataTable5_18  ;; 0x40048038
        STR      R0,[R1, #+0]
//  700   
//  701   //以前为双电机开的两个端口
//  702   //PORTC_PCR1= PORT_PCR_MUX(0x4)| PORT_PCR_DSE_MASK; // FTM is alt3 function for this pin 
//  703   //PORTC_PCR2= PORT_PCR_MUX(0x4)| PORT_PCR_DSE_MASK; // FTM is alt3 function for this pin
//  704   PORTB_PCR0= PORT_PCR_MUX(0x3)| PORT_PCR_DSE_MASK; // FTM is alt3 function for this pin PTB0
        MOV      R0,#+832
        LDR.N    R1,??DataTable5_20  ;; 0x4004a000
        STR      R0,[R1, #+0]
//  705   
//  706   SIM_SCGC6|=SIM_SCGC6_FTM1_MASK;         //使能FTM1时钟      
        LDR.N    R0,??DataTable5_2  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.N    R1,??DataTable5_2  ;; 0x4004803c
        STR      R0,[R1, #+0]
//  707   
//  708   //change MSnB = 1  
//  709   FTM1_C0SC |= FTM_CnSC_ELSB_MASK;
        LDR.N    R0,??DataTable5_21  ;; 0x4003900c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable5_21  ;; 0x4003900c
        STR      R0,[R1, #+0]
//  710   FTM1_C0SC &= ~FTM_CnSC_ELSA_MASK;
        LDR.N    R0,??DataTable5_21  ;; 0x4003900c
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.N    R1,??DataTable5_21  ;; 0x4003900c
        STR      R0,[R1, #+0]
//  711   FTM1_C0SC |= FTM_CnSC_MSB_MASK;    
        LDR.N    R0,??DataTable5_21  ;; 0x4003900c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable5_21  ;; 0x4003900c
        STR      R0,[R1, #+0]
//  712   /*为另一个电机
//  713   FTM1_C1SC |= FTM_CnSC_ELSB_MASK;
//  714   FTM1_C1SC &= ~FTM_CnSC_ELSA_MASK;
//  715   FTM1_C1SC |= FTM_CnSC_MSB_MASK;   
//  716   */
//  717   
//  718   FTM1_SC = 0x29; //not enable the interrupt mask    0010 1001
        MOVS     R0,#+41
        LDR.N    R1,??DataTable5_9  ;; 0x40039000
        STR      R0,[R1, #+0]
//  719   //FTM1_SC=0X1F;       //BIT5  0 FTM counter operates in up counting mode.
//  720                         //1 FTM counter operates in up-down counting mode.      
//  721   //BIT43 FTM1_SC|=FTM1_SC_CLKS_MASK;
//  722                         //00 No clock selected (This in effect disables the FTM counter.)
//  723                         //01 System clock
//  724                         //10 Fixed frequency clock
//  725                         //11 External clock
//  726   //BIT210 FTM1_SC|=FTM1_SC_PS_MASK; 
//  727                         //100M          MOD=2000;    
//  728                         //000 Divide by 1---12KHZ     
//  729                         //001 Divide by 2--- 6KHZ
//  730                         //010 Divide by 4--- 3K
//  731                         //011 Divide by 8--- 1.5K
//  732                         //100 Divide by 16---750
//  733                         //101 Divide by 32---375
//  734                         //110 Divide by 64---187.5HZ
//  735                         //111 Divide by 128--93.75hz             
//  736   
//  737   FTM1_MODE |= FTM_MODE_WPDIS_MASK;      
        LDR.N    R0,??DataTable5_27  ;; 0x40039054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable5_27  ;; 0x40039054
        STR      R0,[R1, #+0]
//  738    //BIT1   Initialize the Channels Output
//  739   //FTMEN is bit 0, need to set to zero so DECAPEN can be set to 0
//  740   FTM1_MODE &= ~1;
        LDR.N    R0,??DataTable5_27  ;; 0x40039054
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable5_27  ;; 0x40039054
        STR      R0,[R1, #+0]
//  741    //BIT0   FTM Enable
//  742    //0 Only the TPM-compatible registers (first set of registers) can be used without any restriction. Do not use the FTM-specific registers.
//  743    //1 All registers including the FTM-specific registers (second set of registers) are available for use with no restrictions.
//  744   
//  745   FTM1_OUTMASK=0XFE;   //0 Channel output is not masked. It continues to operate normally.
        MOVS     R0,#+254
        LDR.N    R1,??DataTable5_28  ;; 0x40039060
        STR      R0,[R1, #+0]
//  746                        //1 Channel output is masked. It is forced to its inactive state.
//  747   
//  748   FTM1_COMBINE=0;      //Function for Linked Channels (FTMx_COMBINE)
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_29  ;; 0x40039064
        STR      R0,[R1, #+0]
//  749   FTM1_OUTINIT=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_30  ;; 0x4003905c
        STR      R0,[R1, #+0]
//  750   FTM1_EXTTRIG=0;      //FTM aExternl Trigger (FTMx_EXTTRIG)
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_31  ;; 0x4003906c
        STR      R0,[R1, #+0]
//  751   FTM1_POL=0;          //Channels Polarity (FTMx_POL)
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_32  ;; 0x40039070
        STR      R0,[R1, #+0]
//  752                        //0 The channel polarity is active high.
//  753                        //1 The channel polarity is active low.     
//  754   //Set Edge Aligned PWM
//  755   FTM1_QDCTRL &=~FTM_QDCTRL_QUADEN_MASK;
        LDR.N    R0,??DataTable5_33  ;; 0x40039080
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable5_33  ;; 0x40039080
        STR      R0,[R1, #+0]
//  756   //QUADEN is Bit 1, Set Quadrature Decoder Mode (QUADEN) Enable to 0,   (disabled)
//  757   //FTM0_SC = 0x16; //Center Aligned PWM Select = 0, sets FTM Counter to operate in up counting mode,
//  758   //it is field 5 of FTMx_SC (status control) - also setting the pre-scale bits here
//  759   
//  760   FTM1_INVCTRL=0;      //反转控制
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_34  ;; 0x40039090
        STR      R0,[R1, #+0]
//  761   FTM1_SWOCTRL=0;      //软件输出控制F TM Software Output Control (FTMx_SWOCTRL)
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_35  ;; 0x40039094
        STR      R0,[R1, #+0]
//  762   FTM1_PWMLOAD=0;      //FTM PWM Load
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_36  ;; 0x40039098
        STR      R0,[R1, #+0]
//  763                        //BIT9: 0 Loading updated values is disabled.
//  764                        //1 Loading updated values is enabled.
//  765   FTM1_CNTIN=0;        //Counter Initial Value      
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_11  ;; 0x4003904c
        STR      R0,[R1, #+0]
//  766   FTM1_MOD=1250;       //Modulo value,The EPWM period is determined by (MOD - CNTIN + 0x0001) 
        MOVW     R0,#+1250
        LDR.N    R1,??DataTable5_12  ;; 0x40039008
        STR      R0,[R1, #+0]
//  767                        //PMW频率=系统频率/4/(2^FTM1_SC_PS)/FTM1_MOD   10000=180000000/4/2/2250   
//  768   FTM1_C0V=500;          //设置 the pulse width(duty cycle) is determined by (CnV - CNTIN).  高电平的时间
        MOV      R0,#+500
        LDR.N    R1,??DataTable5_37  ;; 0x40039010
        STR      R0,[R1, #+0]
//  769   //FTM1_C1V=0;          //设置 the pulse width(duty cycle) is determined by (CnV - CNTIN).  高电平的时间
//  770   FTM1_CNT=0;          //只有低16位可用,寄存器的初值
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_10  ;; 0x40039004
        STR      R0,[R1, #+0]
//  771 }
        BX       LR               ;; return
//  772 
//  773 //================================================================
//  774 //E6A2-CW3C光电编码器引脚：
//  775 //         蓝色：GND
//  776 //         棕色：VCC
//  777 //         黑色：A相
//  778 //         白色：B相
//  779 
//  780 //函数名：void FTM2_QUAD_Iint(void)
//  781 //功能：   输入脉冲捕捉
//  782 //入口参数：无
//  783 //出口参数：无
//  784 //说明：    无
//  785 //================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  786 void FTM2_QUAD_Iint(void)  
//  787 { 
//  788   SIM_SCGC3|=SIM_SCGC3_FTM2_MASK;//使能FTM2时钟  
FTM2_QUAD_Iint:
        LDR.N    R0,??DataTable5_13  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.N    R1,??DataTable5_13  ;; 0x40048030
        STR      R0,[R1, #+0]
//  789   //SIM_SCGC5|= SIM_SCGC5_PORTB_MASK; //Turn on PORTB clock
//  790   
//  791   PORTB_PCR18= PORT_PCR_MUX(6); // 设置引脚B18引脚为FTM2_PHA功能
        MOV      R0,#+1536
        LDR.N    R1,??DataTable5_38  ;; 0x4004a048
        STR      R0,[R1, #+0]
//  792   PORTB_PCR19= PORT_PCR_MUX(6); // 设置引脚B19引脚为FTM2_PHB功能  
        MOV      R0,#+1536
        LDR.N    R1,??DataTable5_39  ;; 0x4004a04c
        STR      R0,[R1, #+0]
//  793  
//  794   FTM2_MODE |= FTM_MODE_WPDIS_MASK;//写保护禁止  
        LDR.N    R0,??DataTable5_40  ;; 0x400b8054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable5_40  ;; 0x400b8054
        STR      R0,[R1, #+0]
//  795   FTM2_QDCTRL|=FTM_QDCTRL_QUADMODE_MASK;//AB相同时确定方向和计数值  
        LDR.N    R0,??DataTable5_41  ;; 0x400b8080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable5_41  ;; 0x400b8080
        STR      R0,[R1, #+0]
//  796   
//  797   //FTM2_FILTER|=(10<<FTM_FILTER_CH3FVAL_SHIFT);//设置输入的滤波 
//  798   
//  799   FTM2_CNTIN=0;//FTM0计数器初始值为0  
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_16  ;; 0x400b804c
        STR      R0,[R1, #+0]
//  800   FTM2_MOD=65535;//结束值  
        MOVW     R0,#+65535
        LDR.N    R1,??DataTable5_17  ;; 0x400b8008
        STR      R0,[R1, #+0]
//  801 	
//  802   FTM2_QDCTRL|=FTM_QDCTRL_QUADEN_MASK;//启用FTM2正交解码模式  
        LDR.N    R0,??DataTable5_41  ;; 0x400b8080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable5_41  ;; 0x400b8080
        STR      R0,[R1, #+0]
//  803   FTM2_MODE |= FTM_MODE_FTMEN_MASK;//FTM2EN=1    
        LDR.N    R0,??DataTable5_40  ;; 0x400b8054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable5_40  ;; 0x400b8054
        STR      R0,[R1, #+0]
//  804   FTM2_CNT=0;  
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_15  ;; 0x400b8004
        STR      R0,[R1, #+0]
//  805 }  
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     periph_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     FTM_MOD0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     0x40038000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     0x40038004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     0x4003804c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     0x40038008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     FTM_MOD1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     FTM_MOD2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     0x40039000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     0x40039004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     0x4003904c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_12:
        DC32     0x40039008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_13:
        DC32     0x40048030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_14:
        DC32     0x400b8000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_15:
        DC32     0x400b8004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_16:
        DC32     0x400b804c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_17:
        DC32     0x400b8008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_18:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_19:
        DC32     0x4003800c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_20:
        DC32     0x4004a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_21:
        DC32     0x4003900c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_22:
        DC32     0x400b800c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_23:
        DC32     0x4004c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_24:
        DC32     0x40038010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_25:
        DC32     0x40038018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_26:
        DC32     0x40038020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_27:
        DC32     0x40039054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_28:
        DC32     0x40039060

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_29:
        DC32     0x40039064

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_30:
        DC32     0x4003905c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_31:
        DC32     0x4003906c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_32:
        DC32     0x40039070

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_33:
        DC32     0x40039080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_34:
        DC32     0x40039090

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_35:
        DC32     0x40039094

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_36:
        DC32     0x40039098

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_37:
        DC32     0x40039010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_38:
        DC32     0x4004a048

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_39:
        DC32     0x4004a04c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_40:
        DC32     0x400b8054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_41:
        DC32     0x400b8080

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
//    12 bytes in section .bss
// 2 322 bytes in section .text
// 
// 2 322 bytes of CODE memory
//    12 bytes of DATA memory
//
//Errors: none
//Warnings: 1
