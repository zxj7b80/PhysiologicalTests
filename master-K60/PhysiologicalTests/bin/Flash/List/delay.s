///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       08/Apr/2015  15:15:24
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\C\Component_C\delay.c
//    Command line =  
//        C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\C\Component_C\delay.c
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
//        C:\Users\Administrator\Desktop\PhysiologicalTests\bin\Flash\List\delay.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC Delay5us
        PUBLIC Delay_us
        PUBLIC SamplingDelay
        PUBLIC delay
        PUBLIC delay_ms

// C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\C\Component_C\delay.c
//    1 #include"delay.h"
//    2 #include"includes.h"
//    3 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    4 void delay(uint32 a)//由什么决定执行一次命令的时间呢？ 
//    5 {
//    6   uint32 i;
//    7   for(i=0;i<a;i++);
delay:
        MOVS     R1,#+0
        B.N      ??delay_0
??delay_1:
        ADDS     R1,R1,#+1
??delay_0:
        CMP      R1,R0
        BCC.N    ??delay_1
//    8 }
        BX       LR               ;; return
//    9 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   10 void SamplingDelay(void)//CCD延时程序 200ns
//   11 {
SamplingDelay:
        SUB      SP,SP,#+4
//   12    volatile uint8 i;
//   13    for(i=0;i<1;i++)
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
        B.N      ??SamplingDelay_0
//   14    {
//   15     asm("nop");
??SamplingDelay_1:
        nop
//   16     asm("nop");
        nop
//   17    }
        LDRB     R0,[SP, #+0]
        ADDS     R0,R0,#+1
        STRB     R0,[SP, #+0]
??SamplingDelay_0:
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??SamplingDelay_1
//   18 }
        ADD      SP,SP,#+4
        BX       LR               ;; return
//   19 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   20 void Delay5us()
//   21 {
Delay5us:
        PUSH     {R4,LR}
//   22   uint8 i=0;
        MOVS     R4,#+0
//   23   for(i = 0; i < 25; i++)
        MOVS     R0,#+0
        MOVS     R4,R0
        B.N      ??Delay5us_0
//   24   {
//   25     SamplingDelay();//200ns
??Delay5us_1:
        BL       SamplingDelay
//   26   }
        ADDS     R4,R4,#+1
??Delay5us_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+25
        BLT.N    ??Delay5us_1
//   27 }
        POP      {R4,PC}          ;; return
//   28 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   29 void Delay_us(int count)
//   30 {
Delay_us:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//   31   uint8 i=0;
        MOVS     R5,#+0
//   32   
//   33   for(i = 0; i < count; i++)
        MOVS     R0,#+0
        MOVS     R5,R0
        B.N      ??Delay_us_0
//   34   {
//   35     SamplingDelay();//200ns
??Delay_us_1:
        BL       SamplingDelay
//   36     SamplingDelay();//200ns
        BL       SamplingDelay
//   37     SamplingDelay();//200ns
        BL       SamplingDelay
//   38     SamplingDelay();//200ns
        BL       SamplingDelay
//   39     SamplingDelay();//200ns
        BL       SamplingDelay
//   40   }
        ADDS     R5,R5,#+1
??Delay_us_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,R4
        BLT.N    ??Delay_us_1
//   41 }
        POP      {R0,R4,R5,PC}    ;; return
//   42 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   43 void delay_ms(uint32 count_val)
//   44 {
//   45   /* Make sure the clock to the LPTMR is enabled */
//   46   SIM_SCGC5|=SIM_SCGC5_LPTIMER_MASK; 
delay_ms:
        LDR.N    R1,??DataTable0  ;; 0x40048038
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x1
        LDR.N    R2,??DataTable0  ;; 0x40048038
        STR      R1,[R2, #+0]
//   47   
//   48   /* Set the compare value to the number of ms to delay */
//   49   LPTMR0_CMR = count_val; 
        LDR.N    R1,??DataTable0_1  ;; 0x40040008
        STR      R0,[R1, #+0]
//   50   
//   51   /* Set up LPTMR to use 1kHz LPO with no prescaler as its clock source */
//   52   LPTMR0_PSR = LPTMR_PSR_PCS(1)|LPTMR_PSR_PBYP_MASK; 
        MOVS     R0,#+5
        LDR.N    R1,??DataTable0_2  ;; 0x40040004
        STR      R0,[R1, #+0]
//   53   
//   54   /* Start the timer */
//   55   LPTMR0_CSR |= LPTMR_CSR_TEN_MASK; 
        LDR.N    R0,??DataTable0_3  ;; 0x40040000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable0_3  ;; 0x40040000
        STR      R0,[R1, #+0]
//   56 
//   57   /* Wait for counter to reach compare value */
//   58   while (!(LPTMR0_CSR & LPTMR_CSR_TCF_MASK));
??delay_ms_0:
        LDR.N    R0,??DataTable0_3  ;; 0x40040000
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??delay_ms_0
//   59   
//   60   /* Clear Timer Compare Flag */
//   61   LPTMR0_CSR &= ~LPTMR_CSR_TEN_MASK;
        LDR.N    R0,??DataTable0_3  ;; 0x40040000
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable0_3  ;; 0x40040000
        STR      R0,[R1, #+0]
//   62   
//   63   return;
        BX       LR               ;; return
//   64 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     0x40040008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     0x40040004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC32     0x40040000

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
// 186 bytes in section .text
// 
// 186 bytes of CODE memory
//
//Errors: none
//Warnings: none
