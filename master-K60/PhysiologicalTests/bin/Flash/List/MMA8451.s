///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       08/Apr/2015  15:15:26
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\C\Component_C\MMA8451.c
//    Command line =  
//        C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\C\Component_C\MMA8451.c
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
//        C:\Users\Administrator\Desktop\PhysiologicalTests\bin\Flash\List\MMA8451.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Delay5us
        EXTERN gpio_ctrl
        EXTERN gpio_read

        PUBLIC BUF
        PUBLIC CY
        PUBLIC Init_MMA8452
        PUBLIC MMA8452_RecvACK
        PUBLIC MMA8452_RecvByte
        PUBLIC MMA8452_SendACK
        PUBLIC MMA8452_SendByte
        PUBLIC MMA8452_Start
        PUBLIC MMA8452_Stop
        PUBLIC Multiple_Read_MMA8452
        PUBLIC Single_Write_MMA8452

// C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\C\Component_C\MMA8451.c
//    1 #include"includes.h"
//    2 //#include"MMA8451.h"
//    3 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    4 uint8   BUF[8];
BUF:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    5 uint8   CY;
CY:
        DS8 1
//    6 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    7 void MMA8452_Start()
//    8 {
MMA8452_Start:
        PUSH     {R7,LR}
//    9     SDA_SET();                  
        MOVS     R2,#+1
        MOVS     R1,#+6
        LDR.N    R0,??DataTable6  ;; 0x400ff080
        BL       gpio_ctrl
//   10     SCL_SET();                    
        MOVS     R2,#+1
        MOVS     R1,#+4
        LDR.N    R0,??DataTable6  ;; 0x400ff080
        BL       gpio_ctrl
//   11     Delay5us();                 
        BL       Delay5us
//   12     SDA_CLR();                  
        MOVS     R2,#+0
        MOVS     R1,#+6
        LDR.N    R0,??DataTable6  ;; 0x400ff080
        BL       gpio_ctrl
//   13     Delay5us();                 
        BL       Delay5us
//   14     SCL_CLR();                    
        MOVS     R2,#+0
        MOVS     R1,#+4
        LDR.N    R0,??DataTable6  ;; 0x400ff080
        BL       gpio_ctrl
//   15 }
        POP      {R0,PC}          ;; return
//   16 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   17 void MMA8452_Stop()
//   18 {
MMA8452_Stop:
        PUSH     {R7,LR}
//   19     SDA_CLR();                    
        MOVS     R2,#+0
        MOVS     R1,#+6
        LDR.N    R0,??DataTable6  ;; 0x400ff080
        BL       gpio_ctrl
//   20     SCL_SET();                    
        MOVS     R2,#+1
        MOVS     R1,#+4
        LDR.N    R0,??DataTable6  ;; 0x400ff080
        BL       gpio_ctrl
//   21     Delay5us();                 
        BL       Delay5us
//   22     SDA_SET();                    
        MOVS     R2,#+1
        MOVS     R1,#+6
        LDR.N    R0,??DataTable6  ;; 0x400ff080
        BL       gpio_ctrl
//   23     Delay5us();                 
        BL       Delay5us
//   24 }
        POP      {R0,PC}          ;; return
//   25 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   26 void MMA8452_SendACK(uint8 ack)
//   27 {
MMA8452_SendACK:
        PUSH     {R7,LR}
//   28     gpio_ctrl(PORTC,6,ack);             
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,R0
        MOVS     R1,#+6
        LDR.N    R0,??DataTable6  ;; 0x400ff080
        BL       gpio_ctrl
//   29     SCL_SET();                    
        MOVS     R2,#+1
        MOVS     R1,#+4
        LDR.N    R0,??DataTable6  ;; 0x400ff080
        BL       gpio_ctrl
//   30     Delay5us();                 
        BL       Delay5us
//   31     SCL_CLR();                    
        MOVS     R2,#+0
        MOVS     R1,#+4
        LDR.N    R0,??DataTable6  ;; 0x400ff080
        BL       gpio_ctrl
//   32     Delay5us();                
        BL       Delay5us
//   33 }
        POP      {R0,PC}          ;; return
//   34 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   35 uint8 MMA8452_RecvACK()
//   36 {
MMA8452_RecvACK:
        PUSH     {R7,LR}
