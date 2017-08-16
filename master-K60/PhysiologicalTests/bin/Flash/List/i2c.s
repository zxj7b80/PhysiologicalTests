///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      10/Feb/2015  19:51:00 /
// IAR ANSI C/C++ Compiler V6.30.4.23288/W32 EVALUATION for ARM               /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  E:\��Ƭ��\K60\K60���İ�Դ����\03_LQ_uart_int\src\Source /
//                    s\C\Component_C\i2c.c                                   /
//    Command line =  E:\��Ƭ��\K60\K60���İ�Դ����\03_LQ_uart_int\src\Source /
//                    s\C\Component_C\i2c.c -D IAR -D TWR_K60N512 -lCN        /
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
//                    List\i2c.s                                              /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME i2c

        #define SHT_PROGBITS 0x1

        PUBLIC hw_i2c_init
        PUBLIC hw_iic_read1
        PUBLIC hw_iic_readn
        PUBLIC hw_iic_write1
        PUBLIC hw_iic_writen
        PUBLIC hw_send_signal
        PUBLIC hw_wait

// E:\��Ƭ��\K60\K60���İ�Դ����\03_LQ_uart_int\src\Sources\C\Component_C\i2c.c
//    1 //============================================================================
//    2 // �ļ����ƣ�hw_i2c.h                                                          
//    3 // ���ܸ�Ҫ��uart����ͷ�ļ�
//    4 // ��Ȩ����: ���ݴ�ѧ��˼����Ƕ��ʽ����(sumcu.suda.edu.cn)
//    5 // �汾����:    ʱ��                         �汾                     ����                          �޸�
//    6 //           2011-11-17     V1.0       stone    ��д��K60��i2c����
//    7 //============================================================================
//    8 
//    9 
//   10 #ifndef __I2C_H__
//   11 #define __I2C_H__
//   12 	
//   13 #include "common.h"
//   14 #include "i2c.h"
//   15 
//   16 //============================================================================
//   17 //�������ƣ�hw_i2c_init                                                        
//   18 //���ܸ�Ҫ����ʼ��IICXģ�顣                                                
//   19 //����˵����num:ģ���                                                         
//   20 //�������أ���                                                                  
//   21 //============================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   22 void hw_i2c_init(I2C_MemMapPtr num)
//   23 {
//   24 	
//   25 	if(num == I2C0)
hw_i2c_init:
        LDR.N    R1,??DataTable1  ;; 0x40066000
        CMP      R0,R1
        BNE.N    ??hw_i2c_init_0
