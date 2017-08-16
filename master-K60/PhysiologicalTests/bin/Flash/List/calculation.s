///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      10/Feb/2015  19:51:52 /
// IAR ANSI C/C++ Compiler V6.30.4.23288/W32 EVALUATION for ARM               /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  E:\��Ƭ��\K60\K60���İ�Դ����\03_LQ_uart_int\src\Source /
//                    s\C\Component_C\calculation.c                           /
//    Command line =  E:\��Ƭ��\K60\K60���İ�Դ����\03_LQ_uart_int\src\Source /
//                    s\C\Component_C\calculation.c -D IAR -D TWR_K60N512     /
//                    -lCN E:\��Ƭ��\K60\K60���İ�Դ����\03_LQ_uart_int\bin\F /
//                    lash\List\ -lB E:\��Ƭ��\K60\K60���İ�Դ����\03_LQ_uart /
//                    _int\bin\Flash\List\ -o E:\��Ƭ��\K60\K60���İ�Դ����\0 /
//                    3_LQ_uart_int\bin\Flash\Obj\ --no_cse --no_unroll       /
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
//                    List\calculation.s                                      /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME calculation

        #define SHT_PROGBITS 0x1

        EXTERN CLK_ClrVal
        EXTERN CLK_SetVal
        EXTERN Pixel
        EXTERN SI_ClrVal
        EXTERN SI_SetVal
        EXTERN gpio_init
        EXTERN hw_ad_once
        EXTERN hw_adc_init
        EXTERN uart_send1

        PUBLIC CCD_init
        PUBLIC CalculateIntegrationTime
        PUBLIC ImageCapture
        PUBLIC IntegrationTime
        PUBLIC PixelAverage
        PUBLIC PixelAverageValue
        PUBLIC PixelAverageVoltage
        PUBLIC PixelAverageVoltageError
        PUBLIC SamplingDelay
        PUBLIC SendHex
        PUBLIC SendImageData
        PUBLIC StartIntegration
        PUBLIC TargetPixelAverageVoltage
        PUBLIC TargetPixelAverageVoltageAllowError

// E:\��Ƭ��\K60\K60���İ�Դ����\03_LQ_uart_int\src\Sources\C\Component_C\calculation.c
//    1 
//    2 #include "includes.h"
//    3 
//    4 /************************************************************************
//    5 *                             ������ӹ�����
//    6 *
//    7 *  �������ƣ�CCD_init
//    8 *  ����˵����CCD��ʼ��
//    9 *  ����˵����
//   10 *  �������أ���
//   11 *  �޸�ʱ�䣺2012-10-20
//   12 *  ��    ע��
//   13 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   14 void CCD_init(void)
//   15 {
CCD_init:
        PUSH     {R7,LR}
//   16   gpio_init (PORTE , 0, 1,1);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+0
        LDR.N    R0,??DataTable3  ;; 0x400ff100
        BL       gpio_init
//   17   gpio_init (PORTE , 1, 1,1);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+1
        LDR.N    R0,??DataTable3  ;; 0x400ff100
        BL       gpio_init
//   18   hw_adc_init(1) ;
        MOVS     R0,#+1
        BL       hw_adc_init
//   19   
//   20 }
        POP      {R0,PC}          ;; return
//   21 
//   22 /*************************************************************************
//   23 *                           ������ӹ�����
//   24 *
//   25 *  �������ƣ�StartIntegration
//   26 *  ����˵����CCD��������
//   27 *  ����˵����
//   28 *  �������أ���
//   29 *  �޸�ʱ�䣺2012-10-20
//   30 *  ��    ע��
//   31 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   32 void StartIntegration(void) 
//   33 {
StartIntegration:
        PUSH     {R4,LR}
//   34 
//   35     unsigned char i;
//   36 
//   37     SI_SetVal();            /* SI  = 1 */
        BL       SI_SetVal
//   38     SamplingDelay();
        BL       SamplingDelay
//   39     CLK_SetVal();           /* CLK = 1 */
        BL       CLK_SetVal
//   40     SamplingDelay();
        BL       SamplingDelay
//   41     SI_ClrVal();            /* SI  = 0 */
        BL       SI_ClrVal
