#include "adc.h"


tADC_Config   Master_Adc_Config;
//============================================================================
//�������ƣ�hw_adc_init
//�������أ�0 �ɹ� ��1 ʧ��
//����˵����MoudelNumber��ģ���
//���ܸ�Ҫ��AD��ʼ��
//============================================================================
uint8 hw_adc_init(int MoudelNumber)
{
    if(MoudelNumber == 0)//ģ��0
    {
        SIM_SCGC6 |= (SIM_SCGC6_ADC0_MASK );

        SIM_SOPT7 &= ~(SIM_SOPT7_ADC0ALTTRGEN_MASK  |
                      SIM_SOPT7_ADC0PRETRGSEL_MASK);
        SIM_SOPT7 = SIM_SOPT7_ADC0TRGSEL(0);
    }
    else if(MoudelNumber == 1)//ģ��1
    {      
        SIM_SCGC3 |= (SIM_SCGC3_ADC1_MASK );

        SIM_SOPT7 &= ~(SIM_SOPT7_ADC1ALTTRGEN_MASK  |
                      SIM_SOPT7_ADC1PRETRGSEL_MASK) ;
        SIM_SOPT7 = SIM_SOPT7_ADC1TRGSEL(0);
    }
    else
    {
        return 0;
    }
    
    return 1;
}



//============================================================================
//�������ƣ�hw_ad_once
//�������أ��޷��Ž��ֵ(��Χ:0-4095) 
//����˵����MoudelNumber��ģ���
//               Channel��ͨ����
//              accuracy������
//���ܸ�Ҫ���ɼ�һ��һ·ģ������ADֵ    
//============================================================================
uint16 hw_ad_once(int MoudelNumber,int Channel,uint8 accuracy)//�ɼ�ĳ·ģ������ADֵ
{
    uint16 result = 0;
    //��ʼADCת��
    hw_adc_convertstart(MoudelNumber, Channel, accuracy);	

    if(MoudelNumber == 0)
    {
        while (( ADC0_SC1A & ADC_SC1_COCO_MASK ) != ADC_SC1_COCO_MASK)
        {

        }
        result = ADC0_RA;        
        ADC0_SC1A &= ~ADC_SC1_COCO_MASK;
    }
    else
    {
        while (( ADC1_SC1A & ADC_SC1_COCO_MASK ) != ADC_SC1_COCO_MASK)
        {

        }
        result = ADC1_RA;        
        ADC1_SC1A &= ~ADC_SC1_COCO_MASK;
    }

    return result;
}

//============================================================================
//�������ƣ�hw_ad_mid
//�������أ��޷��Ž��ֵ(��Χ:0-4095) 
//����˵����MoudelNumber��ģ���
//               Channel��ͨ����
//              accuracy������
//���ܸ�Ҫ����ֵ�˲���Ľ��(��Χ:0-4095) 
//============================================================================
uint16 hw_ad_mid(int MoudelNumber,int Channel,uint8 accuracy) //��ֵ�˲�
{
	uint16 i,j,k,tmp;
	//1.ȡ3��A/Dת�����
	i = hw_ad_once(MoudelNumber,Channel,accuracy);
	j = hw_ad_once(MoudelNumber,Channel,accuracy);
	k = hw_ad_once(MoudelNumber,Channel,accuracy);
	//2.ȡ��ֵ
	if (i > j)
	{
		tmp = i; i = j; j = tmp;
	}
	if (k > j) 
	  tmp = j;
	else if(k > i) 
	  tmp = k; 
    else 
      tmp = i;
	return tmp;
}

//============================================================================
//�������ƣ�hw_ad_ave
//�������أ��޷��Ž��ֵ(��Χ:0-4095) 
//����˵����MoudelNumber��ģ���
//               Channel��ͨ����
//              accuracy������
//                     N:��ֵ�˲�����(��Χ:0~255)
//���ܸ�Ҫ����ֵ�˲���ĽǶȽ��(��Χ:0-4095) 
//============================================================================
uint16 hw_ad_ave(int MoudelNumber,int Channel,uint8 accuracy,uint8 N) //��ֵ�˲�
{
	uint32 tmp = 0;
	uint8  i;
    for(i = 0; i < N; i++)
		tmp += hw_ad_mid(MoudelNumber,Channel,accuracy);
	tmp = tmp / N; 
    return (uint16)tmp;
}
//============================================================================
//��������:hw_angle_convert()
//��������:�޷��Ž��ֵ
//����˵��:
//���ܸ�Ҫ:�Ƕ�ת��
//============================================================================
/*void Angle_convert()
{
  float Rz, Angle;                            //Ҫ����Ϊȫ�ֱ���
  Rz=180/(Z_MAX-Z_MIN);                       //��ʵ����Z_MAX,Z_MIN
  g_fGravityAngle=Rz*(hw_ad_ave(int MoudelNumber,int Channel,uint8 accuracy,uint8 N)-C_ANGLE);
  return  g_fGravityAngle;
}*/


