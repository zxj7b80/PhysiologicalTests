///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       08/Apr/2015  15:15:24
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\C\Component_C\button.c
//    Command line =  
//        C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\C\Component_C\button.c
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
//        C:\Users\Administrator\Desktop\PhysiologicalTests\bin\Flash\List\button.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN delay_ms
        EXTERN gpio_init
        EXTERN gpio_read

        PUBLIC button_init
        PUBLIC keyboard_scan
        PUBLIC matrix_keyboard_init

// C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\C\Component_C\button.c
//    1 
//    2 //程序名：  矩阵键盘 驱动程序
//    3 //硬件平台：MK60DN512ZVLL10
//    4 //开发环境：IAR V6.3
//    5 //最后修改和注解的时间：
//    6 //                     2012.8.26
//    7 #include "includes.h"
//    8 #include "button.h"
//    9 #include "gpio.h"
//   10 #include "LQ12864.h"
//   11 
//   12 
//   13 #define  keyport       PORTD
//   14 #define  keyport_clk   SIM_SCGC5_PORTD_MASK
//   15 #define  pin_begin     0  
//   16 
//   17 /********************************************************
//   18 *函数名：   void button_init(void)
//   19 *功能：     按键，外部触发
//   20 *入口参数:  无
//   21 *出口参数:  无
//   22 *说明：     使用的引脚：PC7、PC8、PC9
//   23 *********************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   24 void button_init(void)
//   25 {   
//   26   SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;    //打开PORTD端口的时钟
button_init:
        LDR.W    R0,??DataTable2  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.W    R1,??DataTable2  ;; 0x40048038
        STR      R0,[R1, #+0]
//   27 
//   28   //PORTD_DFER|=PORT_DFER_DFE_MASK;   //enable filter
//   29   //PORTD_DFCR|=PORT_DFCR_CS_MASK;    //select LDO as Filter Clock
//   30   //PORTD_DFWR=PORT_DFWR_FILT(1);     //10ms
//   31 
//   32   PORTD_PCR0=PORT_PCR_MUX(1)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;  //上拉  
        MOVW     R0,#+259
        LDR.W    R1,??DataTable2_1  ;; 0x4004c000
        STR      R0,[R1, #+0]
//   33   PORTD_PCR1=PORT_PCR_MUX(1)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;  //上拉  
        MOVW     R0,#+259
        LDR.W    R1,??DataTable2_2  ;; 0x4004c004
        STR      R0,[R1, #+0]
//   34   PORTD_PCR2=PORT_PCR_MUX(1)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;  //上拉  
        MOVW     R0,#+259
        LDR.W    R1,??DataTable2_3  ;; 0x4004c008
        STR      R0,[R1, #+0]
//   35   PORTD_PCR3=PORT_PCR_MUX(1)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;  //上拉  
        MOVW     R0,#+259
        LDR.W    R1,??DataTable2_4  ;; 0x4004c00c
        STR      R0,[R1, #+0]
//   36   PORTD_PCR4=PORT_PCR_MUX(1)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;  //上拉  
        MOVW     R0,#+259
        LDR.W    R1,??DataTable2_5  ;; 0x4004c010
        STR      R0,[R1, #+0]
//   37   PORTD_PCR5=PORT_PCR_MUX(1)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;  //上拉  
        MOVW     R0,#+259
        LDR.W    R1,??DataTable2_6  ;; 0x4004c014
        STR      R0,[R1, #+0]
//   38   PORTD_PCR6=PORT_PCR_MUX(1)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;  //上拉  
        MOVW     R0,#+259
        LDR.W    R1,??DataTable2_7  ;; 0x4004c018
        STR      R0,[R1, #+0]
//   39   PORTD_PCR7=PORT_PCR_MUX(1)|PORT_PCR_PE_MASK|PORT_PCR_PS_MASK;  //上拉  
        MOVW     R0,#+259
        LDR.W    R1,??DataTable2_8  ;; 0x4004c01c
        STR      R0,[R1, #+0]
//   40 }
        BX       LR               ;; return
//   41 
//   42 /********************************************************
//   43 *函数名：   void matrix_keyboard_init()
//   44 *功能：     按键，外部触发
//   45 *入口参数:  无
//   46 *出口参数:  无
//   47 *说明：     使用的引脚：PD0~PD7
//   48 *********************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   49 void matrix_keyboard_init()
//   50 {  
matrix_keyboard_init:
        PUSH     {R7,LR}
//   51   SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;
        LDR.W    R0,??DataTable2  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.W    R1,??DataTable2  ;; 0x40048038
        STR      R0,[R1, #+0]
//   52   
//   53   gpio_init (keyport,(pin_begin+7),1,1);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+7
        LDR.W    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_init
//   54   gpio_init (keyport,(pin_begin+6),1,1);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+6
        LDR.W    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_init
//   55   gpio_init (keyport,(pin_begin+5),1,1);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+5
        LDR.W    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_init
//   56   gpio_init (keyport,(pin_begin+4),1,1);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+4
        LDR.W    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_init
//   57   gpio_init (keyport,(pin_begin+3),0,0);
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+3
        LDR.W    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_init
//   58   gpio_init (keyport,(pin_begin+2),0,0);
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+2
        LDR.W    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_init
//   59   gpio_init (keyport,(pin_begin+1),0,0);
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_init
//   60   gpio_init (keyport,(pin_begin+0),0,0);
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_init
//   61   delay_ms(50);
        MOVS     R0,#+50
        BL       delay_ms
//   62   
//   63 }
        POP      {R0,PC}          ;; return
//   64 
//   65 /*********************************TEMP******************************
//   66 *函数名：uint8 keyboard_scan()
//   67 *功能：扫描按键的值
//   68 *入口参数：无
//   69 *出口参数：键值
//   70 *说明：无
//   71 ***************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   72 uint8 keyboard_scan()
//   73 {
keyboard_scan:
        PUSH     {R3-R7,LR}
//   74   uint8 TEMP=0;
        MOVS     R5,#+0
//   75   uint8 key_num=255;
        MOVS     R4,#+255
//   76   //第四行-------------------------
//   77   gpio_init (keyport,(pin_begin+7),1,0);
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+7
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_init
//   78   gpio_init (keyport,(pin_begin+6),1,1);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+6
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_init
//   79   gpio_init (keyport,(pin_begin+5),1,1);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+5
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_init
//   80   gpio_init (keyport,(pin_begin+4),1,1);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+4
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_init
//   81     
//   82   TEMP=((gpio_read(keyport,(pin_begin+3))<<4)+(gpio_read(keyport,(pin_begin+2))<<5)+(gpio_read(keyport,(pin_begin+1))<<6)+(gpio_read(keyport,(pin_begin+0))<<7));
        MOVS     R1,#+3
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        MOVS     R6,R0
        MOVS     R1,#+2
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        MOVS     R7,R0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        LSLS     R1,R7,#+5
        ADDS     R1,R1,R6, LSL #+4
        ADDS     R6,R1,R0, LSL #+6
        MOVS     R1,#+0
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        ADDS     R0,R6,R0, LSL #+7
        MOVS     R5,R0
//   83   
//   84   if(TEMP!=0x70)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+112
        BEQ.N    ??keyboard_scan_0
//   85   {
//   86     delay_ms(10);  
        MOVS     R0,#+10
        BL       delay_ms
//   87     
//   88     TEMP=((gpio_read(keyport,(pin_begin+3))<<4)+(gpio_read(keyport,(pin_begin+2))<<5)+(gpio_read(keyport,(pin_begin+1))<<6)+(gpio_read(keyport,(pin_begin+0))<<7));
        MOVS     R1,#+3
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        MOVS     R5,R0
        MOVS     R1,#+2
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        MOVS     R6,R0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        LSLS     R1,R6,#+5
        ADDS     R1,R1,R5, LSL #+4
        ADDS     R5,R1,R0, LSL #+6
        MOVS     R1,#+0
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        ADDS     R5,R5,R0, LSL #+7
//   89     
//   90     if(TEMP!=0x70)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+112
        BEQ.N    ??keyboard_scan_0
//   91     {
//   92       switch(TEMP)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+48
        BEQ.N    ??keyboard_scan_1
        CMP      R5,#+80
        BEQ.N    ??keyboard_scan_2
        CMP      R5,#+96
        BNE.N    ??keyboard_scan_0
//   93       {                
//   94       case 0x60:	
//   95                key_num=10;                          //10号键被按下				
??keyboard_scan_3:
        MOVS     R4,#+10
//   96                break;
        B.N      ??keyboard_scan_0
//   97       case 0x50:
//   98                key_num=11;                         //11号键被按下
??keyboard_scan_2:
        MOVS     R4,#+11
//   99                break;
        B.N      ??keyboard_scan_0
//  100       case 0x30:
//  101                key_num=12;                          //12号键被按下
??keyboard_scan_1:
        MOVS     R4,#+12
//  102                break;
//  103       }
//  104     }			 	   
//  105   }
//  106 
//  107   //第三行--------------------------
//  108   gpio_init (keyport,(pin_begin+7),1,1);
??keyboard_scan_0:
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+7
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_init
//  109   gpio_init (keyport,(pin_begin+6),1,0);
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+6
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_init
//  110   gpio_init (keyport,(pin_begin+5),1,1);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+5
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_init
//  111   gpio_init (keyport,(pin_begin+4),1,1);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+4
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_init
//  112     
//  113   TEMP=((gpio_read(keyport,(pin_begin+3))<<4)+(gpio_read(keyport,(pin_begin+2))<<5)+(gpio_read(keyport,(pin_begin+1))<<6)+(gpio_read(keyport,(pin_begin+0))<<7)); 
        MOVS     R1,#+3
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        MOVS     R5,R0
        MOVS     R1,#+2
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        MOVS     R6,R0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        LSLS     R1,R6,#+5
        ADDS     R1,R1,R5, LSL #+4
        ADDS     R5,R1,R0, LSL #+6
        MOVS     R1,#+0
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        ADDS     R5,R5,R0, LSL #+7
//  114   
//  115   if(TEMP!=0x70)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+112
        BEQ.N    ??keyboard_scan_4
//  116   {
//  117     delay_ms(10);     
        MOVS     R0,#+10
        BL       delay_ms
//  118     
//  119     TEMP=((gpio_read(keyport,(pin_begin+3))<<4)+(gpio_read(keyport,(pin_begin+2))<<5)+(gpio_read(keyport,(pin_begin+1))<<6)+(gpio_read(keyport,(pin_begin+0))<<7));          
        MOVS     R1,#+3
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        MOVS     R5,R0
        MOVS     R1,#+2
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        MOVS     R6,R0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        LSLS     R1,R6,#+5
        ADDS     R1,R1,R5, LSL #+4
        ADDS     R5,R1,R0, LSL #+6
        MOVS     R1,#+0
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        ADDS     R5,R5,R0, LSL #+7
//  120     
//  121     if(TEMP!=0x70)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+112
        BEQ.N    ??keyboard_scan_4
//  122     {
//  123        switch(TEMP)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+48
        BEQ.N    ??keyboard_scan_5
        CMP      R5,#+80
        BEQ.N    ??keyboard_scan_6
        CMP      R5,#+96
        BNE.N    ??keyboard_scan_4
//  124        {
//  125         case 0x60:	
//  126                   key_num=7;                    //7号键被按下				
??keyboard_scan_7:
        MOVS     R4,#+7
//  127                   break;
        B.N      ??keyboard_scan_4
//  128         case 0x50:
//  129                   key_num=8;                    //8号键被按下
??keyboard_scan_6:
        MOVS     R4,#+8
//  130                   break;
        B.N      ??keyboard_scan_4
//  131         case 0x30:
//  132                   key_num=9;                     //9号键被按下
??keyboard_scan_5:
        MOVS     R4,#+9
//  133                   break;
//  134         }
//  135     }			 	   
//  136   }
//  137   //第二行------------------------
//  138   gpio_init (keyport,(pin_begin+7),1,1);
??keyboard_scan_4:
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+7
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_init
//  139   gpio_init (keyport,(pin_begin+6),1,1);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+6
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_init
//  140   gpio_init (keyport,(pin_begin+5),1,0);
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+5
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_init
//  141   gpio_init (keyport,(pin_begin+4),1,1);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+4
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_init
//  142     
//  143   TEMP=((gpio_read(keyport,(pin_begin+3))<<4)+(gpio_read(keyport,(pin_begin+2))<<5)+(gpio_read(keyport,(pin_begin+1))<<6)+(gpio_read(keyport,(pin_begin+0))<<7));
        MOVS     R1,#+3
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        MOVS     R5,R0
        MOVS     R1,#+2
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        MOVS     R6,R0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        LSLS     R1,R6,#+5
        ADDS     R1,R1,R5, LSL #+4
        ADDS     R5,R1,R0, LSL #+6
        MOVS     R1,#+0
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        ADDS     R5,R5,R0, LSL #+7
//  144 
//  145   if(TEMP!=0x70)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+112
        BEQ.N    ??keyboard_scan_8
//  146   {
//  147     delay_ms(10);
        MOVS     R0,#+10
        BL       delay_ms
//  148         
//  149     TEMP=((gpio_read(keyport,(pin_begin+3))<<4)+(gpio_read(keyport,(pin_begin+2))<<5)+(gpio_read(keyport,(pin_begin+1))<<6)+(gpio_read(keyport,(pin_begin+0))<<7));
        MOVS     R1,#+3
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        MOVS     R5,R0
        MOVS     R1,#+2
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        MOVS     R6,R0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        LSLS     R1,R6,#+5
        ADDS     R1,R1,R5, LSL #+4
        ADDS     R5,R1,R0, LSL #+6
        MOVS     R1,#+0
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        ADDS     R5,R5,R0, LSL #+7
//  150         
//  151     if(TEMP!=0x70)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+112
        BEQ.N    ??keyboard_scan_8
//  152     {
//  153       switch(TEMP)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+48
        BEQ.N    ??keyboard_scan_9
        CMP      R5,#+80
        BEQ.N    ??keyboard_scan_10
        CMP      R5,#+96
        BNE.N    ??keyboard_scan_8
//  154       {
//  155       case 0x60:
//  156                 key_num=4;                         //4号键被按下					
??keyboard_scan_11:
        MOVS     R4,#+4
//  157                 break;
        B.N      ??keyboard_scan_8
//  158       case 0x50:
//  159                 key_num=5;                        //5号键被按下
??keyboard_scan_10:
        MOVS     R4,#+5
//  160                 break;
        B.N      ??keyboard_scan_8
//  161       case 0x30:
//  162                 key_num=6;                        //6号键被按下
??keyboard_scan_9:
        MOVS     R4,#+6
//  163                 break;
//  164       }
//  165     }			 	   
//  166   }
//  167   //第一行------------------------------
//  168   gpio_init (keyport,(pin_begin+7),1,1);
??keyboard_scan_8:
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+7
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_init
//  169   gpio_init (keyport,(pin_begin+6),1,1);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+6
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_init
//  170   gpio_init (keyport,(pin_begin+5),1,1);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+5
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_init
//  171   gpio_init (keyport,(pin_begin+4),1,0);
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+4
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_init
//  172     
//  173   TEMP=((gpio_read(keyport,(pin_begin+3))<<4)+(gpio_read(keyport,(pin_begin+2))<<5)+(gpio_read(keyport,(pin_begin+1))<<6)+(gpio_read(keyport,(pin_begin+0))<<7));
        MOVS     R1,#+3
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        MOVS     R5,R0
        MOVS     R1,#+2
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        MOVS     R6,R0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        LSLS     R1,R6,#+5
        ADDS     R1,R1,R5, LSL #+4
        ADDS     R5,R1,R0, LSL #+6
        MOVS     R1,#+0
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        ADDS     R5,R5,R0, LSL #+7
//  174     
//  175   if(TEMP!=0x70)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+112
        BEQ.N    ??keyboard_scan_12
//  176   {
//  177     delay_ms(10);
        MOVS     R0,#+10
        BL       delay_ms
//  178         
//  179     TEMP=((gpio_read(keyport,(pin_begin+3))<<4)+(gpio_read(keyport,(pin_begin+2))<<5)+(gpio_read(keyport,(pin_begin+1))<<6)+(gpio_read(keyport,(pin_begin+0))<<7));
        MOVS     R1,#+3
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        MOVS     R5,R0
        MOVS     R1,#+2
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        MOVS     R6,R0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        LSLS     R1,R6,#+5
        ADDS     R1,R1,R5, LSL #+4
        ADDS     R5,R1,R0, LSL #+6
        MOVS     R1,#+0
        LDR.N    R0,??DataTable2_9  ;; 0x400ff0c0
        BL       gpio_read
        ADDS     R5,R5,R0, LSL #+7
//  180         
//  181     if(TEMP!=0x70)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+112
        BEQ.N    ??keyboard_scan_12
//  182     {
//  183        switch(TEMP)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+48
        BEQ.N    ??keyboard_scan_13
        CMP      R5,#+80
        BEQ.N    ??keyboard_scan_14
        CMP      R5,#+96
        BNE.N    ??keyboard_scan_12
//  184        {
//  185        case 0x60:
//  186                  key_num=1;                           //1号键被按下					
??keyboard_scan_15:
        MOVS     R4,#+1
//  187                  break;
        B.N      ??keyboard_scan_12
//  188        case 0x50:
//  189                  key_num=2;                           //2号键被按下
??keyboard_scan_14:
        MOVS     R4,#+2
//  190                  break;
        B.N      ??keyboard_scan_12
//  191        case  0x30:
//  192                  key_num=3;                           //3号键被按下
??keyboard_scan_13:
        MOVS     R4,#+3
//  193                  break;
//  194        }
//  195     }			 	   
//  196   } 
//  197   return(key_num);     
??keyboard_scan_12:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return
//  198 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x4004c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x4004c004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0x4004c008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0x4004c00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0x4004c010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     0x4004c014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     0x4004c018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     0x4004c01c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     0x400ff0c0

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
// 1 046 bytes in section .text
// 
// 1 046 bytes of CODE memory
//
//Errors: none
//Warnings: none