//   42     SamplingDelay();
        BL       SamplingDelay
//   43     CLK_ClrVal();           /* CLK = 0 */
        BL       CLK_ClrVal
//   44 
//   45     for(i=0; i<127; i++) 
        MOVS     R4,#+0
        B.N      ??StartIntegration_0
//   46     {
//   47         SamplingDelay();
??StartIntegration_1:
        BL       SamplingDelay
//   48         SamplingDelay();
        BL       SamplingDelay
//   49         CLK_SetVal();       /* CLK = 1 */
        BL       CLK_SetVal
//   50         SamplingDelay();
        BL       SamplingDelay
//   51         SamplingDelay();
        BL       SamplingDelay
//   52         CLK_ClrVal();       /* CLK = 0 */
        BL       CLK_ClrVal
//   53     }
        ADDS     R4,R4,#+1
??StartIntegration_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+127
        BCC.N    ??StartIntegration_1
//   54     SamplingDelay();
        BL       SamplingDelay
//   55     SamplingDelay();
        BL       SamplingDelay
//   56     CLK_SetVal();           /* CLK = 1 */
        BL       CLK_SetVal
//   57     SamplingDelay();
        BL       SamplingDelay
//   58     SamplingDelay();
        BL       SamplingDelay
//   59     CLK_ClrVal();           /* CLK = 0 */
        BL       CLK_ClrVal
//   60 }
        POP      {R4,PC}          ;; return
//   61 
//   62 
//   63 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   64 void ImageCapture(unsigned char * ImageData)        //*ImageData =  ad_once(ADC1, AD6a, ADC_8bit);
//   65 {
ImageCapture:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//   66 
//   67     unsigned char i;
//   68     extern uint8 AtemP ;
//   69 
//   70     SI_SetVal();            /* SI  = 1 */
        BL       SI_SetVal
//   71     SamplingDelay();
        BL       SamplingDelay
//   72     CLK_SetVal();           /* CLK = 1 */
        BL       CLK_SetVal
//   73     SamplingDelay();
        BL       SamplingDelay
//   74     SI_ClrVal();            /* SI  = 0 */
        BL       SI_ClrVal
//   75     SamplingDelay();
        BL       SamplingDelay
//   76 
//   77    
//   78 //Delay 10us for sample the first pixel
//   79     for(i = 0; i < 50; i++) 
        MOVS     R5,#+0
        B.N      ??ImageCapture_0
//   80     {
//   81       SamplingDelay() ;  //200ns
??ImageCapture_1:
        BL       SamplingDelay
//   82     }
        ADDS     R5,R5,#+1
??ImageCapture_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+50
        BCC.N    ??ImageCapture_1
