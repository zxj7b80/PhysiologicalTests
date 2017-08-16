///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      10/Feb/2015  19:50:54 /
// IAR ANSI C/C++ Compiler V6.30.4.23288/W32 EVALUATION for ARM               /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  E:\��Ƭ��\K60\K60���İ�Դ����\03_LQ_uart_int\src\Source /
//                    s\C\Component_C\adc.c                                   /
//    Command line =  E:\��Ƭ��\K60\K60���İ�Դ����\03_LQ_uart_int\src\Source /
//                    s\C\Component_C\adc.c -D IAR -D TWR_K60N512 -lCN        /
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
//                    List\adc.s                                              /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME `adc`

        #define SHT_PROGBITS 0x1

        PUBLIC ADC_Config_Alt
        PUBLIC Master_Adc_Config
        PUBLIC hw_ad_ave
        PUBLIC hw_ad_mid
        PUBLIC hw_ad_once
        PUBLIC hw_adc_config_alt
        PUBLIC hw_adc_convertstart
        PUBLIC hw_adc_convertstop
        PUBLIC hw_adc_init

// E:\��Ƭ��\K60\K60���İ�Դ����\03_LQ_uart_int\src\Sources\C\Component_C\adc.c
//    1 #include "adc.h"
//    2 
//    3 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    4 tADC_Config   Master_Adc_Config;
Master_Adc_Config:
        DS8 16
//    5 //============================================================================
//    6 //�������ƣ�hw_adc_init
//    7 //�������أ�0 �ɹ� ��1 ʧ��
//    8 //����˵����MoudelNumber��ģ���
//    9 //���ܸ�Ҫ��AD��ʼ��
//   10 //============================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   11 uint8 hw_adc_init(int MoudelNumber)
//   12 {
//   13     if(MoudelNumber == 0)//ģ��0
hw_adc_init:
        CMP      R0,#+0
        BNE.N    ??hw_adc_init_0
