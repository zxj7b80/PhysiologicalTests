#include "common.h"
#include "decoder.h"
/*==============================================================================
���ܣ�FTM1��FTM2ģ��˫·�����������
���ţ�PTA12��PTA13��PTB18��PTB19
���ݣ���ʼ��FTM1��FTM2���������빦��
��������
E6A2-CW3C�����������ţ�
         ��ɫ��GND
         ��ɫ��VCC
         ��ɫ��A��
         ��ɫ��B��
==============================================================================*/
/*
void FTM_QUAD_init()
{
  
  SIM_SCGC6|=SIM_SCGC6_FTM1_MASK;//ʹ��FTM1��FTM2ʱ��
  SIM_SCGC3|=SIM_SCGC3_FTM2_MASK;
  
  SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;//�����˿�ʱ��
  
 
  PORTA_PCR12 = PORT_PCR_MUX(7);  // ѡ��ܽŸ��ù���                      //�ض�оƬ��ʲô����
  PORTA_PCR13 = PORT_PCR_MUX(7);

  PORTB_PCR18 = PORT_PCR_MUX(6);
  PORTB_PCR19 = PORT_PCR_MUX(6);
 
  FTM1_CNTIN = 0;                                          //FTM1��ʼֵ
  FTM2_CNTIN = 0;                                          //FTM2��ʼֵ
  FTM1_MOD = 65535;                                        //�ɸ�����Ҫ���ý���ֵ
  FTM2_MOD = 65535;                                        
  
  FTM1_MODE |= FTM_MODE_WPDIS_MASK;                        //��ֹд����
  FTM2_MODE |= FTM_MODE_WPDIS_MASK;                        //��ֹд����
 
  FTM1_QDCTRL|=FTM_QDCTRL_QUADMODE_MASK;                   //AB��ͬʱȷ������ͼ���ֵ  
  FTM2_QDCTRL|=FTM_QDCTRL_QUADMODE_MASK;                   //AB��ͬʱȷ������ͼ���ֵ  

  FTM1_QDCTRL |= FTM_QDCTRL_QUADEN_MASK;                   //ʹ����������ģʽ
  FTM2_QDCTRL |= FTM_QDCTRL_QUADEN_MASK;                   //ʹ����������ģʽ
  
  FTM1_MODE |= FTM_MODE_FTMEN_MASK;                        //FTMEN=1,�ر�TPM����ģʽ������FTM���й���
  FTM2_MODE |= FTM_MODE_FTMEN_MASK;                        //FTMEN=1,�ر�TPM����ģʽ������FTM���й���
  
  FTM1_CNT=0; 
  FTM2_CNT=0; 
}

*/

/*************************************************************************
*  �������ƣ�FTM2_QUAD_DIR_init
*  ����˵������������ �������ģʽ��ʼ������
*  �������أ���
*  �޸�ʱ�䣺2012-1-26
*  ��    ע��
             ������ʹ�� A10 ��A11 ����������Ϊ��ת�������� A���B �����롣 
              B·���Ƽ���������  �ߵ�ƽʱ�������������
              A·��������
              ��B·Ĭ������
*************************************************************************/
/*void FTM_QUAD_DIR_init()
{
   
    SIM_SCGC6 |=SIM_SCGC6_FTM1_MASK;                             //ʹ��FTM1ʱ��
    SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;                           //ʹ��FTM2ʱ��
    
    SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
    SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
    
    PORT_PCR_REG(PORTA_BASE_PTR, 12) = (0|PORT_PCR_MUX(7)|0x10);     // PTA12
    PORT_PCR_REG(PORTA_BASE_PTR, 13) = (0|PORT_PCR_MUX(7)|0x13);     // PTA13
    PORT_PCR_REG(PORTB_BASE_PTR, 18) = PORT_PCR_MUX(6);              // PTB18
    PORT_PCR_REG(PORTB_BASE_PTR, 19) = PORT_PCR_MUX(6);              // PTB19
      
    FTM_MODE_REG(FTM1_BASE_PTR)    |= FTM_MODE_WPDIS_MASK;           //д������ֹ
    FTM_QDCTRL_REG(FTM1_BASE_PTR)  &=~FTM_QDCTRL_QUADMODE_MASK;       //AB��ͬʱȷ������ͼ���ֵ
    FTM_CNTIN_REG(FTM1_BASE_PTR)    = 0;                             //FTM1��������ʼֵΪ0
    FTM_MOD_REG(FTM1_BASE_PTR)      = 0xFFFF;                        //FTM1��������ֵΪ0
    
    FTM_MODE_REG(FTM2_BASE_PTR)    |= FTM_MODE_WPDIS_MASK;           //д������ֹ
    FTM_QDCTRL_REG(FTM2_BASE_PTR)  &= ~FTM_QDCTRL_QUADMODE_MASK;     //AB ��������ģʽ
    FTM_CNTIN_REG(FTM2_BASE_PTR)    = 0;                             //FTM��������ʼֵΪ0
    FTM_MOD_REG(FTM2_BASE_PTR)      = 0xFFFF;                        //FTM��������ʼֵΪ0
    
    FTM_QDCTRL_REG(FTM1_BASE_PTR)  |=FTM_QDCTRL_QUADEN_MASK;         //ʹ��FTM1��������ģʽ
    FTM_MODE_REG(FTM1_BASE_PTR)    |= FTM_MODE_FTMEN_MASK;           //FTM1EN=1	
    FTM_CNT_REG(FTM1_BASE_PTR)     = 0; 
    
    FTM_QDCTRL_REG(FTM2_BASE_PTR)  |=FTM_QDCTRL_QUADEN_MASK;         //ʹ��FTM2��������ģʽ
    FTM_MODE_REG(FTM2_BASE_PTR)    |= FTM_MODE_FTMEN_MASK;           //FTM2EN=1	
    FTM_CNT_REG(FTM2_BASE_PTR)     = 0; 	
}*/



/*************************************************************************
*  �������ƣ�FTM2_init
*  ����˵������������ �������ģʽ��ʼ������
*  �������أ���
*  �޸�ʱ�䣺2012-1-26
*  ��    ע��CH0~CH3����ʹ�ù�������δ����⹦��
             ������ʹ�� A10 ��A11 ����������Ϊ��ת�������� A���B �����롣 
*************************************************************************
void FTM_QUAD_init()
{
    SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;                                 //ʹ��FTM2ʱ��

    SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
    PORT_PCR_REG(PORTB_BASE_PTR, 18) = PORT_PCR_MUX(6);               // PTB18
    PORT_PCR_REG(PORTB_BASE_PTR, 19) = PORT_PCR_MUX(6);               // PTB19
       
    FTM_MODE_REG(FTM2_BASE_PTR)    |= FTM_MODE_WPDIS_MASK;           //д������ֹ
    FTM_QDCTRL_REG(FTM2_BASE_PTR)  &= ~FTM_QDCTRL_QUADMODE_MASK;     //AB ��������ģʽ
    FTM_CNTIN_REG(FTM2_BASE_PTR)    = 0;                             //FTM��������ʼֵΪ0
    FTM_MOD_REG(FTM2_BASE_PTR)      = 0xFFFF;                        //FTM��������ʼֵΪ0
   
    FTM_QDCTRL_REG(FTM2_BASE_PTR)  |=FTM_QDCTRL_QUADEN_MASK;         //ʹ��FTM2��������ģʽ
    FTM_MODE_REG(FTM2_BASE_PTR)    |= FTM_MODE_FTMEN_MASK;                             //FTM2EN=1	
    FTM_CNT_REG(FTM2_BASE_PTR)    = 0; 	
}*/
