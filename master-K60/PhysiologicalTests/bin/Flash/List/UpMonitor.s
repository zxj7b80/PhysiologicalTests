///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       08/Apr/2015  15:15:26
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\C\Component_C\UpMonitor.c
//    Command line =  
//        C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\C\Component_C\UpMonitor.c
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
//        C:\Users\Administrator\Desktop\PhysiologicalTests\bin\Flash\List\UpMonitor.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN OFF_Y
        EXTERN __aeabi_memclr4
        EXTERN delay_ms
        EXTERN uart_send1

        PUBLIC CRC_CHECK
        PUBLIC OutData
        PUBLIC OutPut_Data
        PUBLIC SendHex
        PUBLIC SendImageData
        PUBLIC serial_Txd
        PUBLIC serial_choose
        PUBLIC virtual_scope_show

// C:\Users\Administrator\Desktop\PhysiologicalTests\src\Sources\C\Component_C\UpMonitor.c
//    1 #include "includes.h"
//    2 #include "UpMonitor.h"
//    3 //----------------------------给CCDView发送图像------------------------//

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    4 int16 OutData[4] = { 0 };//虚拟示波器输出
OutData:
        DS8 8
//    5 extern  int     OFF_X,OFF_Y,OFF_Z;
//    6         

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    7 void SendImageData(uint8 * ImageData)
//    8 {
SendImageData:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
//    9     unsigned char i;
//   10     unsigned char crc = 0;
        MOVS     R6,#+0
//   11     /* Send Data */
//   12     uart_send1(UART3,'*');
        MOVS     R1,#+42
        LDR.N    R0,??DataTable5  ;; 0x4006d000
        BL       uart_send1
//   13     uart_send1(UART3,'L');
        MOVS     R1,#+76
        LDR.N    R0,??DataTable5  ;; 0x4006d000
        BL       uart_send1
//   14     uart_send1(UART3,'D');
        MOVS     R1,#+68
        LDR.N    R0,??DataTable5  ;; 0x4006d000
        BL       uart_send1
//   15 
//   16     SendHex(0);
        MOVS     R0,#+0
        BL       SendHex
//   17     SendHex(0);
        MOVS     R0,#+0
        BL       SendHex
//   18     SendHex(0);
        MOVS     R0,#+0
        BL       SendHex
//   19     SendHex(0);
        MOVS     R0,#+0
        BL       SendHex
//   20 
//   21     for(i=0; i<128; i++)
        MOVS     R5,#+0
        B.N      ??SendImageData_0