//============================================================================
//�������ƣ�hw_Angleconvert()
//�������أ��޷��Ž��ֵ(��Χ:0-4095) 
//����˵����
//���ܸ�Ҫ���Ƕ�ת��(��Χ:0-4095) 
//============================================================================
/*void hw_AngleSpeedconvert(void)
{
  float AngleSpeed;
  //Rgyro=Rad/(Rg*K)
  AngleSpeed=R_GYRO*(hw_ad_ave(int MoudelNumber,int Channel,uint8 accuracy,uint8 N)-GYROSCOPE_OFFSET);
  return AngleSpeed;
}*/
//============================================================================
//�������ƣ�hw_adc_convertstart
//�������أ�0 �ɹ� ��1 ʧ��
//����˵����MoudelNumber��ģ���
//               Channel��ͨ����
//              accuracy������
//���ܸ�Ҫ����ʼadcת��
//============================================================================
uint8 hw_adc_convertstart(int MoudelNumber,int Channel,uint8 accuracy)
{
    uint8 ADCCfg1Mode = 0;
    
    switch(accuracy)
    {
      case 8:
        ADCCfg1Mode = 0x00;
        break;
      case 12:
        ADCCfg1Mode = 0x01;
        break;
      case 10:
        ADCCfg1Mode = 0x02;
        break;
      case 16:
        ADCCfg1Mode = 0x03;
        break;
      default:
        ADCCfg1Mode = 0x00;
    }
    
  
    //��ʼ��ADCĬ������
    Master_Adc_Config.CONFIG1  = ADLPC_NORMAL
                              | ADC_CFG1_ADIV(ADIV_4)
                              | ADLSMP_LONG
                              | ADC_CFG1_MODE(ADCCfg1Mode)
                              | ADC_CFG1_ADICLK(ADICLK_BUS);
    Master_Adc_Config.CONFIG2  = MUXSEL_ADCA
                              | ADACKEN_DISABLED
                              | ADHSC_HISPEED
                              | ADC_CFG2_ADLSTS(ADLSTS_20) ;
    Master_Adc_Config.COMPARE1 = 0x1234u ;                 //����ֵ
    Master_Adc_Config.COMPARE2 = 0x5678u ;                 //����ֵ
                                                          
    
    if(MoudelNumber == 0)
    {
        if(Channel<=3)
        {
            Master_Adc_Config.STATUS1A = AIEN_ON | DIFF_SINGLE | ADC_SC1_ADCH(Channel);
            hw_adc_config_alt(ADC0_BASE_PTR, &Master_Adc_Config);  // ���� ADC0
        }
        
        else if(Channel>3&&Channel<24)                             //4~23 ʹ�� ADC0
        {
            Master_Adc_Config.STATUS1A = AIEN_ON | DIFF_SINGLE | ADC_SC1_ADCH(Channel);
            hw_adc_config_alt(ADC0_BASE_PTR, &Master_Adc_Config);  // ���� ADC0
        }
        else if(Channel == 26)
        {
            Master_Adc_Config.STATUS1A = AIEN_ON | DIFF_SINGLE | ADC_SC1_ADCH(Channel);
            hw_adc_config_alt(ADC0_BASE_PTR, &Master_Adc_Config);  // ����ADC0
        }
        else
        {
            return 0;
        }
    }
    else
    {
        if(Channel<=3)
        {
            Master_Adc_Config.STATUS1A = AIEN_ON | DIFF_SINGLE | ADC_SC1_ADCH(Channel);
            hw_adc_config_alt(ADC0_BASE_PTR, &Master_Adc_Config);  // ���� ADC0
        }
        
        if(Channel>3&&Channel<24)                             //4~23 ʹ�� ADC1
        {
            Master_Adc_Config.STATUS1A = AIEN_ON | DIFF_SINGLE | ADC_SC1_ADCH(Channel);
            hw_adc_config_alt(ADC1_BASE_PTR, &Master_Adc_Config);  // ����ADC1
        }
        else if(Channel == 26)
        {
            Master_Adc_Config.STATUS1A = AIEN_ON | DIFF_SINGLE | ADC_SC1_ADCH(Channel);
            hw_adc_config_alt(ADC1_BASE_PTR, &Master_Adc_Config);  // ����ADC1
        }
        else
        {
            return 0;
        }
    }
    return 1;
}
//============================================================================
//�������ƣ�hw_adc_config_alt
//�������أ��޷��Ž��ֵ(��Χ:0-4095) 
//����˵����adcmap��adc��ַ�Ĵ�����ַ
//          ADC_CfgPtr: ��� �Ĵ���ֵ�Ľṹ��    
//���ܸ�Ҫ����adc�Ĵ����ṹ�����ý�adc�Ĵ��� 
//============================================================================
void ADC_Config_Alt(ADC_MemMapPtr adcmap, tADC_ConfigPtr ADC_CfgPtr)
{
    ADC_CFG1_REG(adcmap) = ADC_CfgPtr->CONFIG1;
    ADC_CFG2_REG(adcmap) = ADC_CfgPtr->CONFIG2;
    ADC_CV1_REG(adcmap)  = ADC_CfgPtr->COMPARE1; 
    ADC_CV2_REG(adcmap)  = ADC_CfgPtr->COMPARE2;
    ADC_SC2_REG(adcmap)  = ADC_CfgPtr->STATUS2;
    ADC_SC3_REG(adcmap)  = ADC_CfgPtr->STATUS3;
    ADC_PGA_REG(adcmap)  = ADC_CfgPtr->PGA;
    ADC_SC1_REG(adcmap,A)= ADC_CfgPtr->STATUS1A;       
    ADC_SC1_REG(adcmap,B)= ADC_CfgPtr->STATUS1B;
}