//   26 	{
//   27 		//��I2C0ģ��ʱ��
//   28 		SIM_SCGC4 |= SIM_SCGC4_I2C0_MASK; 
        LDR.N    R0,??DataTable1_1  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40
        LDR.N    R1,??DataTable1_1  ;; 0x40048034
        STR      R0,[R1, #+0]
//   29 		//�������Ÿ���ΪI2C0����
//   30 		//I2C0 SCLʹ��PTD8
//   31 		//I2C0 SDAʹ��PTD9
//   32 		PORTD_PCR9 = PORT_PCR_MUX(2);
        LDR.N    R0,??DataTable1_2  ;; 0x4004c024
        MOV      R1,#+512
        STR      R1,[R0, #+0]
//   33 		PORTD_PCR8 = PORT_PCR_MUX(2);
        LDR.N    R0,??DataTable1_3  ;; 0x4004c020
        MOV      R1,#+512
        STR      R1,[R0, #+0]
//   34 		//���� MULT �� ICR   
//   35 		//оƬ�ֲ��Ƽ�����100K�Լ�СMCU����
//   36 		//k60��MCU����Ƶ��Ϊ48M���������Ϸ�Ƶ
//   37 		I2C0_F  = 0x65;   
        LDR.N    R0,??DataTable1_4  ;; 0x40066001
        MOVS     R1,#+101
        STRB     R1,[R0, #+0]
//   38 		//ʹ��I2C0��������Ӧ���ź�
//   39 		I2C0_C1 = I2C_C1_IICEN_MASK | I2C_C1_TXAK_MASK;      
        LDR.N    R0,??DataTable1_5  ;; 0x40066002
        MOVS     R1,#+136
        STRB     R1,[R0, #+0]
        B.N      ??hw_i2c_init_1
//   40 	}
//   41 	else
//   42 	{
//   43 		//��I2C1ģ��ʱ��
//   44 		SIM_SCGC4 |= SIM_SCGC4_I2C1_MASK; 
??hw_i2c_init_0:
        LDR.N    R0,??DataTable1_1  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable1_1  ;; 0x40048034
        STR      R0,[R1, #+0]
//   45 		//�������Ÿ���ΪI2C1����
//   46 		//I2C1 SCLʹ��PTC10
//   47 		//I2C1 SDAʹ��PTC11
//   48 		PORTC_PCR10 = PORT_PCR_MUX(2);
        LDR.N    R0,??DataTable1_6  ;; 0x4004b028
        MOV      R1,#+512
        STR      R1,[R0, #+0]
//   49 		PORTC_PCR11 = PORT_PCR_MUX(2);
        LDR.N    R0,??DataTable1_7  ;; 0x4004b02c
        MOV      R1,#+512
        STR      R1,[R0, #+0]
//   50 		//���� MULT �� ICR   
//   51 		//оƬ�ֲ��Ƽ�����100K�Լ�СMCU����
//   52 		//k60��MCU����Ƶ��Ϊ48M���������Ϸ�Ƶ
//   53 		I2C1_F  = 0x65;   
        LDR.N    R0,??DataTable1_8  ;; 0x40067001
        MOVS     R1,#+101
        STRB     R1,[R0, #+0]
//   54 		//ʹ��I2C1��������Ӧ���ź�
//   55 		I2C1_C1 = I2C_C1_IICEN_MASK | I2C_C1_TXAK_MASK;      
        LDR.N    R0,??DataTable1_9  ;; 0x40067002
        MOVS     R1,#+136
        STRB     R1,[R0, #+0]
//   56 	}
//   57 }
??hw_i2c_init_1:
        BX       LR               ;; return
//   58 
//   59 //============================================================================
//   60 //�������ƣ�hw_send_signal                                                        
//   61 //���ܸ�Ҫ��������Ҫ������ʼ��ֹͣ�ź�   ��                                                
//   62 //����˵����         num:ģ���       
//   63 //          Signal: 'S'(Start),������ʼ�ź�      'O'(Over),  ����ֹͣ�ź�               
//   64 //�������أ���                                                                  
//   65 //============================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   66 void hw_send_signal(uint8 Signal,I2C_MemMapPtr num)
//   67 {
//   68 	
//   69 	if(num == I2C0)//ģ��0
hw_send_signal:
        LDR.N    R2,??DataTable1  ;; 0x40066000
        CMP      R1,R2
        BNE.N    ??hw_send_signal_0
//   70 	{
//   71 		if (Signal == 'S')    
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+83
        BNE.N    ??hw_send_signal_1
//   72 		{
//   73 		  i2c0_Start(); //����ģʽѡ��λMST��0��Ϊ1,���Բ�����ʼ�ź�  
        LDR.N    R0,??DataTable1_5  ;; 0x40066002
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable1_5  ;; 0x40066002
        STRB     R0,[R1, #+0]
        B.N      ??hw_send_signal_2
//   74 		}
//   75 		else if (Signal == 'O')
??hw_send_signal_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+79
        BNE.N    ??hw_send_signal_2
//   76 		{
//   77 		  i2c0_Stop();//����ģʽѡ��λMST��1��Ϊ0,���Բ���ֹͣ�ź�
        LDR.N    R0,??DataTable1_5  ;; 0x40066002
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xDF
        LDR.N    R1,??DataTable1_5  ;; 0x40066002
        STRB     R0,[R1, #+0]
        B.N      ??hw_send_signal_2
//   78 		}
//   79 	}
//   80 	else if(num == I2C1)//ģ��1
??hw_send_signal_0:
        LDR.N    R2,??DataTable1_10  ;; 0x40067000
        CMP      R1,R2
        BNE.N    ??hw_send_signal_2
//   81 	{
//   82 		if (Signal == 'S')    
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+83
        BNE.N    ??hw_send_signal_3
//   83 		{
//   84 		  i2c1_Start(); //����ģʽѡ��λMST��0��Ϊ1,���Բ�����ʼ�ź�  
        LDR.N    R0,??DataTable1_9  ;; 0x40067002
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable1_9  ;; 0x40067002
        STRB     R0,[R1, #+0]
        B.N      ??hw_send_signal_2
//   85 		}
//   86 		else if (Signal == 'O')
??hw_send_signal_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+79
        BNE.N    ??hw_send_signal_2
//   87 		{
//   88 		  i2c1_Stop();//����ģʽѡ��λMST��1��Ϊ0,���Բ���ֹͣ�ź�
        LDR.N    R0,??DataTable1_9  ;; 0x40067002
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xDF
        LDR.N    R1,??DataTable1_9  ;; 0x40067002
        STRB     R0,[R1, #+0]
//   89 		}
//   90 	}
//   91 	        
//   92                                            
//   93 }
??hw_send_signal_2:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x40066000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x40048034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x4004c024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0x4004c020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0x40066001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     0x40066002

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     0x4004b028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     0x4004b02c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     0x40067001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     0x40067002

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     0x40067000
//   94 
//   95 
//   96 
//   97 //============================================================================
//   98 //�������ƣ�hw_wait                                                        
//   99 //���ܸ�Ҫ�� ��ʱ����,ѭ��������Ӧ���־λ,������ɱ�־λ,�ж�MCU         
//  100 //          �Ƿ���յ�Ӧ���źŻ�һ���ֽ��Ƿ����������ϴ������                                            
//  101 //����˵����         num:ģ���       
//  102 //               x:x = 'A'(Ack),�ȴ�Ӧ��;x = 'T'(Transmission),�ȴ�һ���ֽ�        
//  103 //                 ���ݴ������                   
//  104 //�������أ�0:�յ�Ӧ���źŻ�һ���ֽڴ������;
//  105 //         1:δ�յ�Ӧ���źŻ�һ�� �ֽ�û������                                                                                                                            
//  106 //============================================================================
//  107 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  108 uint8 hw_wait(uint8 x,I2C_MemMapPtr num)
//  109 {
hw_wait:
        PUSH     {R4}
//  110     uint16 ErrTime, i;
//  111     ErrTime = 255*10;            //�����ѯ��ʱʱ��
        MOVW     R2,#+2550
//  112 
//  113 	for (i = 0;i < ErrTime;i++)
        MOVS     R3,#+0
        B.N      ??hw_wait_0
??hw_wait_1:
        ADDS     R3,R3,#+1
??hw_wait_0:
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R3,R2
        BCS.N    ??hw_wait_2
//  114 	{
//  115 		if (x == 'A')           //�ȴ�Ӧ���ź�
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+65
        BNE.N    ??hw_wait_3
//  116 		{
//  117 			  if(( I2C_S_REG(num)  & I2C_S_RXAK_MASK)==0)
        LDRB     R4,[R1, #+3]
        LSLS     R4,R4,#+31
        BMI.N    ??hw_wait_1
//  118 				 return 0;      //������һ���ֽں�,�յ��˴ӻ���Ӧ���ź�               
        MOVS     R0,#+0
        B.N      ??hw_wait_4
//  119 		}
//  120 		else if (x == 'T')      //�ȴ��������һ���ֽ��ź�
??hw_wait_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+84
        BNE.N    ??hw_wait_1
//  121 		{
//  122 			if ((I2C_S_REG(num) & I2C_S_IICIF_MASK) != 0)    
        LDRB     R4,[R1, #+3]
        LSLS     R4,R4,#+30
        BPL.N    ??hw_wait_1
//  123 			{
//  124 				(I2C_S_REG(num) |=(0 | I2C_S_IICIF_MASK));  //��IICIF��־λ
        LDRB     R0,[R1, #+3]
        ORRS     R0,R0,#0x2
        STRB     R0,[R1, #+3]
//  125 				return 0;       //�ɹ�������һ���ֽ�
        MOVS     R0,#+0
        B.N      ??hw_wait_4
//  126 			}       
//  127 		}
//  128 	}
//  129 	if (i >= ErrTime)
??hw_wait_2:
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R3,R2
        BCC.N    ??hw_wait_5
//  130 		return 1;               //��ʱ,û���յ�Ӧ���źŻ�����һ���ֽ�   	
        MOVS     R0,#+1
        B.N      ??hw_wait_4
//  131 }
??hw_wait_5:
??hw_wait_4:
        POP      {R4}
        BX       LR               ;; return
//  132 
//  133 //============================================================================
//  134 //�������ƣ�hw_iic_read1                                                        
//  135 //���ܸ�Ҫ���Ӵӻ���1���ֽ�����                                            
//  136 //����˵����  num:ģ���       
//  137 //          DeviceAddr:�豸��ַ    
//  138 //          AccessAddr:���ʵ�ַ
//  139 //          Data:�����յ���һ���ֽ�����  
//  140 //�������أ�Ϊ0,�ɹ���һ���ֽ�;Ϊ1,��һ���ֽ�ʧ��  
//  141 //����˵��: �ڲ����� hw_send_signal,hw_wait  
//  142 //============================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  143 uint8 hw_iic_read1(I2C_MemMapPtr num,uint8 DeviceAddr, uint8 AccessAddr, uint8 *Data)
//  144 {      
hw_iic_read1:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R7,R2
        MOVS     R6,R3
//  145       
//  146 	I2C_C1_REG(num)     |= 0x10;           //TX = 1,MCU����Ϊ����ģʽ
        LDRB     R0,[R4, #+2]
        ORRS     R0,R0,#0x10
        STRB     R0,[R4, #+2]
//  147 	hw_send_signal('S',num);               //���Ϳ�ʼ�ź� 
        MOVS     R1,R4
        MOVS     R0,#+83
        BL       hw_send_signal
//  148 	I2C_D_REG(num)  = DeviceAddr & 0xfe;   //�����豸��ַ,��֪ͨ�ӻ���������
        ANDS     R0,R5,#0xFE
        STRB     R0,[R4, #+4]
//  149 	 
//  150 	if (hw_wait('T',num))                  //�ȴ�һ���ֽ����ݴ������  
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_0
//  151 	{      
//  152 
//  153 		return 1;                         //û�д��ͳɹ�,��һ���ֽ�ʧ��   
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  154 	}
//  155 	if (hw_wait('A',num))                 //�ȴ��ӻ�Ӧ���ź� 
??hw_iic_read1_0:
        MOVS     R1,R4
        MOVS     R0,#+65
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_2
//  156 	{
//  157 
//  158 		return 1;                         //û�еȵ�Ӧ���ź�,��һ���ֽ�ʧ�� 
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  159 	}
//  160 	I2C_D_REG(num)  = AccessAddr;        //���ͷ��ʵ�ַ    
??hw_iic_read1_2:
        STRB     R7,[R4, #+4]
//  161 	if (hw_wait('T',num))                //�ȴ�һ���ֽ����ݴ������ 
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_3
//  162 	{
//  163 	 
//  164 		return 1;                        //û�д��ͳɹ�,��һ���ֽ�ʧ��
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  165 	}
//  166 	if (hw_wait('A',num))                //�ȴ��ӻ�Ӧ���ź�   
??hw_iic_read1_3:
        MOVS     R1,R4
        MOVS     R0,#+65
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_4
//  167 	{
//  168 	  
//  169 		return 1;                        //û�еȵ�Ӧ���ź�,��һ���ֽ�ʧ��  
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  170 	}
//  171 	I2C_C1_REG(num) |= 0x04;//��MCU������ģ ʽ�£����λд1������һ�����¿�ʼ�ź�  
??hw_iic_read1_4:
        LDRB     R0,[R4, #+2]
        ORRS     R0,R0,#0x4
        STRB     R0,[R4, #+2]
//  172 	I2C_D_REG(num) = DeviceAddr | 0x01; //֪ͨ�ӻ���Ϊ��������    
        ORRS     R0,R5,#0x1
        STRB     R0,[R4, #+4]
//  173 	if (hw_wait('T',num))               //�ȴ�һ���ֽ����ݴ������  
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_5
//  174 	{
//  175 	 
//  176 		return 1;                       //û�д��ͳɹ�,��һ���ֽ�ʧ�� 
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  177 	}
//  178 	if (hw_wait('A',num))               //�ȴ��ӻ�Ӧ���ź�  
??hw_iic_read1_5:
        MOVS     R1,R4
        MOVS     R0,#+65
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_6
//  179 	{
//  180 	 
//  181 		return 1;                      //û�еȵ�Ӧ���ź�,��һ���ֽ�ʧ��
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  182 	}
//  183 	I2C_C1_REG(num) &= 0xef;           //TX = 0,MCU����Ϊ����ģʽ    
??hw_iic_read1_6:
        LDRB     R0,[R4, #+2]
        ANDS     R0,R0,#0xEF
        STRB     R0,[R4, #+2]
//  184 	*Data = I2C_D_REG(num);            //����IIC1D,׼����������   
        LDRB     R0,[R4, #+4]
        STRB     R0,[R6, #+0]
//  185 	if (hw_wait('T',num))              //�ȴ�һ���ֽ����ݴ������  
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_7
//  186 	{  
//  187 	 
//  188 		return 1;                      //û�д��ͳɹ�,��һ���ֽ�ʧ��  
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  189 	}
//  190 	hw_send_signal('O',num);           //����ֹͣ�ź�    
??hw_iic_read1_7:
        MOVS     R1,R4
        MOVS     R0,#+79
        BL       hw_send_signal
//  191 	*Data = I2C_D_REG(num);            //�������յ���һ������    
        LDRB     R0,[R4, #+4]
        STRB     R0,[R6, #+0]
//  192 	
//  193 	return 0;                          //��ȷ���յ�һ���ֽ�����
        MOVS     R0,#+0
??hw_iic_read1_1:
        POP      {R1,R4-R7,PC}    ;; return
//  194 	
//  195 }
//  196 
//  197 //============================================================================
//  198 //�������ƣ�hw_iic_write1                                                        
//  199 //���ܸ�Ҫ����ӻ�д1���ֽ�����                                           
//  200 //����˵����  num:ģ���       
//  201 //          DeviceAddr:�豸��ַ    
//  202 //          AccessAddr:���ʵ�ַ
//  203 //          Data:Ҫ�����ӻ���1���ֽ�����  
//  204 //�������أ�Ϊ0,�ɹ�дһ���ֽ�;Ϊ1,дһ���ֽ�ʧ�� 
//  205 //����˵��: �ڲ����� hw_send_signal,hw_wait  
//  206 //============================================================================
//  207 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  208 uint8 hw_iic_write1(I2C_MemMapPtr num,uint8 DeviceAddr, uint8 AccessAddr, uint8 Data)
//  209 {
hw_iic_write1:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
//  210 	I2C_C1_REG(num) |= 0x10;             //TX = 1,MCU����Ϊ����ģʽ
        LDRB     R0,[R4, #+2]
        ORRS     R0,R0,#0x10
        STRB     R0,[R4, #+2]
//  211     hw_send_signal('S',num);             //���Ϳ�ʼ�ź�
        MOVS     R1,R4
        MOVS     R0,#+83
        BL       hw_send_signal
//  212     I2C_D_REG(num) = DeviceAddr & 0xfe;  //�����豸��ַ,��֪ͨ�ӻ���������
        ANDS     R0,R5,#0xFE
        STRB     R0,[R4, #+4]
//  213     if (hw_wait('T',num))                //�ȴ�һ���ֽ����ݴ������
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_write1_0
//  214         return 1;                        //û�д��ͳɹ�,дһ���ֽ�ʧ��
        MOVS     R0,#+1
        B.N      ??hw_iic_write1_1
//  215     if (hw_wait('A',num))               //�ȴ��ӻ�Ӧ���ź�
??hw_iic_write1_0:
        MOVS     R1,R4
        MOVS     R0,#+65
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_write1_2
//  216         return 1;                       //û�еȵ�Ӧ���ź�,дһ���ֽ�ʧ��   
        MOVS     R0,#+1
        B.N      ??hw_iic_write1_1
//  217     I2C_D_REG(num) = AccessAddr;         //���ͷ��ʵ�ַ
??hw_iic_write1_2:
        STRB     R6,[R4, #+4]
//  218     if (hw_wait('T',num))               //�ȴ�һ���ֽ����ݴ������
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_write1_3
//  219         return 1;                       //û�д��ͳɹ�,дһ���ֽ�ʧ��
        MOVS     R0,#+1
        B.N      ??hw_iic_write1_1
//  220     if (hw_wait('A',num))               //�ȴ��ӻ�Ӧ���ź�
??hw_iic_write1_3:
        MOVS     R1,R4
        MOVS     R0,#+65
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_write1_4
//  221         return 1;                      //û�еȵ�Ӧ���ź�,дһ���ֽ�ʧ��   
        MOVS     R0,#+1
        B.N      ??hw_iic_write1_1
//  222     I2C_D_REG(num) = Data;             //д����
??hw_iic_write1_4:
        STRB     R7,[R4, #+4]
//  223     if (hw_wait('T',num))              //�ȴ�һ���ֽ����ݴ������
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_write1_5
//  224         return 1;                      //û�д��ͳɹ�,дһ���ֽ�ʧ��
        MOVS     R0,#+1
        B.N      ??hw_iic_write1_1
//  225     if (hw_wait('A',num))              //�ȴ��ӻ�Ӧ���ź�
??hw_iic_write1_5:
        MOVS     R1,R4
        MOVS     R0,#+65
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_write1_6
//  226         return 1;                      //û�еȵ�Ӧ���ź�,дһ���ֽ�ʧ��   
        MOVS     R0,#+1
        B.N      ??hw_iic_write1_1
//  227     hw_send_signal('O',num);           //����ֹͣ�ź�
??hw_iic_write1_6:
        MOVS     R1,R4
        MOVS     R0,#+79
        BL       hw_send_signal
//  228     return 0;
        MOVS     R0,#+0
??hw_iic_write1_1:
        POP      {R1,R4-R7,PC}    ;; return
//  229 }
//  230 
//  231 
//  232 //============================================================================
//  233 //�������ƣ�hw_iic_readn                                                        
//  234 //���ܸ�Ҫ�� �Ӵӻ���N���ֽ�����                                             
//  235 //����˵����  num:ģ���       
//  236 //          DeviceAddr:�豸��ַ    
//  237 //          AccessAddr:���ʵ�ַ
//  238 //          Data:�������ݵĻ�����
//  239 //          N:�Ӵӻ������ֽڸ��� 
//  240 //�������أ� Ϊ0,�ɹ���N���ֽ�;Ϊ1,��N���ֽ�ʧ��  
//  241 //����˵��: �ڲ�����hw_iic_read1  
//  242 //============================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  243 uint8 hw_iic_readn(I2C_MemMapPtr num,uint8 DeviceAddr, uint8 AccessAddr, uint8 Data[], uint8 N)
//  244 {
hw_iic_readn:
        PUSH     {R3-R9,LR}
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R2
        MOV      R8,R3
        LDR      R4,[SP, #+32]
//  245     uint16 i, j;
//  246     for (i = 0;i < N;i++)
        MOVS     R9,#+0
        B.N      ??hw_iic_readn_0
??hw_iic_readn_1:
        ADDS     R9,R9,#+1
??hw_iic_readn_0:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R9,R0
        BCS.N    ??hw_iic_readn_2
//  247     {
//  248         for(j = 0;j <15*40 ;j++); //��С��ʱ(���͵�ÿ���ֽ�֮��Ҫ��ʱ����)
        MOVS     R0,#+0
        B.N      ??hw_iic_readn_3
??hw_iic_readn_4:
        ADDS     R0,R0,#+1
??hw_iic_readn_3:
        MOV      R1,#+600
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,R1
        BCC.N    ??hw_iic_readn_4
//  249         if (hw_iic_read1(num,DeviceAddr, AccessAddr + i, &Data[i]))  
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        ADDS     R3,R9,R8
        ADDS     R2,R9,R7
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R5
        BL       hw_iic_read1
        CMP      R0,#+0
        BEQ.N    ??hw_iic_readn_1
//  250             return 1;             //����һ���ֽ�û�н��յ�,����ʧ�ܱ�־:1
        MOVS     R0,#+1
        B.N      ??hw_iic_readn_5
//  251     }
//  252     if (i >= N)
??hw_iic_readn_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R9,R4
        BCC.N    ??hw_iic_readn_6
//  253         return 0;                 //�ɹ�����N������,���سɹ���־:0
        MOVS     R0,#+0
        B.N      ??hw_iic_readn_5
//  254 }
??hw_iic_readn_6:
??hw_iic_readn_5:
        POP      {R1,R4-R9,PC}    ;; return
//  255 
//  256 
//  257 
//  258 
//  259 
//  260 //============================================================================
//  261 //�������ƣ�hw_iic_writen                                                        
//  262 //���ܸ�Ҫ�� ��ӻ�дN���ֽ�����                                              
//  263 //����˵����  num:ģ���       
//  264 //          DeviceAddr:�豸��ַ    
//  265 //          AccessAddr:���ʵ�ַ
//  266 //          Data:Ҫд�������  
//  267 //          N:�Ӵӻ������ֽڸ��� 
//  268 //�������أ� Ϊ0,�ɹ�дN���ֽ�;Ϊ1,дN���ֽ�ʧ��
//  269 //����˵��: �ڲ�����hw_iic_write1   
//  270 //============================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  271 uint8 hw_iic_writen(I2C_MemMapPtr num,uint8 DeviceAddr, uint8 AccessAddr,uint8 Data[], uint8 N)
//  272 {
hw_iic_writen:
        PUSH     {R3-R9,LR}
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R2
        MOV      R8,R3
        LDR      R4,[SP, #+32]
//  273     uint16 i, j;
//  274     for (i = 0;i < N;i++)
        MOVS     R9,#+0
        B.N      ??hw_iic_writen_0
??hw_iic_writen_1:
        ADDS     R9,R9,#+1
??hw_iic_writen_0:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R9,R0
        BCS.N    ??hw_iic_writen_2
//  275     {
//  276         for(j = 0;j < 15*40;j++); //��С��ʱ(���͵�ÿ���ֽ�֮��Ҫ��ʱ����)
        MOVS     R0,#+0
        B.N      ??hw_iic_writen_3
??hw_iic_writen_4:
        ADDS     R0,R0,#+1
??hw_iic_writen_3:
        MOV      R1,#+600
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,R1
        BCC.N    ??hw_iic_writen_4
//  277         if (hw_iic_write1(num,DeviceAddr, AccessAddr + i, Data[i]))
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        LDRB     R3,[R9, R8]
        ADDS     R2,R9,R7
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R5
        BL       hw_iic_write1
        CMP      R0,#+0
        BEQ.N    ??hw_iic_writen_1
//  278             return 1;            //����һ���ֽ�û�з��ͳ�ȥ,����ʧ�ܱ�־:1
        MOVS     R0,#+1
        B.N      ??hw_iic_writen_5
//  279     }
//  280     if (i >= N)
??hw_iic_writen_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R9,R4
        BCC.N    ??hw_iic_writen_6
//  281         return 0;                //�ɹ�����N������,���سɹ���־:0
        MOVS     R0,#+0
        B.N      ??hw_iic_writen_5
//  282 }
??hw_iic_writen_6:
??hw_iic_writen_5:
        POP      {R1,R4-R9,PC}    ;; return

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  283 
//  284 #endif 
// 
// 846 bytes in section .text
// 
// 846 bytes of CODE memory
//
//Errors: none
//Warnings: 3