//   22     {
//   23         SendHex(*ImageData ++);
??SendImageData_1:
        LDRB     R0,[R4, #+0]
        BL       SendHex
        ADDS     R4,R4,#+1
//   24     }
        ADDS     R5,R5,#+1
??SendImageData_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+128
        BLT.N    ??SendImageData_1
//   25     SendHex(crc);
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SendHex
//   26     uart_send1(UART3,'#');
        MOVS     R1,#+35
        LDR.N    R0,??DataTable5  ;; 0x4006d000
        BL       uart_send1
//   27 }
        POP      {R4-R6,PC}       ;; return
//   28 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   29 void SendHex(unsigned char hex)
//   30 {
SendHex:
        PUSH     {R4,LR}
        MOVS     R4,R0
//   31   unsigned char temp;
//   32   temp = hex >> 4;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSRS     R0,R4,#+4
//   33   if(temp < 10)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+10
        BGE.N    ??SendHex_0
//   34   {
//   35    uart_send1(UART3,temp + '0');
        ADDS     R1,R0,#+48
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable5  ;; 0x4006d000
        BL       uart_send1
        B.N      ??SendHex_1
//   36   }
//   37   else
//   38   {
//   39    uart_send1(UART3,temp - 10 + 'A');
??SendHex_0:
        ADDS     R1,R0,#+55
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable5  ;; 0x4006d000
        BL       uart_send1
//   40   }
//   41   temp = hex & 0x0F;
??SendHex_1:
        ANDS     R0,R4,#0xF
//   42   if(temp < 10)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+10
        BGE.N    ??SendHex_2
//   43   {
//   44    uart_send1(UART3,temp + '0');
        ADDS     R1,R0,#+48
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable5  ;; 0x4006d000
        BL       uart_send1
        B.N      ??SendHex_3
//   45   }
//   46   else
//   47   {
//   48    uart_send1(UART3,temp - 10 + 'A');
??SendHex_2:
        ADDS     R1,R0,#+55
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable5  ;; 0x4006d000
        BL       uart_send1
//   49   }
//   50 }
??SendHex_3:
        POP      {R4,PC}          ;; return
//   51 
//   52 
//   53 /****************************虚拟示波器模块******************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   54 void virtual_scope_show(void)
//   55 {
//   56       OutData[0]=OFF_Y;
virtual_scope_show:
        LDR.N    R0,??DataTable5_1
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable5_2
        STRH     R0,[R1, #+0]
//   57       //OutData[1]=0;
//   58       //OutData[2]=0;
//   59       //OutData[3]=0;
//   60 }
        BX       LR               ;; return
//   61 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   62 void serial_Txd()//传输的一帧数据，包括如下的内容
//   63 {
serial_Txd:
        PUSH     {R4,LR}
        SUB      SP,SP,#+16
//   64         uint8 temp[10]={0};
        ADD      R0,SP,#+0
        MOVS     R1,#+0
        MOVS     R2,#+0
        MOVS     R3,#+0
        STM      R0!,{R1-R3}
        SUBS     R0,R0,#+12
//   65         uint8 i,j;
//   66         //帧头数据
//   67         uart_send1 (UART3, 0xa5);
        MOVS     R1,#+165
        LDR.N    R0,??DataTable5  ;; 0x4006d000
        BL       uart_send1
//   68         uart_send1 (UART3, 0x5a);
        MOVS     R1,#+90
        LDR.N    R0,??DataTable5  ;; 0x4006d000
        BL       uart_send1
//   69 	
//   70         //第一条曲线的数据
//   71         for(i=0;i<3;i++)
        MOVS     R0,#+0
        B.N      ??serial_Txd_0
//   72         {
//   73            temp[i*2]=(int)OutData[i]/10;
??serial_Txd_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable5_2
        LDRSH    R1,[R1, R0, LSL #+1]
        MOVS     R2,#+10
        SDIV     R1,R1,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R2,SP,#+0
        STRB     R1,[R2, R0, LSL #+1]
//   74            temp[i*2+1]=(int)OutData[i]%10;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable5_2
        LDRSH    R1,[R1, R0, LSL #+1]
        MOVS     R2,#+10
        SDIV     R3,R1,R2
        MLS      R1,R2,R3,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R2,SP,#+0
        ADDS     R2,R2,R0, LSL #+1
        STRB     R1,[R2, #+1]
//   75         }
        ADDS     R0,R0,#+1
??serial_Txd_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BLT.N    ??serial_Txd_1
//   76         
//   77        for(j=0;j<6;j++)
        MOVS     R4,#+0
        B.N      ??serial_Txd_2
//   78        {
//   79           uart_send1 (UART3, temp[j]);
??serial_Txd_3:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R0,SP,#+0
        LDRB     R1,[R4, R0]
        LDR.N    R0,??DataTable5  ;; 0x4006d000
        BL       uart_send1
//   80        }
        ADDS     R4,R4,#+1
??serial_Txd_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+6
        BLT.N    ??serial_Txd_3
//   81         delay_ms(10);
        MOVS     R0,#+10
        BL       delay_ms
//   82 }
        POP      {R0-R4,PC}       ;; return
//   83 
//   84 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   85 unsigned short CRC_CHECK(unsigned char *Buf, unsigned char CRC_CNT)
//   86 {
CRC_CHECK:
        PUSH     {R4,R5}
//   87     unsigned short CRC_Temp;
//   88     unsigned char i,j;
//   89     CRC_Temp = 0xffff;
        MOVW     R2,#+65535
//   90 
//   91     for (i=0;i<CRC_CNT; i++)
        MOVS     R3,#+0
        B.N      ??CRC_CHECK_0
??CRC_CHECK_1:
        ADDS     R3,R3,#+1
??CRC_CHECK_0:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R3,R1
        BCS.N    ??CRC_CHECK_2
//   92     {
//   93         CRC_Temp ^= Buf[i];
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDRB     R4,[R3, R0]
        EORS     R2,R4,R2
//   94         for (j=0;j<8;j++)
        MOVS     R4,#+0
        B.N      ??CRC_CHECK_3
//   95         {
//   96             if (CRC_Temp & 0x01)
//   97                 CRC_Temp = (CRC_Temp >>1 ) ^ 0xa001;
//   98             else
//   99                 CRC_Temp = CRC_Temp >> 1;
??CRC_CHECK_4:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LSRS     R2,R2,#+1
??CRC_CHECK_5:
        ADDS     R4,R4,#+1
??CRC_CHECK_3:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BGE.N    ??CRC_CHECK_1
        LSLS     R5,R2,#+31
        BPL.N    ??CRC_CHECK_4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LSRS     R2,R2,#+1
        EOR      R2,R2,#0xA000
        EORS     R2,R2,#0x1
        B.N      ??CRC_CHECK_5
//  100         }
//  101     }
//  102     return(CRC_Temp);
??CRC_CHECK_2:
        MOVS     R0,R2
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R4,R5}
        BX       LR               ;; return
//  103 }
//  104 
//  105 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  106 void OutPut_Data(void)
//  107 {
OutPut_Data:
        PUSH     {R4,LR}
        SUB      SP,SP,#+48
//  108   int temp[4] = {0};
        ADD      R0,SP,#+28
        MOVS     R1,#+16
        BL       __aeabi_memclr4
//  109   unsigned int temp1[4] = {0};
        ADD      R0,SP,#+12
        MOVS     R1,#+16
        BL       __aeabi_memclr4
//  110   unsigned char databuf[10] = {0};
        ADD      R0,SP,#+0
        MOVS     R1,#+0
        MOVS     R2,#+0
        MOVS     R3,#+0
        STM      R0!,{R1-R3}
        SUBS     R0,R0,#+12
//  111   unsigned char i;
//  112   unsigned short CRC16 = 0;
        MOVS     R0,#+0
//  113   for(i=0;i<4;i++)
        MOVS     R4,#+0
        B.N      ??OutPut_Data_0
//  114   {
//  115     temp[i]  = (int16)OutData[i];
??OutPut_Data_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_2
        LDRSH    R0,[R0, R4, LSL #+1]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R1,SP,#+28
        STR      R0,[R1, R4, LSL #+2]
//  116     temp1[i] = (uint16)temp[i];
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R0,SP,#+28
        LDRH     R0,[R0, R4, LSL #+2]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R1,SP,#+12
        STR      R0,[R1, R4, LSL #+2]
//  117   }
        ADDS     R4,R4,#+1
??OutPut_Data_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BLT.N    ??OutPut_Data_1
//  118 
//  119   for(i=0;i<4;i++)
        MOVS     R4,#+0
        B.N      ??OutPut_Data_2
//  120   {
//  121     databuf[i*2]   = (int8)(temp1[i]%256);
??OutPut_Data_3:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R0,SP,#+12
        LDR      R0,[R0, R4, LSL #+2]
        MOV      R1,#+256
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R0,SP,#+0
        STRB     R2,[R0, R4, LSL #+1]
//  122     databuf[i*2+1] = (int8)(temp1[i]/256);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R0,SP,#+12
        LDR      R0,[R0, R4, LSL #+2]
        LSRS     R0,R0,#+8
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R1,SP,#+0
        ADDS     R1,R1,R4, LSL #+1
        STRB     R0,[R1, #+1]
//  123   }
        ADDS     R4,R4,#+1
??OutPut_Data_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BLT.N    ??OutPut_Data_3
//  124 
//  125   CRC16 = CRC_CHECK(databuf,8);
        MOVS     R1,#+8
        ADD      R0,SP,#+0
        BL       CRC_CHECK
//  126   databuf[8] = CRC16%256;
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOV      R1,#+256
        SDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        STRB     R2,[SP, #+8]
//  127   databuf[9] = CRC16/256;
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOV      R1,#+256
        SDIV     R0,R0,R1
        STRB     R0,[SP, #+9]
//  128 
//  129   for(i=0;i<10;i++)
        MOVS     R4,#+0
        B.N      ??OutPut_Data_4
//  130   uart_send1 (UART3,databuf[i]);
??OutPut_Data_5:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R0,SP,#+0
        LDRB     R1,[R4, R0]
        LDR.N    R0,??DataTable5  ;; 0x4006d000
        BL       uart_send1
        ADDS     R4,R4,#+1
??OutPut_Data_4:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+10
        BLT.N    ??OutPut_Data_5
//  131 }
        ADD      SP,SP,#+48
        POP      {R4,PC}          ;; return
//  132 
//  133 //串口发送数据

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  134 void serial_choose()
//  135 {
serial_choose:
        PUSH     {R7,LR}
//  136 
//  137     //帧头数据
//  138     uart_send1 (UART3, 0xa5);
        MOVS     R1,#+165
        LDR.N    R0,??DataTable5  ;; 0x4006d000
        BL       uart_send1
//  139 
//  140     uart_send1 (UART3, 0x5a);
        MOVS     R1,#+90
        LDR.N    R0,??DataTable5  ;; 0x4006d000
        BL       uart_send1
//  141 
//  142 	//选择的线条
//  143 	//此处选择了第一,二,三条线
//  144 
//  145     uart_send1 (UART3, 0x01);
        MOVS     R1,#+1
        LDR.N    R0,??DataTable5  ;; 0x4006d000
        BL       uart_send1
//  146     uart_send1 (UART3, 0x00);
        MOVS     R1,#+0
        LDR.N    R0,??DataTable5  ;; 0x4006d000
        BL       uart_send1
//  147     uart_send1 (UART3, 0x00);
        MOVS     R1,#+0
        LDR.N    R0,??DataTable5  ;; 0x4006d000
        BL       uart_send1
//  148     uart_send1 (UART3, 0x00);
        MOVS     R1,#+0
        LDR.N    R0,??DataTable5  ;; 0x4006d000
        BL       uart_send1
//  149     uart_send1 (UART3, 0x00);
        MOVS     R1,#+0
        LDR.N    R0,??DataTable5  ;; 0x4006d000
        BL       uart_send1
//  150     delay_ms(10);
        MOVS     R0,#+10
        BL       delay_ms
//  151 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x4006d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     OFF_Y

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     OutData

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        END
// 
//   8 bytes in section .bss
//  56 bytes in section .rodata
// 658 bytes in section .text
// 
// 658 bytes of CODE  memory
//  56 bytes of CONST memory
//   8 bytes of DATA  memory
//
//Errors: none
//Warnings: none