void hw_adc_config_alt(ADC_MemMapPtr adcmap, tADC_ConfigPtr ADC_CfgPtr)
{
    ADC_CFG1_REG(adcmap) = ADC_CfgPtr->CONFIG1;
    ADC_CFG2_REG(adcmap) = ADC_CfgPtr->CONFIG2;
    ADC_CV1_REG(adcmap)  = ADC_CfgPtr->COMPARE1; 
    ADC_CV2_REG(adcmap)  = ADC_CfgPtr->COMPARE2;
    ADC_SC2_REG(adcmap)  = ADC_CfgPtr->STATUS2;
    ADC_SC3_REG(adcmap)  = ADC_CfgPtr->STATUS3;
    ADC_PGA_REG(adcmap)  = ADC_CfgPtr->PGA;
    ADC_SC1_REG(adcmap,A)= ADC_CfgPtr->STATUS1A;       
    ADC_SC1_REG(adcmap,B)= ADC_CfgPtr->STATUS1B;
}

//============================================================================
//�������ƣ�hw_adc_convertstop
//�������أ�0 �ɹ� ��1 ʧ��
//����˵����MoudelNumber��ģ���
//               Channel��ͨ����
//���ܸ�Ҫ��ֹͣADCת��  
//============================================================================
uint8 hw_adc_convertstop(int MoudelNumber,int Channel)
{
    if(MoudelNumber == 0)
    {
        if(Channel>3&&Channel<24)                             //4~23 ʹ�� ADC0
        {
            Master_Adc_Config.STATUS1A = AIEN_ON | DIFF_SINGLE | ADC_SC1_ADCH(0x1F);
            ADC_Config_Alt(ADC0_BASE_PTR, &Master_Adc_Config);  // ����ADC0
        }
        else if(Channel == 26)
        {
            Master_Adc_Config.STATUS1A = AIEN_ON | DIFF_SINGLE | ADC_SC1_ADCH(0x1F);
            ADC_Config_Alt(ADC0_BASE_PTR, &Master_Adc_Config);  // ����ADC0
        }
        else
        {
            return 0;
        }
    }
    else if(MoudelNumber == 1)
    {
        if(Channel>3&&Channel<24)                             //4~23 ʹ�� ADC1
        {
            Master_Adc_Config.STATUS1A = AIEN_ON | DIFF_SINGLE | ADC_SC1_ADCH(0x1F);
            ADC_Config_Alt(ADC1_BASE_PTR, &Master_Adc_Config);  //  ����ADC1
        }
        else if(Channel == 26)
        {
            Master_Adc_Config.STATUS1A = AIEN_ON | DIFF_SINGLE | ADC_SC1_ADCH(0x1F);
            ADC_Config_Alt(ADC1_BASE_PTR, &Master_Adc_Config);  //  ����ADC1
        }
        else
        {
            return 0;
        }
    }
    else
    {
        return 0;
    }
    return 1;
}