//   14     {
//   15         SIM_SCGC6 |= (SIM_SCGC6_ADC0_MASK );
        LDR.N    R0,??DataTable3  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8000000
        LDR.N    R1,??DataTable3  ;; 0x4004803c
        STR      R0,[R1, #+0]
//   16 
//   17         SIM_SOPT7 &= ~(SIM_SOPT7_ADC0ALTTRGEN_MASK  |
//   18                       SIM_SOPT7_ADC0PRETRGSEL_MASK);
        LDR.N    R0,??DataTable3_1  ;; 0x40048018
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x90
        LDR.N    R1,??DataTable3_1  ;; 0x40048018
        STR      R0,[R1, #+0]
//   19         SIM_SOPT7 = SIM_SOPT7_ADC0TRGSEL(0);
        LDR.N    R0,??DataTable3_1  ;; 0x40048018
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   20     }
//   21     else if(MoudelNumber == 1)//ģ��1
//   22     {      
//   23         SIM_SCGC3 |= (SIM_SCGC3_ADC1_MASK );
//   24 
//   25         SIM_SOPT7 &= ~(SIM_SOPT7_ADC1ALTTRGEN_MASK  |
//   26                       SIM_SOPT7_ADC1PRETRGSEL_MASK) ;
//   27         SIM_SOPT7 = SIM_SOPT7_ADC1TRGSEL(0);
//   28     }
//   29     else
//   30     {
//   31         return 0;
//   32     }
//   33     
//   34     return 1;
??hw_adc_init_1:
        MOVS     R0,#+1
??hw_adc_init_2:
        BX       LR               ;; return
??hw_adc_init_0:
        CMP      R0,#+1
        BNE.N    ??hw_adc_init_3
        LDR.N    R0,??DataTable3_2  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8000000
        LDR.N    R1,??DataTable3_2  ;; 0x40048030
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable3_1  ;; 0x40048018
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x9000
        LDR.N    R1,??DataTable3_1  ;; 0x40048018
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable3_1  ;; 0x40048018
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        B.N      ??hw_adc_init_1
??hw_adc_init_3:
        MOVS     R0,#+0
        B.N      ??hw_adc_init_2
//   35 }
//   36 
//   37 
//   38 
//   39 //============================================================================
//   40 //�������ƣ�hw_ad_once
//   41 //�������أ��޷��Ž��ֵ(��Χ:0-4095) 
//   42 //����˵����MoudelNumber��ģ���
//   43 //               Channel��ͨ����
//   44 //              accuracy������
//   45 //���ܸ�Ҫ���ɼ�һ��һ·ģ������ADֵ    
//   46 //============================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   47 uint16 hw_ad_once(int MoudelNumber,int Channel,uint8 accuracy)//�ɼ�ĳ·ģ������ADֵ
//   48 {
hw_ad_once:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
//   49     uint16 result = 0;
        MOVS     R4,#+0
//   50     //��ʼADCת��
//   51     hw_adc_convertstart(MoudelNumber, Channel, accuracy);	
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R0,R5
        BL       hw_adc_convertstart
//   52 
//   53     if(MoudelNumber == 0)
        CMP      R5,#+0
        BNE.N    ??hw_ad_once_0
//   54     {
//   55         while (( ADC0_SC1A & ADC_SC1_COCO_MASK ) != ADC_SC1_COCO_MASK)
??hw_ad_once_1:
        LDR.N    R0,??DataTable3_3  ;; 0x4003b000
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??hw_ad_once_1
//   56         {
//   57 
//   58         }
//   59         result = ADC0_RA;        
        LDR.N    R0,??DataTable3_4  ;; 0x4003b010
        LDR      R4,[R0, #+0]
//   60         ADC0_SC1A &= ~ADC_SC1_COCO_MASK;
        LDR.N    R0,??DataTable3_3  ;; 0x4003b000
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x80
        LDR.N    R1,??DataTable3_3  ;; 0x4003b000
        STR      R0,[R1, #+0]
        B.N      ??hw_ad_once_2
//   61     }
//   62     else
//   63     {
//   64         while (( ADC1_SC1A & ADC_SC1_COCO_MASK ) != ADC_SC1_COCO_MASK)
??hw_ad_once_0:
        LDR.N    R0,??DataTable3_5  ;; 0x400bb000
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??hw_ad_once_0
//   65         {
//   66 
//   67         }
//   68         result = ADC1_RA;        
        LDR.N    R0,??DataTable3_6  ;; 0x400bb010
        LDR      R4,[R0, #+0]
//   69         ADC1_SC1A &= ~ADC_SC1_COCO_MASK;
        LDR.N    R0,??DataTable3_5  ;; 0x400bb000
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x80
        LDR.N    R1,??DataTable3_5  ;; 0x400bb000
        STR      R0,[R1, #+0]
//   70     }
//   71 
//   72     return result;
??hw_ad_once_2:
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R1,R4,R5,PC}    ;; return
//   73 }
//   74 
//   75 //============================================================================
//   76 //�������ƣ�hw_ad_mid
//   77 //�������أ��޷��Ž��ֵ(��Χ:0-4095) 
//   78 //����˵����MoudelNumber��ģ���
//   79 //               Channel��ͨ����
//   80 //              accuracy������
//   81 //���ܸ�Ҫ����ֵ�˲���Ľ��(��Χ:0-4095) 
//   82 //============================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   83 uint16 hw_ad_mid(int MoudelNumber,int Channel,uint8 accuracy) //��ֵ�˲�
//   84 {
hw_ad_mid:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//   85 	uint16 i,j,k,tmp;
//   86 	//1.ȡ3��A/Dת�����
//   87 	i = hw_ad_once(MoudelNumber,Channel,accuracy);
        MOVS     R2,R6
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        MOVS     R0,R4
        BL       hw_ad_once
        MOVS     R7,R0
//   88 	j = hw_ad_once(MoudelNumber,Channel,accuracy);
        MOVS     R2,R6
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        MOVS     R0,R4
        BL       hw_ad_once
        MOV      R8,R0
//   89 	k = hw_ad_once(MoudelNumber,Channel,accuracy);
        MOVS     R2,R6
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        MOVS     R0,R4
        BL       hw_ad_once
        MOVS     R1,R0
//   90 	//2.ȡ��ֵ
//   91 	if (i > j)
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R8,R7
        BCS.N    ??hw_ad_mid_0
//   92 	{
//   93 		tmp = i; i = j; j = tmp;
        MOVS     R0,R7
        MOV      R7,R8
        MOV      R8,R0
//   94 	}
//   95 	if (k > j) 
??hw_ad_mid_0:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R8,R1
        BCS.N    ??hw_ad_mid_1
//   96 	  tmp = j;
        MOV      R0,R8
        B.N      ??hw_ad_mid_2
//   97 	else if(k > i) 
??hw_ad_mid_1:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R7,R1
        BCS.N    ??hw_ad_mid_3
//   98 	  tmp = k; 
        MOVS     R0,R1
        B.N      ??hw_ad_mid_2
//   99     else 
//  100       tmp = i;
??hw_ad_mid_3:
        MOVS     R0,R7
//  101 	return tmp;
??hw_ad_mid_2:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R4-R8,PC}       ;; return
//  102 }
//  103 
//  104 //============================================================================
//  105 //�������ƣ�hw_ad_ave
//  106 //�������أ��޷��Ž��ֵ(��Χ:0-4095) 
//  107 //����˵����MoudelNumber��ģ���
//  108 //               Channel��ͨ����
//  109 //              accuracy������
//  110 //                     N:��ֵ�˲�����(��Χ:0~255)
//  111 //���ܸ�Ҫ����ֵ�˲���ĽǶȽ��(��Χ:0-4095) 
//  112 //============================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  113 uint16 hw_ad_ave(int MoudelNumber,int Channel,uint8 accuracy,uint8 N) //��ֵ�˲�
//  114 {
hw_ad_ave:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
//  115 	uint32 tmp = 0;
        MOVS     R8,#+0
//  116 	uint8  i;
//  117     for(i = 0; i < N; i++)
        MOVS     R9,#+0
        B.N      ??hw_ad_ave_0
//  118 		tmp += hw_ad_mid(MoudelNumber,Channel,accuracy);
??hw_ad_ave_1:
        MOVS     R2,R6
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        MOVS     R0,R4
        BL       hw_ad_mid
        UXTAH    R8,R8,R0
        ADDS     R9,R9,#+1
??hw_ad_ave_0:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R9,R7
        BCC.N    ??hw_ad_ave_1
//  119 	tmp = tmp / N; 
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UDIV     R8,R8,R7
//  120     return (uint16)tmp;
        MOV      R0,R8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R1,R4-R9,PC}    ;; return
//  121 }
//  122 //============================================================================
//  123 //��������:hw_angle_convert()
//  124 //��������:�޷��Ž��ֵ
//  125 //����˵��:
//  126 //���ܸ�Ҫ:�Ƕ�ת��
//  127 //============================================================================
//  128 /*void Angle_convert()
//  129 {
//  130   float Rz, Angle;                            //Ҫ����Ϊȫ�ֱ���
//  131   Rz=180/(Z_MAX-Z_MIN);                       //��ʵ����Z_MAX,Z_MIN
//  132   g_fGravityAngle=Rz*(hw_ad_ave(int MoudelNumber,int Channel,uint8 accuracy,uint8 N)-C_ANGLE);
//  133   return  g_fGravityAngle;
//  134 }*/
//  135 
//  136 
//  137 //============================================================================
//  138 //�������ƣ�hw_Angleconvert()
//  139 //�������أ��޷��Ž��ֵ(��Χ:0-4095) 
//  140 //����˵����
//  141 //���ܸ�Ҫ���Ƕ�ת��(��Χ:0-4095) 
//  142 //============================================================================
//  143 /*void hw_AngleSpeedconvert(void)
//  144 {
//  145   float AngleSpeed;
//  146   //Rgyro=Rad/(Rg*K)
//  147   AngleSpeed=R_GYRO*(hw_ad_ave(int MoudelNumber,int Channel,uint8 accuracy,uint8 N)-GYROSCOPE_OFFSET);
//  148   return AngleSpeed;
//  149 }*/
//  150 //============================================================================
//  151 //�������ƣ�hw_adc_convertstart
//  152 //�������أ�0 �ɹ� ��1 ʧ��
//  153 //����˵����MoudelNumber��ģ���
//  154 //               Channel��ͨ����
//  155 //              accuracy������
//  156 //���ܸ�Ҫ����ʼadcת��
//  157 //============================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  158 uint8 hw_adc_convertstart(int MoudelNumber,int Channel,uint8 accuracy)
//  159 {
hw_adc_convertstart:
        PUSH     {R4,LR}
        MOVS     R4,R1
//  160     uint8 ADCCfg1Mode = 0;
        MOVS     R1,#+0
//  161     
//  162     switch(accuracy)
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+8
        BEQ.N    ??hw_adc_convertstart_0
        CMP      R2,#+10
        BEQ.N    ??hw_adc_convertstart_1
        CMP      R2,#+12
        BEQ.N    ??hw_adc_convertstart_2
        CMP      R2,#+16
        BEQ.N    ??hw_adc_convertstart_3
        B.N      ??hw_adc_convertstart_4
//  163     {
//  164       case 8:
//  165         ADCCfg1Mode = 0x00;
??hw_adc_convertstart_0:
        MOVS     R1,#+0
//  166         break;
        B.N      ??hw_adc_convertstart_5
//  167       case 12:
//  168         ADCCfg1Mode = 0x01;
??hw_adc_convertstart_2:
        MOVS     R1,#+1
//  169         break;
        B.N      ??hw_adc_convertstart_5
//  170       case 10:
//  171         ADCCfg1Mode = 0x02;
??hw_adc_convertstart_1:
        MOVS     R1,#+2
//  172         break;
        B.N      ??hw_adc_convertstart_5
//  173       case 16:
//  174         ADCCfg1Mode = 0x03;
??hw_adc_convertstart_3:
        MOVS     R1,#+3
//  175         break;
        B.N      ??hw_adc_convertstart_5
//  176       default:
//  177         ADCCfg1Mode = 0x00;
??hw_adc_convertstart_4:
        MOVS     R1,#+0
//  178     }
//  179     
//  180   
//  181     //��ʼ��ADCĬ������
//  182     Master_Adc_Config.CONFIG1  = ADLPC_NORMAL
//  183                               | ADC_CFG1_ADIV(ADIV_4)
//  184                               | ADLSMP_LONG
//  185                               | ADC_CFG1_MODE(ADCCfg1Mode)
//  186                               | ADC_CFG1_ADICLK(ADICLK_BUS);
??hw_adc_convertstart_5:
        LSLS     R1,R1,#+2
        ANDS     R1,R1,#0xC
        ORRS     R1,R1,#0x50
        LDR.N    R2,??DataTable3_7
        STRB     R1,[R2, #+0]
//  187     Master_Adc_Config.CONFIG2  = MUXSEL_ADCA
//  188                               | ADACKEN_DISABLED
//  189                               | ADHSC_HISPEED
//  190                               | ADC_CFG2_ADLSTS(ADLSTS_20) ;
        LDR.N    R1,??DataTable3_7
        MOVS     R2,#+4
        STRB     R2,[R1, #+1]
//  191     Master_Adc_Config.COMPARE1 = 0x1234u ;                 //����ֵ
        LDR.N    R1,??DataTable3_7
        MOVW     R2,#+4660
        STRH     R2,[R1, #+2]
//  192     Master_Adc_Config.COMPARE2 = 0x5678u ;                 //����ֵ
        LDR.N    R1,??DataTable3_7
        MOVW     R2,#+22136
        STRH     R2,[R1, #+4]
//  193                                                           
//  194     
//  195     if(MoudelNumber == 0)
        CMP      R0,#+0
        BNE.N    ??hw_adc_convertstart_6
//  196     {
//  197         if(Channel<=3)
        CMP      R4,#+4
        BGE.N    ??hw_adc_convertstart_7
//  198         {
//  199             Master_Adc_Config.STATUS1A = AIEN_ON | DIFF_SINGLE | ADC_SC1_ADCH(Channel);
        ANDS     R0,R4,#0x1F
        ORRS     R0,R0,#0x40
        LDR.N    R1,??DataTable3_7
        STRB     R0,[R1, #+8]
//  200             hw_adc_config_alt(ADC0_BASE_PTR, &Master_Adc_Config);  // ���� ADC0
        LDR.N    R1,??DataTable3_7
        LDR.N    R0,??DataTable3_3  ;; 0x4003b000
        BL       hw_adc_config_alt
//  201         }
//  202         
//  203         else if(Channel>3&&Channel<24)                             //4~23 ʹ�� ADC0
//  204         {
//  205             Master_Adc_Config.STATUS1A = AIEN_ON | DIFF_SINGLE | ADC_SC1_ADCH(Channel);
//  206             hw_adc_config_alt(ADC0_BASE_PTR, &Master_Adc_Config);  // ���� ADC0
//  207         }
//  208         else if(Channel == 26)
//  209         {
//  210             Master_Adc_Config.STATUS1A = AIEN_ON | DIFF_SINGLE | ADC_SC1_ADCH(Channel);
//  211             hw_adc_config_alt(ADC0_BASE_PTR, &Master_Adc_Config);  // ����ADC0
//  212         }
//  213         else
//  214         {
//  215             return 0;
//  216         }
//  217     }
//  218     else
//  219     {
//  220         if(Channel<=3)
//  221         {
//  222             Master_Adc_Config.STATUS1A = AIEN_ON | DIFF_SINGLE | ADC_SC1_ADCH(Channel);
//  223             hw_adc_config_alt(ADC0_BASE_PTR, &Master_Adc_Config);  // ���� ADC0
//  224         }
//  225         
//  226         if(Channel>3&&Channel<24)                             //4~23 ʹ�� ADC1
//  227         {
//  228             Master_Adc_Config.STATUS1A = AIEN_ON | DIFF_SINGLE | ADC_SC1_ADCH(Channel);
//  229             hw_adc_config_alt(ADC1_BASE_PTR, &Master_Adc_Config);  // ����ADC1
//  230         }
//  231         else if(Channel == 26)
//  232         {
//  233             Master_Adc_Config.STATUS1A = AIEN_ON | DIFF_SINGLE | ADC_SC1_ADCH(Channel);
//  234             hw_adc_config_alt(ADC1_BASE_PTR, &Master_Adc_Config);  // ����ADC1
//  235         }
//  236         else
//  237         {
//  238             return 0;
//  239         }
//  240     }
//  241     return 1;
??hw_adc_convertstart_8:
        MOVS     R0,#+1
??hw_adc_convertstart_9:
        POP      {R4,PC}          ;; return
??hw_adc_convertstart_7:
        SUBS     R0,R4,#+4
        CMP      R0,#+20
        BCS.N    ??hw_adc_convertstart_10
        ANDS     R0,R4,#0x1F
        ORRS     R0,R0,#0x40
        LDR.N    R1,??DataTable3_7
        STRB     R0,[R1, #+8]
        LDR.N    R1,??DataTable3_7
        LDR.N    R0,??DataTable3_3  ;; 0x4003b000
        BL       hw_adc_config_alt
        B.N      ??hw_adc_convertstart_8
??hw_adc_convertstart_10:
        CMP      R4,#+26
        BNE.N    ??hw_adc_convertstart_11
        ANDS     R0,R4,#0x1F
        ORRS     R0,R0,#0x40
        LDR.N    R1,??DataTable3_7
        STRB     R0,[R1, #+8]
        LDR.N    R1,??DataTable3_7
        LDR.N    R0,??DataTable3_3  ;; 0x4003b000
        BL       hw_adc_config_alt
        B.N      ??hw_adc_convertstart_8
??hw_adc_convertstart_11:
        MOVS     R0,#+0
        B.N      ??hw_adc_convertstart_9
??hw_adc_convertstart_6:
        CMP      R4,#+4
        BGE.N    ??hw_adc_convertstart_12
        ANDS     R0,R4,#0x1F
        ORRS     R0,R0,#0x40
        LDR.N    R1,??DataTable3_7
        STRB     R0,[R1, #+8]
        LDR.N    R1,??DataTable3_7
        LDR.N    R0,??DataTable3_3  ;; 0x4003b000
        BL       hw_adc_config_alt
??hw_adc_convertstart_12:
        SUBS     R0,R4,#+4
        CMP      R0,#+20
        BCS.N    ??hw_adc_convertstart_13
        ANDS     R0,R4,#0x1F
        ORRS     R0,R0,#0x40
        LDR.N    R1,??DataTable3_7
        STRB     R0,[R1, #+8]
        LDR.N    R1,??DataTable3_7
        LDR.N    R0,??DataTable3_5  ;; 0x400bb000
        BL       hw_adc_config_alt
        B.N      ??hw_adc_convertstart_8
??hw_adc_convertstart_13:
        CMP      R4,#+26
        BNE.N    ??hw_adc_convertstart_14
        ANDS     R0,R4,#0x1F
        ORRS     R0,R0,#0x40
        LDR.N    R1,??DataTable3_7
        STRB     R0,[R1, #+8]
        LDR.N    R1,??DataTable3_7
        LDR.N    R0,??DataTable3_5  ;; 0x400bb000
        BL       hw_adc_config_alt
        B.N      ??hw_adc_convertstart_8
??hw_adc_convertstart_14:
        MOVS     R0,#+0
        B.N      ??hw_adc_convertstart_9
//  242 }
//  243 //============================================================================
//  244 //�������ƣ�hw_adc_config_alt
//  245 //�������أ��޷��Ž��ֵ(��Χ:0-4095) 
//  246 //����˵����adcmap��adc��ַ�Ĵ�����ַ
//  247 //          ADC_CfgPtr: ��� �Ĵ���ֵ�Ľṹ��    
//  248 //���ܸ�Ҫ����adc�Ĵ����ṹ�����ý�adc�Ĵ��� 
//  249 //============================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  250 void ADC_Config_Alt(ADC_MemMapPtr adcmap, tADC_ConfigPtr ADC_CfgPtr)
//  251 {
//  252     ADC_CFG1_REG(adcmap) = ADC_CfgPtr->CONFIG1;
ADC_Config_Alt:
        LDRB     R2,[R1, #+0]
        STR      R2,[R0, #+8]
//  253     ADC_CFG2_REG(adcmap) = ADC_CfgPtr->CONFIG2;
        LDRB     R2,[R1, #+1]
        STR      R2,[R0, #+12]
//  254     ADC_CV1_REG(adcmap)  = ADC_CfgPtr->COMPARE1; 
        LDRH     R2,[R1, #+2]
        STR      R2,[R0, #+24]
//  255     ADC_CV2_REG(adcmap)  = ADC_CfgPtr->COMPARE2;
        LDRH     R2,[R1, #+4]
        STR      R2,[R0, #+28]
//  256     ADC_SC2_REG(adcmap)  = ADC_CfgPtr->STATUS2;
        LDRB     R2,[R1, #+6]
        STR      R2,[R0, #+32]
//  257     ADC_SC3_REG(adcmap)  = ADC_CfgPtr->STATUS3;
        LDRB     R2,[R1, #+7]
        STR      R2,[R0, #+36]
//  258     ADC_PGA_REG(adcmap)  = ADC_CfgPtr->PGA;
        LDR      R2,[R1, #+12]
        STR      R2,[R0, #+80]
//  259     ADC_SC1_REG(adcmap,A)= ADC_CfgPtr->STATUS1A;       
        LDRB     R2,[R1, #+8]
        STR      R2,[R0, #+0]
//  260     ADC_SC1_REG(adcmap,B)= ADC_CfgPtr->STATUS1B;
        LDRB     R1,[R1, #+9]
        STR      R1,[R0, #+4]
//  261 }
        BX       LR               ;; return
//  262 
//  263 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  264 void hw_adc_config_alt(ADC_MemMapPtr adcmap, tADC_ConfigPtr ADC_CfgPtr)
//  265 {
//  266     ADC_CFG1_REG(adcmap) = ADC_CfgPtr->CONFIG1;
hw_adc_config_alt:
        LDRB     R2,[R1, #+0]
        STR      R2,[R0, #+8]
//  267     ADC_CFG2_REG(adcmap) = ADC_CfgPtr->CONFIG2;
        LDRB     R2,[R1, #+1]
        STR      R2,[R0, #+12]
//  268     ADC_CV1_REG(adcmap)  = ADC_CfgPtr->COMPARE1; 
        LDRH     R2,[R1, #+2]
        STR      R2,[R0, #+24]
//  269     ADC_CV2_REG(adcmap)  = ADC_CfgPtr->COMPARE2;
        LDRH     R2,[R1, #+4]
        STR      R2,[R0, #+28]
//  270     ADC_SC2_REG(adcmap)  = ADC_CfgPtr->STATUS2;
        LDRB     R2,[R1, #+6]
        STR      R2,[R0, #+32]
//  271     ADC_SC3_REG(adcmap)  = ADC_CfgPtr->STATUS3;
        LDRB     R2,[R1, #+7]
        STR      R2,[R0, #+36]
//  272     ADC_PGA_REG(adcmap)  = ADC_CfgPtr->PGA;
        LDR      R2,[R1, #+12]
        STR      R2,[R0, #+80]
//  273     ADC_SC1_REG(adcmap,A)= ADC_CfgPtr->STATUS1A;       
        LDRB     R2,[R1, #+8]
        STR      R2,[R0, #+0]
//  274     ADC_SC1_REG(adcmap,B)= ADC_CfgPtr->STATUS1B;
        LDRB     R1,[R1, #+9]
        STR      R1,[R0, #+4]
//  275 }
        BX       LR               ;; return
//  276 
//  277 //============================================================================
//  278 //�������ƣ�hw_adc_convertstop
//  279 //�������أ�0 �ɹ� ��1 ʧ��
//  280 //����˵����MoudelNumber��ģ���
//  281 //               Channel��ͨ����
//  282 //���ܸ�Ҫ��ֹͣADCת��  
//  283 //============================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  284 uint8 hw_adc_convertstop(int MoudelNumber,int Channel)
//  285 {
hw_adc_convertstop:
        PUSH     {R7,LR}
//  286     if(MoudelNumber == 0)
        CMP      R0,#+0
        BNE.N    ??hw_adc_convertstop_0
//  287     {
//  288         if(Channel>3&&Channel<24)                             //4~23 ʹ�� ADC0
        SUBS     R0,R1,#+4
        CMP      R0,#+20
        BCS.N    ??hw_adc_convertstop_1
//  289         {
//  290             Master_Adc_Config.STATUS1A = AIEN_ON | DIFF_SINGLE | ADC_SC1_ADCH(0x1F);
        LDR.N    R0,??DataTable3_7
        MOVS     R1,#+95
        STRB     R1,[R0, #+8]
//  291             ADC_Config_Alt(ADC0_BASE_PTR, &Master_Adc_Config);  // ����ADC0
        LDR.N    R1,??DataTable3_7
        LDR.N    R0,??DataTable3_3  ;; 0x4003b000
        BL       ADC_Config_Alt
//  292         }
//  293         else if(Channel == 26)
//  294         {
//  295             Master_Adc_Config.STATUS1A = AIEN_ON | DIFF_SINGLE | ADC_SC1_ADCH(0x1F);
//  296             ADC_Config_Alt(ADC0_BASE_PTR, &Master_Adc_Config);  // ����ADC0
//  297         }
//  298         else
//  299         {
//  300             return 0;
//  301         }
//  302     }
//  303     else if(MoudelNumber == 1)
//  304     {
//  305         if(Channel>3&&Channel<24)                             //4~23 ʹ�� ADC1
//  306         {
//  307             Master_Adc_Config.STATUS1A = AIEN_ON | DIFF_SINGLE | ADC_SC1_ADCH(0x1F);
//  308             ADC_Config_Alt(ADC1_BASE_PTR, &Master_Adc_Config);  //  ����ADC1
//  309         }
//  310         else if(Channel == 26)
//  311         {
//  312             Master_Adc_Config.STATUS1A = AIEN_ON | DIFF_SINGLE | ADC_SC1_ADCH(0x1F);
//  313             ADC_Config_Alt(ADC1_BASE_PTR, &Master_Adc_Config);  //  ����ADC1
//  314         }
//  315         else
//  316         {
//  317             return 0;
//  318         }
//  319     }
//  320     else
//  321     {
//  322         return 0;
//  323     }
//  324     return 1;
??hw_adc_convertstop_2:
        MOVS     R0,#+1
??hw_adc_convertstop_3:
        POP      {R1,PC}          ;; return
??hw_adc_convertstop_1:
        CMP      R1,#+26
        BNE.N    ??hw_adc_convertstop_4
        LDR.N    R0,??DataTable3_7
        MOVS     R1,#+95
        STRB     R1,[R0, #+8]
        LDR.N    R1,??DataTable3_7
        LDR.N    R0,??DataTable3_3  ;; 0x4003b000
        BL       ADC_Config_Alt
        B.N      ??hw_adc_convertstop_2
??hw_adc_convertstop_4:
        MOVS     R0,#+0
        B.N      ??hw_adc_convertstop_3
??hw_adc_convertstop_0:
        CMP      R0,#+1
        BNE.N    ??hw_adc_convertstop_5
        SUBS     R0,R1,#+4
        CMP      R0,#+20
        BCS.N    ??hw_adc_convertstop_6
        LDR.N    R0,??DataTable3_7
        MOVS     R1,#+95
        STRB     R1,[R0, #+8]
        LDR.N    R1,??DataTable3_7
        LDR.N    R0,??DataTable3_5  ;; 0x400bb000
        BL       ADC_Config_Alt
        B.N      ??hw_adc_convertstop_2
??hw_adc_convertstop_6:
        CMP      R1,#+26
        BNE.N    ??hw_adc_convertstop_7
        LDR.N    R0,??DataTable3_7
        MOVS     R1,#+95
        STRB     R1,[R0, #+8]
        LDR.N    R1,??DataTable3_7
        LDR.N    R0,??DataTable3_5  ;; 0x400bb000
        BL       ADC_Config_Alt
        B.N      ??hw_adc_convertstop_2
??hw_adc_convertstop_7:
        MOVS     R0,#+0
        B.N      ??hw_adc_convertstop_3
??hw_adc_convertstop_5:
        MOVS     R0,#+0
        B.N      ??hw_adc_convertstop_3
//  325 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0x40048018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0x40048030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x4003b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     0x4003b010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     0x400bb000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     0x400bb010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     Master_Adc_Config

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
//  16 bytes in section .bss
// 788 bytes in section .text
// 
// 788 bytes of CODE memory
//  16 bytes of DATA memory
//
//Errors: none
//Warnings: none
