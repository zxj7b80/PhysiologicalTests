//-------------------------------------------------------------------------*
// �ļ���: gpio.h                                                          *
// ˵  ��: gpio����ͷ�ļ�                                                  *
//-------------------------------------------------------------------------*

#ifndef __GPIO_H__
#define __GPIO_H__

    //1 ͷ�ļ�
    #include "common.h"
    
    //2 �궨��
    //2.1 �˿ں궨��
    #define PORTA PTA_BASE_PTR
    #define PORTB PTB_BASE_PTR
    #define PORTC PTC_BASE_PTR
    #define PORTD PTD_BASE_PTR
    #define PORTE PTE_BASE_PTR
    
    //3 ��������
    //-------------------------------------------------------------------------*
    //������: gpio_init                                                        *
    //��  ��: ��ʼ��gpio                                                       * 
    //��  ��: port:�˿���                                                      *
    //        index:ָ���˿�����                                               *
    //        dir:���ŷ���,0=����,1=���                                       * 
    //        data:��ʼ״̬,0=�͵�ƽ,1=�ߵ�ƽ                                  *
    //��  ��: ��                                                               *
    //˵  ��: ��                                                               *
    //-------------------------------------------------------------------------*
    void gpio_init (GPIO_MemMapPtr port, int index, int dir,int data);
    
    //-------------------------------------------------------------------------* 
    //������: gpio_ctrl                                                        *
    //��  ��: ��������״̬                                                     *
    //��  ��: port:�˿���                                                      *
    //        index:ָ���˿�����                                               *
    //        data: ״̬,0=�͵�ƽ,1=�ߵ�ƽ                                     *
    //��  ��: ��                                                               *
    //˵  ��: ��                                                               *
    //-------------------------------------------------------------------------*
    void gpio_ctrl (GPIO_MemMapPtr port, int index, int data);
    
    //-------------------------------------------------------------------------* 
    //������: gpio_reverse                                                     *
    //��  ��: �ı�����״̬                                                     *
    //��  ��: port:�˿���;                                                     *
    //        index:ָ���˿�����                                               *
    //��  ��: ��                                                               *
    //˵  ��: ��                                                               *
    //-------------------------------------------------------------------------*
    void gpio_reverse (GPIO_MemMapPtr port, int index);
    GPIO_MemMapPtr hw_gpio_get_pt_addr(uint8 port);
    uint8 hw_gpio_get(uint8 port,uint8 pin);
    void hw_gpio_set(uint8 port, uint8 pin,uint8 state);
    uint32 gpio_read(GPIO_MemMapPtr port,uint8 index);
#endif 
