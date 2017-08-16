///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       24/Jun/2015  14:05:07
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\ZXJ\Desktop\人体生理指数测试系统\下位机\K60 new
//        board\PhysiologicalTests\src\Sources\C\Component_C\Command_analy.c
//    Command line =  
//        "C:\Users\ZXJ\Desktop\人体生理指数测试系统\下位机\K60 new
//        board\PhysiologicalTests\src\Sources\C\Component_C\Command_analy.c"
//        -D IAR -D TWR_K60N512 -lCN
//        "C:\Users\ZXJ\Desktop\人体生理指数测试系统\下位机\K60 new
//        board\PhysiologicalTests\bin\Flash\List\" -lB
//        "C:\Users\ZXJ\Desktop\人体生理指数测试系统\下位机\K60 new
//        board\PhysiologicalTests\bin\Flash\List\" -o
//        "C:\Users\ZXJ\Desktop\人体生理指数测试系统\下位机\K60 new
//        board\PhysiologicalTests\bin\Flash\Obj\" --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4 -e --fpu=None
//        --dlib_config "D:\MyProgramFiles\IAR
//        V7.1\arm\INC\c\DLib_Config_Normal.h" -I
//        "C:\Users\ZXJ\Desktop\人体生理指数测试系统\下位机\K60 new
//        board\PhysiologicalTests\src\Sources\H\" -I
//        "C:\Users\ZXJ\Desktop\人体生理指数测试系统\下位机\K60 new
//        board\PhysiologicalTests\src\Sources\H\Component_H\" -I
//        "C:\Users\ZXJ\Desktop\人体生理指数测试系统\下位机\K60 new
//        board\PhysiologicalTests\src\Sources\H\Frame_H\" -Ol --use_c++_inline
//    List file    =  
//        C:\Users\ZXJ\Desktop\人体生理指数测试系统\下位机\K60 new
//        board\PhysiologicalTests\bin\Flash\List\Command_analy.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN FTM_Count
        EXTERN __aeabi_cdcmpeq
        EXTERN __aeabi_cdcmple
        EXTERN __aeabi_cdrcmple
        EXTERN __aeabi_d2iz
        EXTERN __aeabi_dadd
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_i2d
        EXTERN base
        EXTERN enable_irq
        EXTERN g_nMotorPulseSigma

        PUBLIC Command_analy
        PUBLIC DM_start
        PUBLIC DelayTime
        PUBLIC DelayTimeChange
        PUBLIC FrequenceFlag
        PUBLIC MachineReset
        PUBLIC constant_angle
        PUBLIC motor_run_nag
        PUBLIC motor_run_pos
        PUBLIC motor_stop
        PUBLIC run_constant_angle_nag
        PUBLIC run_constant_angle_pos
        PUBLIC test_start

// C:\Users\ZXJ\Desktop\人体生理指数测试系统\下位机\K60 new board\PhysiologicalTests\src\Sources\C\Component_C\Command_analy.c
//    1 #include "Command_analy.h"
//    2 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    3 uint8 motor_run_pos=0;
motor_run_pos:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    4 uint8 motor_run_nag=0;
motor_run_nag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    5 uint8 motor_stop=0;
motor_stop:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    6 uint8 run_constant_angle_pos=0;
run_constant_angle_pos:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    7 uint8 run_constant_angle_nag=0;
run_constant_angle_nag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    8 uint8 test_start=0;
test_start:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    9 uint8 DM_start=0;
DM_start:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   10 uint8 MachineReset=0;
MachineReset:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(3)
//   11 double constant_angle=0;
constant_angle:
        DS8 8
//   12 extern int FTM_Count;

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   13 uint8  FrequenceFlag=0;
FrequenceFlag:
        DS8 1
//   14 extern int16 g_nMotorPulseSigma;

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   15 uint8 DelayTimeChange=0;
DelayTimeChange:
        DS8 1
//   16 extern uint16 base;

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   17 uint16 DelayTime=0;
DelayTime:
        DS8 2
