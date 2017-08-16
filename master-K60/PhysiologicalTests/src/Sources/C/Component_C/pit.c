#include"pit.h"

//==========================================================================
//������:     void hw_pit_init(uint8 pitno,uint32 timeout)
//����:       ����pit��ʱ��
//��ڲ���:   pitno:  ��ʾpitͨ���š�
//                            0
//                            1
//                            2
//                            3
//            timeout:��ʾ��ʱ�����ʼ�ݼ���ֵ
//            ��ʱʱ����㹫ʽ   ��ʱ=(timeout+1)/bus_clk
//���ڲ���:   ��
//˵��:       ��       
//==========================================================================
void hw_pit_init(uint8 pitno,uint32 timeout)
{
  SIM_SCGC6|=SIM_SCGC6_PIT_MASK;              //ʹ��PITʱ��
  PIT_MCR&=~(PIT_MCR_MDIS_MASK);              //����ģʽ�½�ֹ
  PIT_MCR|=PIT_MCR_FRZ_MASK;                  //ʹ��PITģ��ʱ��
  PIT_LDVAL(pitno)=timeout;                   //��������1ms�ж�
  PIT_TCTRL(pitno)|=PIT_TCTRL_TEN_MASK;       //ʹ��pitģ������
  PIT_TCTRL(pitno)&=~(PIT_TCTRL_TIE_MASK);    //��pit�ж�
}

//==========================================================================
//������:    void enable_pit_interrupt(uint8 pitno)  
//����:      ���������ŵ�IRQ�ж�
//��ڲ���:  pitno: ��ʾpitͨ���� 
//                           0
//                           1
//                           2
//                           3
//���ڲ���:  ��
//˵��:      ��                                                                                                     
//==========================================================================
void enable_pit_interrupt(uint8 pitno)
{
  PIT_TCTRL(pitno)|=(PIT_TCTRL_TIE_MASK); //��pit�ж�
  switch(pitno)
  {
  case 0:
    enable_irq(68);			      //���������ŵ�IRQ�ж�
    break;
  case 1:
    enable_irq(69);			      //���������ŵ�IRQ�ж�
    break;
  case 2:
    enable_irq(70);			      //���������ŵ�IRQ�ж�
    break;
  case 3:
    enable_irq(71);			      //���������ŵ�IRQ�ж�
    break;
  }
}

//==========================================================================
//������:   void disable_pit_interrupt(uint8 pitno)
//����:     �ؽ������ŵ�IRQ�ж� 
//��ڲ���: pitno: ��ʾpitͨ���� 
//                           0
//                           1
//                           2
//                           3
//���ڲ���: ��  
//˵��:     ��                                                                                                    
//==========================================================================
void disable_pit_interrupt(uint8 pitno)
{
  PIT_TCTRL(pitno)&=~(PIT_TCTRL_TIE_MASK);//��pit�ж�
  switch(pitno)
  {
  case 0:
    disable_irq(68);	              //�ؽ������ŵ�IRQ�ж�
    break;
  case 1:
    disable_irq(69);		      //�ؽ������ŵ�IRQ�ж�
    break;
  case 2:
    disable_irq(70);		      //�ؽ������ŵ�IRQ�ж�
    break;
  case 3:
    disable_irq(71);		      //�ؽ������ŵ�IRQ�ж�
    break;
  }
}