//   37     SCL_SET();                    
        MOVS     R2,#+1
        MOVS     R1,#+4
        LDR.N    R0,??DataTable6  ;; 0x400ff080
        BL       gpio_ctrl
//   38     Delay5us();                 
        BL       Delay5us
//   39     CY=gpio_read(PORTC,6);               
        MOVS     R1,#+6
        LDR.N    R0,??DataTable6  ;; 0x400ff080
        BL       gpio_read
        LDR.N    R1,??DataTable6_1
        STRB     R0,[R1, #+0]
//   40     SCL_CLR();                  
        MOVS     R2,#+0
        MOVS     R1,#+4
        LDR.N    R0,??DataTable6  ;; 0x400ff080
        BL       gpio_ctrl
//   41     Delay5us();                 
        BL       Delay5us
//   42 
//   43     return CY;
        LDR.N    R0,??DataTable6_1
        LDRB     R0,[R0, #+0]
        POP      {R1,PC}          ;; return
//   44 }
//   45 
//   46 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   47 void MMA8452_SendByte(uint8 dat)
//   48 {
MMA8452_SendByte:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
//   49     uint8 i;
//   50     uint8 DAT;
//   51     
//   52     DAT=dat;
        MOVS     R6,R4
//   53     
//   54     for (i=0; i<8; i++)         
        MOVS     R5,#+0
        B.N      ??MMA8452_SendByte_0
//   55     {
//   56         dat&=(1<<(7-i));
//   57         if(dat==0) SDA_CLR();
//   58         else SDA_SET();
??MMA8452_SendByte_1:
        MOVS     R2,#+1
        MOVS     R1,#+6
        LDR.N    R0,??DataTable6  ;; 0x400ff080
        BL       gpio_ctrl
//   59         
//   60         dat=DAT;
??MMA8452_SendByte_2:
        MOVS     R4,R6
//   61         
//   62         SCL_SET();                
        MOVS     R2,#+1
        MOVS     R1,#+4
        LDR.N    R0,??DataTable6  ;; 0x400ff080
        BL       gpio_ctrl
//   63         Delay5us();             
        BL       Delay5us
//   64         SCL_CLR();               
        MOVS     R2,#+0
        MOVS     R1,#+4
        LDR.N    R0,??DataTable6  ;; 0x400ff080
        BL       gpio_ctrl
//   65         Delay5us();            
        BL       Delay5us
        ADDS     R5,R5,#+1
??MMA8452_SendByte_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+8
        BGE.N    ??MMA8452_SendByte_3
        MOVS     R0,#+1
        RSBS     R1,R5,#+7
        LSLS     R0,R0,R1
        ANDS     R4,R0,R4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??MMA8452_SendByte_1
        MOVS     R2,#+0
        MOVS     R1,#+6
        LDR.N    R0,??DataTable6  ;; 0x400ff080
        BL       gpio_ctrl
        B.N      ??MMA8452_SendByte_2
//   66     }
//   67     MMA8452_RecvACK();
??MMA8452_SendByte_3:
        BL       MMA8452_RecvACK
//   68 }
        POP      {R4-R6,PC}       ;; return
//   69 
//   70 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   71 uint8 MMA8452_RecvByte()
//   72 {
MMA8452_RecvByte:
        PUSH     {R3-R5,LR}
//   73     uint8 i;
//   74     uint8 dat = 0;
        MOVS     R5,#+0
//   75 
//   76     SDA_SET();                    
        MOVS     R2,#+1
        MOVS     R1,#+6
        LDR.N    R0,??DataTable6  ;; 0x400ff080
        BL       gpio_ctrl
//   77     for (i=0; i<8; i++)         
        MOVS     R4,#+0
        B.N      ??MMA8452_RecvByte_0
//   78     {
//   79         dat <<= 1;
??MMA8452_RecvByte_1:
        LSLS     R5,R5,#+1
//   80         SCL_SET();               
        MOVS     R2,#+1
        MOVS     R1,#+4
        LDR.N    R0,??DataTable6  ;; 0x400ff080
        BL       gpio_ctrl
//   81         Delay5us();             
        BL       Delay5us
//   82         dat |= gpio_read(PORTC,6);                       
        MOVS     R1,#+6
        LDR.N    R0,??DataTable6  ;; 0x400ff080
        BL       gpio_read
        ORRS     R5,R0,R5
//   83         SCL_CLR();               
        MOVS     R2,#+0
        MOVS     R1,#+4
        LDR.N    R0,??DataTable6  ;; 0x400ff080
        BL       gpio_ctrl
//   84         Delay5us();             
        BL       Delay5us
//   85     }
        ADDS     R4,R4,#+1
??MMA8452_RecvByte_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BLT.N    ??MMA8452_RecvByte_1
//   86     return dat;
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
//   87 }
//   88 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   89 void Single_Write_MMA8452(uint8 REG_Address,uint8 REG_data)
//   90 {
Single_Write_MMA8452:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//   91     MMA8452_Start();                  
        BL       MMA8452_Start
//   92     MMA8452_SendByte(SlaveAddress);  
        MOVS     R0,#+56
        BL       MMA8452_SendByte
//   93     MMA8452_SendByte(REG_Address);    
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       MMA8452_SendByte
//   94     MMA8452_SendByte(REG_data);      
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       MMA8452_SendByte
//   95     MMA8452_Stop();                   
        BL       MMA8452_Stop
//   96 }
        POP      {R0,R4,R5,PC}    ;; return
//   97 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   98 void Multiple_Read_MMA8452(void)
//   99 {   
Multiple_Read_MMA8452:
        PUSH     {R4,LR}
//  100     uint8 i;
//  101     MMA8452_Start();                          
        BL       MMA8452_Start
//  102     MMA8452_SendByte(SlaveAddress);           
        MOVS     R0,#+56
        BL       MMA8452_SendByte
//  103     MMA8452_SendByte(0x01);                   
        MOVS     R0,#+1
        BL       MMA8452_SendByte
//  104     MMA8452_Start();                          
        BL       MMA8452_Start
//  105     MMA8452_SendByte(SlaveAddress+1);         
        MOVS     R0,#+57
        BL       MMA8452_SendByte
//  106     for (i=0; i<6; i++)                       
        MOVS     R4,#+0
        B.N      ??Multiple_Read_MMA8452_0
//  107     {
//  108         BUF[i] = MMA8452_RecvByte();          
//  109         if (i == 5)
//  110         {
//  111           MMA8452_SendACK(1);                
//  112         }
//  113         else
//  114         {
//  115           MMA8452_SendACK(0);                
??Multiple_Read_MMA8452_1:
        MOVS     R0,#+0
        BL       MMA8452_SendACK
//  116         }
??Multiple_Read_MMA8452_2:
        ADDS     R4,R4,#+1
??Multiple_Read_MMA8452_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+6
        BGE.N    ??Multiple_Read_MMA8452_3
        BL       MMA8452_RecvByte
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R1,??DataTable6_2
        STRB     R0,[R4, R1]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+5
        BNE.N    ??Multiple_Read_MMA8452_1
        MOVS     R0,#+1
        BL       MMA8452_SendACK
        B.N      ??Multiple_Read_MMA8452_2
//  117     }
//  118     MMA8452_Stop();                           
??Multiple_Read_MMA8452_3:
        BL       MMA8452_Stop
//  119     Delay5us();
        BL       Delay5us
//  120     Delay5us();
        BL       Delay5us
//  121     Delay5us();
        BL       Delay5us
//  122     Delay5us();
        BL       Delay5us
//  123 }
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     CY

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     BUF
//  124 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  125 void Init_MMA8452()
//  126 {
Init_MMA8452:
        PUSH     {R7,LR}
//  127    Single_Write_MMA8452(0x2A,0x01);  
        MOVS     R1,#+1
        MOVS     R0,#+42
        BL       Single_Write_MMA8452
//  128    Single_Write_MMA8452(0x2B,0x02);  
        MOVS     R1,#+2
        MOVS     R0,#+43
        BL       Single_Write_MMA8452
//  129 }
        POP      {R0,PC}          ;; return

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
//   9 bytes in section .bss
// 512 bytes in section .text
// 
// 512 bytes of CODE memory
//   9 bytes of DATA memory
//
//Errors: none
//Warnings: none