//   18 extern uint8 DelayTimeChange;
//   19 
//   20 //====================================================================//
//   21 // 语法格式:  void Command_analy(uchar *buf)
//   22 // 实现功能： 解析收到的字符串
//   23 // 参    数： 字符串
//   24 // 返 回 值： 转化后双精度值
//   25 //====================================================================//

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   26 void Command_analy(uint8 *buf)
//   27 {
Command_analy:
        PUSH     {R4-R10,LR}
//   28 	double rev = 0;
        MOVS     R6,#+0
        MOVS     R7,#+0
//   29 	double dat;
//   30 	int integer = 1;
        MOVS     R10,#+1
//   31 	uint8 *str = buf;
        MOV      R9,R0
        B.N      ??Command_analy_0
//   32 	int i;
//   33 	while(*str != '*')
//   34 	{
//   35 		switch(*str)
//   36 		{
//   37 			case '0':
//   38 				dat = 0;
//   39 				break;
//   40 			case '1':
//   41 				dat = 1;
//   42 				break;
//   43 			case '2':
//   44 				dat = 2;
//   45 				break;		
//   46 			case '3':
//   47 				dat = 3;
//   48 				break;
//   49 			case '4':
//   50 				dat = 4;
//   51 				break;
//   52 			case '5':
//   53 				dat = 5;
//   54 				break;
//   55 			case '6':
//   56 				dat = 6;
//   57 				break;
//   58 			case '7':
//   59 				dat = 7;
//   60 				break;
//   61 			case '8':
//   62 				dat = 8;
//   63 				break;
//   64 			case '9':
//   65 				dat = 9;
//   66 				break;
//   67 			case '.':
//   68 				dat = '.';
//   69 				break;
//   70                         case '+':
//   71                                 run_constant_angle_nag=1;
//   72                                 run_constant_angle_pos=0;
//   73                                 motor_run_nag=0;
//   74                                 motor_run_pos=0;
//   75                                 DM_start=0;
//   76                                 test_start=0;
//   77                                 MachineReset=0;
//   78                                 break;
//   79                         case '-':
//   80                                 run_constant_angle_nag=0;
//   81                                 run_constant_angle_pos=1;
//   82                                 motor_run_nag=0;
//   83                                 motor_run_pos=0;
//   84                                 DM_start=0;
//   85                                 test_start=0;
//   86                                 MachineReset=0;
//   87                                 break;
//   88                         case 'P':
//   89                                 run_constant_angle_nag=0;
//   90                                 run_constant_angle_pos=0;
//   91                                 motor_run_nag=1;
//   92                                 motor_run_pos=0;
//   93                                 DM_start=0;
//   94                                 test_start=0;
//   95                                 MachineReset=0;
//   96                                 break;
//   97                         case 'N':
//   98                                 run_constant_angle_nag=0;
//   99                                 run_constant_angle_pos=0;
//  100                                 motor_run_nag=0;
//  101                                 motor_run_pos=1;
//  102                                 DM_start=0;
//  103                                 test_start=0;
//  104                                 MachineReset=0;
//  105                                 break;
//  106                         case 'S':
//  107                                 motor_stop=1;
//  108                                 break;
//  109                         case 'D':
//  110                                 DelayTimeChange=1;
//  111                                 break;
//  112                         case 'A':
//  113                                 run_constant_angle_nag=0;
//  114                                 run_constant_angle_pos=0;
//  115                                 motor_run_nag=0;
//  116                                 motor_run_pos=0;
//  117                                 DM_start=1;
//  118                                 test_start=0;
//  119                                 MachineReset=0;
//  120                                 break;  
//  121                         case 'B':
//  122                                 run_constant_angle_nag=0;
//  123                                 run_constant_angle_pos=0;
//  124                                 motor_run_nag=0;
//  125                                 motor_run_pos=0;
//  126                                 DM_start=0;
//  127                                 test_start=1;
//  128                                 MachineReset=0;
//  129                                 g_nMotorPulseSigma=0;
//  130                                 break;
//  131                         case 'R':
//  132                                 run_constant_angle_nag=0;
//  133                                 run_constant_angle_pos=0;
//  134                                 motor_run_nag=0;
//  135                                 motor_run_pos=0;
//  136                                 DM_start=0;
//  137                                 test_start=0;
//  138                                 MachineReset=1;
//  139                                 g_nMotorPulseSigma=0;
//  140                                 break; 
//  141                         default:
//  142                                 break;
//  143 		}
//  144 		if(dat == '.')
//  145 		{
//  146 			integer = 0;
??Command_analy_1:
        MOVS     R10,#+0