//   83 
//   84 
//   85 //Sampling Pixel 1
//   86     *ImageData =  hw_ad_once(1, 6, 8);
        MOVS     R2,#+8
        MOVS     R1,#+6
        MOVS     R0,#+1
        BL       hw_ad_once
        STRB     R0,[R4, #+0]
//   87     ImageData ++ ;
        ADDS     R4,R4,#+1
//   88     CLK_ClrVal();           /* CLK = 0 */
        BL       CLK_ClrVal
//   89 
//   90     for(i=0; i<127; i++) 
        MOVS     R5,#+0
        B.N      ??ImageCapture_2
//   91     {
//   92         SamplingDelay();
??ImageCapture_3:
        BL       SamplingDelay
//   93         SamplingDelay();
        BL       SamplingDelay
//   94         CLK_SetVal();       /* CLK = 1 */
        BL       CLK_SetVal
//   95         SamplingDelay();
        BL       SamplingDelay
//   96         SamplingDelay();
        BL       SamplingDelay
//   97         //Sampling Pixel 2~128
//   98 
//   99        *ImageData =  hw_ad_once(1, 6, 8);
        MOVS     R2,#+8
        MOVS     R1,#+6
        MOVS     R0,#+1
        BL       hw_ad_once
        STRB     R0,[R4, #+0]
//  100         ImageData ++ ;
        ADDS     R4,R4,#+1
//  101         CLK_ClrVal();       /* CLK = 0 */
        BL       CLK_ClrVal
//  102     }
        ADDS     R5,R5,#+1
??ImageCapture_2:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+127
        BCC.N    ??ImageCapture_3
//  103     SamplingDelay();
        BL       SamplingDelay
//  104     SamplingDelay();
        BL       SamplingDelay
//  105     CLK_SetVal();           /* CLK = 1 */
        BL       CLK_SetVal
//  106     SamplingDelay();
        BL       SamplingDelay
//  107     SamplingDelay();
        BL       SamplingDelay
//  108     CLK_ClrVal();           /* CLK = 0 */
        BL       CLK_ClrVal
//  109 }
        POP      {R0,R4,R5,PC}    ;; return
//  110 
//  111 /*************************************************************************
//  112 *                           ������ӹ�����
//  113 *
//  114 *  �������ƣ�CalculateIntegrationTime
//  115 *  ����˵���������ع�ʱ��
//  116 *  ����˵����
//  117 *  �������أ���
//  118 *  �޸�ʱ�䣺2012-10-20
//  119 *  ��    ע��
//  120 *************************************************************************/
//  121 extern uint8 Pixel[128];
//  122 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  123 uint8 PixelAverageValue;/* 128�����ص��ƽ��ADֵ */
PixelAverageValue:
        DS8 1
//  124 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  125 uint8 PixelAverageVoltage;/* 128�����ص��ƽ����ѹֵ��10�� */
PixelAverageVoltage:
        DS8 1
//  126 
//  127 

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//  128 int16 TargetPixelAverageVoltage = 30;/* �趨Ŀ��ƽ����ѹֵ��ʵ�ʵ�ѹ��10�� */
TargetPixelAverageVoltage:
        DATA
        DC16 30
//  129 

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//  130 int16 PixelAverageVoltageError = 0;/* �趨Ŀ��ƽ����ѹֵ��ʵ��ֵ��ƫ�ʵ�ʵ�ѹ��10�� */
PixelAverageVoltageError:
        DS8 2
//  131 

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//  132 int16 TargetPixelAverageVoltageAllowError = 2;/* �趨Ŀ��ƽ����ѹֵ�����ƫ�ʵ�ʵ�ѹ��10�� */
TargetPixelAverageVoltageAllowError:
        DATA
        DC16 2
//  133 

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//  134 uint8 IntegrationTime = 10;/* �ع�ʱ�䣬��λms */
IntegrationTime:
        DATA
        DC8 10
//  135 
//  136 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  137 void CalculateIntegrationTime(void) 
//  138 {
CalculateIntegrationTime:
        PUSH     {R7,LR}
//  139 
//  140     PixelAverageValue = PixelAverage(128,Pixel);/* ����128�����ص��ƽ��ADֵ */
        LDR.N    R1,??DataTable3_1
        MOVS     R0,#+128
        BL       PixelAverage
        LDR.N    R1,??DataTable3_2
        STRB     R0,[R1, #+0]
//  141     
//  142    
//  143     PixelAverageVoltage = (unsigned char)((int)PixelAverageValue * 25 / 128); /* ����128�����ص��ƽ����ѹֵ,ʵ��ֵ��10�� */
        LDR.N    R0,??DataTable3_2
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+25
        MULS     R0,R1,R0
        MOVS     R1,#+128
        SDIV     R0,R0,R1
        LDR.N    R1,??DataTable3_3
        STRB     R0,[R1, #+0]
//  144 
//  145     PixelAverageVoltageError = TargetPixelAverageVoltage - PixelAverageVoltage;
        LDR.N    R0,??DataTable3_4
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable3_3
        LDRB     R1,[R1, #+0]
        SUBS     R0,R0,R1
        LDR.N    R1,??DataTable3_5
        STRH     R0,[R1, #+0]
//  146     if(PixelAverageVoltageError < -TargetPixelAverageVoltageAllowError)
        LDR.N    R0,??DataTable3_5
        LDRSH    R0,[R0, #+0]
        LDR.N    R1,??DataTable3_6
        LDRSH    R1,[R1, #+0]
        CMN      R0,R1
        BGE.N    ??CalculateIntegrationTime_0
//  147         IntegrationTime--;//�ع�ʱ�俴ʲô
        LDR.N    R0,??DataTable3_7
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable3_7
        STRB     R0,[R1, #+0]
//  148     if(PixelAverageVoltageError > TargetPixelAverageVoltageAllowError)
??CalculateIntegrationTime_0:
        LDR.N    R0,??DataTable3_6
        LDRSH    R0,[R0, #+0]
        LDR.N    R1,??DataTable3_5
        LDRSH    R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??CalculateIntegrationTime_1
//  149         IntegrationTime++;
        LDR.N    R0,??DataTable3_7
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable3_7
        STRB     R0,[R1, #+0]
//  150     if(IntegrationTime <= 1)
??CalculateIntegrationTime_1:
        LDR.N    R0,??DataTable3_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BCS.N    ??CalculateIntegrationTime_2
//  151         IntegrationTime = 1;
        LDR.N    R0,??DataTable3_7
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  152     if(IntegrationTime >= 20)
??CalculateIntegrationTime_2:
        LDR.N    R0,??DataTable3_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+20
        BCC.N    ??CalculateIntegrationTime_3
//  153         IntegrationTime = 20;
        LDR.N    R0,??DataTable3_7
        MOVS     R1,#+20
        STRB     R1,[R0, #+0]
//  154 }
??CalculateIntegrationTime_3:
        POP      {R0,PC}          ;; return
//  155 
//  156 /*************************************************************************
//  157 *                           ������ӹ�����
//  158 *
//  159 *  �������ƣ�PixelAverage
//  160 *  ����˵����������ľ�ֵ����
//  161 *  ����˵����
//  162 *  �������أ���
//  163 *  �޸�ʱ�䣺2012-10-20
//  164 *  ��    ע��
//  165 *************************************************************************/
//  166 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  167 uint8 PixelAverage(uint8 len, uint8 *data) 
//  168 {
PixelAverage:
        PUSH     {R4}
//  169   unsigned char i;
//  170   unsigned int sum = 0;
        MOVS     R3,#+0
//  171   for(i = 0; i<len; i++) 
        MOVS     R2,#+0
        B.N      ??PixelAverage_0
//  172   {
//  173     sum = sum + *data++;
??PixelAverage_1:
        LDRB     R4,[R1, #+0]
        UXTAB    R3,R3,R4
        ADDS     R1,R1,#+1
//  174   }
        ADDS     R2,R2,#+1
??PixelAverage_0:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R2,R0
        BCC.N    ??PixelAverage_1
//  175   return ((unsigned char)(sum/len));
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UDIV     R0,R3,R0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4}
        BX       LR               ;; return
//  176 }
//  177 /*************************************************************************
//  178 *                           ������ӹ�����
//  179 *
//  180 *  �������ƣ�SendHex
//  181 *  ����˵�����ɼ����ͳ���
//  182 *  ����˵����
//  183 *  �������أ���
//  184 *  �޸�ʱ�䣺2012-10-20
//  185 *  ��    ע��
//  186 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  187 void SendHex(unsigned char hex) 
//  188 {
SendHex:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  189   unsigned char temp;
//  190   temp = hex >> 4;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSRS     R0,R4,#+4
//  191   if(temp < 10) 
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+10
        BCS.N    ??SendHex_0
//  192   {
//  193    uart_send1(UART0,temp + '0');
        ADDS     R1,R0,#+48
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable3_8  ;; 0x4006a000
        BL       uart_send1
        B.N      ??SendHex_1
//  194   } 
//  195   else 
//  196   {
//  197    uart_send1(UART0,temp - 10 + 'A');
??SendHex_0:
        ADDS     R1,R0,#+55
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable3_8  ;; 0x4006a000
        BL       uart_send1
//  198   }
//  199   temp = hex & 0x0F;
??SendHex_1:
        ANDS     R0,R4,#0xF
//  200   if(temp < 10) 
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+10
        BCS.N    ??SendHex_2
//  201   {
//  202    uart_send1(UART0,temp + '0');
        ADDS     R1,R0,#+48
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable3_8  ;; 0x4006a000
        BL       uart_send1
        B.N      ??SendHex_3
//  203   } 
//  204   else 
//  205   {
//  206   uart_send1(UART0,temp - 10 + 'A');
??SendHex_2:
        ADDS     R1,R0,#+55
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable3_8  ;; 0x4006a000
        BL       uart_send1
//  207   }
//  208 }
??SendHex_3:
        POP      {R4,PC}          ;; return
//  209 /*************************************************************************
//  210 *                           ������ӹ�����
//  211 *
//  212 *  �������ƣ�SendImageData
//  213 *  ����˵����
//  214 *  ����˵����
//  215 *  �������أ���
//  216 *  �޸�ʱ�䣺2012-10-20
//  217 *  ��    ע��
//  218 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  219 void SendImageData(unsigned char * ImageData) 
//  220 {
SendImageData:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
//  221 
//  222     unsigned char i;
//  223     unsigned char crc = 0;
        MOVS     R6,#+0
//  224 
//  225     /* Send Data */
//  226     
//  227     uart_send1(UART0,'*');
        MOVS     R1,#+42
        LDR.N    R0,??DataTable3_8  ;; 0x4006a000
        BL       uart_send1
//  228     uart_send1(UART0,'L');
        MOVS     R1,#+76
        LDR.N    R0,??DataTable3_8  ;; 0x4006a000
        BL       uart_send1
//  229     uart_send1(UART0,'D');
        MOVS     R1,#+68
        LDR.N    R0,??DataTable3_8  ;; 0x4006a000
        BL       uart_send1
//  230 
//  231     SendHex(0);
        MOVS     R0,#+0
        BL       SendHex
//  232     SendHex(0);
        MOVS     R0,#+0
        BL       SendHex
//  233     SendHex(0);
        MOVS     R0,#+0
        BL       SendHex
//  234     SendHex(0);
        MOVS     R0,#+0
        BL       SendHex
//  235     
//  236     for(i=0; i<128; i++) 
        MOVS     R5,#+0
        B.N      ??SendImageData_0
//  237     {
//  238       SendHex(*ImageData++);
??SendImageData_1:
        LDRB     R0,[R4, #+0]
        BL       SendHex
        ADDS     R4,R4,#+1
//  239     }
        ADDS     R5,R5,#+1
??SendImageData_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+128
        BCC.N    ??SendImageData_1
//  240 
//  241     SendHex(crc);
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SendHex
//  242     uart_send1(UART0,'#');
        MOVS     R1,#+35
        LDR.N    R0,??DataTable3_8  ;; 0x4006a000
        BL       uart_send1
//  243 }
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x400ff100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     Pixel

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     PixelAverageValue

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     PixelAverageVoltage

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     TargetPixelAverageVoltage

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     PixelAverageVoltageError

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     TargetPixelAverageVoltageAllowError

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     IntegrationTime

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     0x4006a000
//  244 /*************************************************************************
//  245 *                           ������ӹ�����
//  246 *
//  247 *  �������ƣ�SamplingDelay
//  248 *  ����˵����CCD��ʱ���� 200ns
//  249 *  ����˵����
//  250 *  �������أ���
//  251 *  �޸�ʱ�䣺2012-10-20
//  252 *  ��    ע��
//  253 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  254  void SamplingDelay(void)
//  255 {
SamplingDelay:
        SUB      SP,SP,#+4
//  256    volatile uint8 i ;
//  257    for(i=0;i<1;i++) 
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
        B.N      ??SamplingDelay_0
//  258    {
//  259     asm("nop");
??SamplingDelay_1:
        nop              
//  260     asm("nop");
        nop              
//  261    }
        LDRB     R0,[SP, #+0]
        ADDS     R0,R0,#+1
        STRB     R0,[SP, #+0]
??SamplingDelay_0:
        LDRB     R0,[SP, #+0]
        CMP      R0,#+1
        BCC.N    ??SamplingDelay_1
//  262    
//  263 }
        ADD      SP,SP,#+4
        BX       LR               ;; return

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
//   4 bytes in section .bss
//   5 bytes in section .data
// 672 bytes in section .text
// 
// 672 bytes of CODE memory
//   9 bytes of DATA memory
//
//Errors: none
//Warnings: 8