//  147 			i = 1;
        MOVS     R8,#+1
//  148 			str ++;
        ADDS     R9,R9,#+1
//  149 			continue;
//  150 		}
??Command_analy_0:
        LDRB     R0,[R9, #+0]
        CMP      R0,#+42
        BEQ.W    ??Command_analy_2
        LDRB     R0,[R9, #+0]
        CMP      R0,#+43
        BEQ.N    ??Command_analy_3
        CMP      R0,#+45
        BEQ.N    ??Command_analy_4
        CMP      R0,#+46
        BEQ.N    ??Command_analy_5
        CMP      R0,#+48
        BEQ.N    ??Command_analy_6
        CMP      R0,#+49
        BEQ.N    ??Command_analy_7
        CMP      R0,#+50
        BEQ.N    ??Command_analy_8
        CMP      R0,#+51
        BEQ.N    ??Command_analy_9
        CMP      R0,#+52
        BEQ.N    ??Command_analy_10
        CMP      R0,#+53
        BEQ.N    ??Command_analy_11
        CMP      R0,#+54
        BEQ.N    ??Command_analy_12
        CMP      R0,#+55
        BEQ.N    ??Command_analy_13
        CMP      R0,#+56
        BEQ.N    ??Command_analy_14
        CMP      R0,#+57
        BEQ.N    ??Command_analy_15
        CMP      R0,#+65
        BEQ.W    ??Command_analy_16
        CMP      R0,#+66
        BEQ.W    ??Command_analy_17
        CMP      R0,#+68
        BEQ.W    ??Command_analy_18
        CMP      R0,#+78
        BEQ.N    ??Command_analy_19
        CMP      R0,#+80
        BEQ.N    ??Command_analy_20
        CMP      R0,#+82
        BEQ.W    ??Command_analy_21
        CMP      R0,#+83
        BEQ.N    ??Command_analy_22
        B.N      ??Command_analy_23
??Command_analy_6:
        MOVS     R4,#+0
        MOVS     R5,#+0
        B.N      ??Command_analy_24
??Command_analy_7:
        MOVS     R4,#+0
        LDR.N    R5,??Command_analy_25  ;; 0x3ff00000
        B.N      ??Command_analy_24
??Command_analy_8:
        MOVS     R4,#+0
        MOVS     R5,#+1073741824
        B.N      ??Command_analy_24
??Command_analy_9:
        MOVS     R4,#+0
        LDR.N    R5,??Command_analy_25+0x4  ;; 0x40080000
        B.N      ??Command_analy_24
??Command_analy_10:
        MOVS     R4,#+0
        LDR.N    R5,??Command_analy_25+0x8  ;; 0x40100000
        B.N      ??Command_analy_24
??Command_analy_11:
        MOVS     R4,#+0
        LDR.N    R5,??Command_analy_25+0xC  ;; 0x40140000
        B.N      ??Command_analy_24
??Command_analy_12:
        MOVS     R4,#+0
        LDR.N    R5,??Command_analy_25+0x10  ;; 0x40180000
        B.N      ??Command_analy_24
??Command_analy_13:
        MOVS     R4,#+0
        LDR.N    R5,??Command_analy_25+0x14  ;; 0x401c0000
        B.N      ??Command_analy_24
??Command_analy_14:
        MOVS     R4,#+0
        LDR.N    R5,??Command_analy_25+0x18  ;; 0x40200000
        B.N      ??Command_analy_24
??Command_analy_15:
        MOVS     R4,#+0
        LDR.N    R5,??Command_analy_25+0x1C  ;; 0x40220000
        B.N      ??Command_analy_24
??Command_analy_5:
        MOVS     R4,#+0
        LDR.N    R5,??Command_analy_25+0x20  ;; 0x40470000
        B.N      ??Command_analy_24
??Command_analy_3:
        MOVS     R0,#+1
        LDR.N    R1,??Command_analy_25+0x24
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x28
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x2C
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x30
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x34
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x38
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x3C
        STRB     R0,[R1, #+0]
        B.N      ??Command_analy_24
??Command_analy_4:
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x24
        STRB     R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??Command_analy_25+0x28
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x2C
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x30
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x34
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x38
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x3C
        STRB     R0,[R1, #+0]
        B.N      ??Command_analy_24
??Command_analy_20:
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x24
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x28
        STRB     R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??Command_analy_25+0x2C
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x30
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x34
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x38
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x3C
        STRB     R0,[R1, #+0]
        B.N      ??Command_analy_24
??Command_analy_19:
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x24
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x28
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x2C
        STRB     R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??Command_analy_25+0x30
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x34
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x38
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x3C
        STRB     R0,[R1, #+0]
        B.N      ??Command_analy_24
??Command_analy_22:
        MOVS     R0,#+1
        LDR.N    R1,??Command_analy_25+0x40
        STRB     R0,[R1, #+0]
        B.N      ??Command_analy_24
??Command_analy_18:
        MOVS     R0,#+1
        LDR.N    R1,??Command_analy_25+0x44
        STRB     R0,[R1, #+0]
        B.N      ??Command_analy_24
??Command_analy_16:
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x24
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x28
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x2C
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x30
        STRB     R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??Command_analy_25+0x34
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x38
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x3C
        STRB     R0,[R1, #+0]
        B.N      ??Command_analy_24
??Command_analy_17:
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x24
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x28
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x2C
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x30
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x34
        STRB     R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??Command_analy_25+0x38
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x3C
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x48
        STRH     R0,[R1, #+0]
        B.N      ??Command_analy_24
??Command_analy_21:
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x24
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x28
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x2C
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x30
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x34
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x38
        STRB     R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??Command_analy_25+0x3C
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x48
        STRH     R0,[R1, #+0]
        B.N      ??Command_analy_24
??Command_analy_23:
??Command_analy_24:
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x20  ;; 0x40470000
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_cdcmpeq
        BEQ.W    ??Command_analy_1
//  151 		if( integer == 1 )
        CMP      R10,#+1
        BNE.N    ??Command_analy_26
//  152 		{
//  153 			rev = rev * 10 + dat;
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x4C  ;; 0x40240000
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R6,R0
        MOVS     R7,R1
        B.N      ??Command_analy_27
//  154 		}
//  155 		else
//  156 		{
//  157 			rev = rev + dat / (10 * i);
??Command_analy_26:
        MOVS     R0,#+10
        MUL      R0,R0,R8
        BL       __aeabi_i2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_ddiv
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dadd
        MOVS     R6,R0
        MOVS     R7,R1
//  158 			i = i * 10 ;
        MOVS     R0,#+10
        MUL      R8,R0,R8
//  159 		}
//  160 		str ++;
??Command_analy_27:
        ADDS     R9,R9,#+1
        B.N      ??Command_analy_0
//  161 	}
//  162         if((run_constant_angle_pos==1||run_constant_angle_nag==1)&&DM_start==0)
??Command_analy_2:
        LDR.N    R0,??Command_analy_25+0x28
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.N    ??Command_analy_28
        LDR.N    R0,??Command_analy_25+0x24
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??Command_analy_29
??Command_analy_28:
        LDR.N    R0,??Command_analy_25+0x34
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??Command_analy_29
//  163         {
//  164           enable_irq(63);
        MOVS     R0,#+63
        BL       enable_irq
//  165           FTM_Count=0; 
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x50
        STR      R0,[R1, #+0]
//  166         }
//  167 	constant_angle = rev;
??Command_analy_29:
        LDR.N    R0,??Command_analy_25+0x54
        STRD     R6,R7,[R0, #+0]
//  168         
//  169         //延时设置---
//  170         if(DelayTimeChange==1)
        LDR.N    R0,??Command_analy_25+0x44
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??Command_analy_30
//  171         {
//  172           DelayTimeChange=0;
        MOVS     R0,#+0
        LDR.N    R1,??Command_analy_25+0x44
        STRB     R0,[R1, #+0]
//  173           if(constant_angle>=0&&constant_angle<=100)
        LDR.N    R2,??Command_analy_25+0x54
        LDRD     R0,R1,[R2, #+0]
        MOVS     R2,#+0
        MOVS     R3,#+0
        BL       __aeabi_cdrcmple
        BHI.N    ??Command_analy_31
        LDR.N    R2,??Command_analy_25+0x54
        LDRD     R0,R1,[R2, #+0]
        MOVS     R2,#+1
        LDR.N    R3,??Command_analy_25+0x58  ;; 0x40590000
        BL       __aeabi_cdcmple
        BCS.N    ??Command_analy_31
//  174             base=100;
        MOVS     R0,#+100
        LDR.N    R1,??Command_analy_25+0x5C
        STRH     R0,[R1, #+0]
        B.N      ??Command_analy_30
//  175           else if(constant_angle>100&&constant_angle<=5000)
??Command_analy_31:
        LDR.N    R2,??Command_analy_25+0x54
        LDRD     R0,R1,[R2, #+0]
        MOVS     R2,#+1
        LDR.N    R3,??Command_analy_25+0x58  ;; 0x40590000
        BL       __aeabi_cdrcmple
        BHI.N    ??Command_analy_32
        LDR.N    R2,??Command_analy_25+0x54
        LDRD     R0,R1,[R2, #+0]
        MOVS     R2,#+1
        LDR.N    R3,??Command_analy_25+0x60  ;; 0x40b38800
        BL       __aeabi_cdcmple
        BCS.N    ??Command_analy_32
//  176             base=(uint16)constant_angle;
        LDR.N    R2,??Command_analy_25+0x54
        LDRD     R0,R1,[R2, #+0]
        BL       __aeabi_d2iz
        LDR.N    R1,??Command_analy_25+0x5C
        STRH     R0,[R1, #+0]
        B.N      ??Command_analy_30
//  177           else if(constant_angle>5000)
??Command_analy_32:
        LDR.N    R2,??Command_analy_25+0x54
        LDRD     R0,R1,[R2, #+0]
        MOVS     R2,#+1
        LDR.N    R3,??Command_analy_25+0x60  ;; 0x40b38800
        BL       __aeabi_cdrcmple
        BHI.N    ??Command_analy_30
//  178             base=5000;
        MOVW     R0,#+5000
        LDR.N    R1,??Command_analy_25+0x5C
        STRH     R0,[R1, #+0]
//  179         }
//  180         
//  181 }
??Command_analy_30:
        POP      {R4-R10,PC}      ;; return
        Nop      
        DATA
??Command_analy_25:
        DC32     0x3ff00000
        DC32     0x40080000
        DC32     0x40100000
        DC32     0x40140000
        DC32     0x40180000
        DC32     0x401c0000
        DC32     0x40200000
        DC32     0x40220000
        DC32     0x40470000
        DC32     run_constant_angle_nag
        DC32     run_constant_angle_pos
        DC32     motor_run_nag
        DC32     motor_run_pos
        DC32     DM_start
        DC32     test_start
        DC32     MachineReset
        DC32     motor_stop
        DC32     DelayTimeChange
        DC32     g_nMotorPulseSigma
        DC32     0x40240000
        DC32     FTM_Count
        DC32     constant_angle
        DC32     0x40590000
        DC32     base
        DC32     0x40b38800

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
//  20 bytes in section .bss
// 904 bytes in section .text
// 
// 904 bytes of CODE memory
//  20 bytes of DATA memory
//
//Errors: none
//Warnings: none
