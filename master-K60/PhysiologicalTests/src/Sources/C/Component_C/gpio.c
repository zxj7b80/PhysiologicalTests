//-------------------------------------------------------------------------*
// �ļ���: gpio.c                                                          *
// ˵  ��: gpio���������ļ�                                                *
//-------------------------------------------------------------------------*

#include "gpio.h"     //����gpioͷ�ļ�

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
void gpio_init(GPIO_MemMapPtr port, int index, int dir,int data)
{
     PORT_MemMapPtr p;
     switch((uint32)port)
     {
     case 0x400FF000u:
         p = PORTA_BASE_PTR;
         break;
     case 0x400FF040u:
         p = PORTB_BASE_PTR;
         break;
     case 0x400FF080u:
         p = PORTC_BASE_PTR;
         break;
     case 0x400FF0C0u:
         p = PORTD_BASE_PTR;
         break;
     case 0x400FF100u:
         p = PORTE_BASE_PTR;
         break;
     default:
         break;
     }
     PORT_PCR_REG(p,index)=(0|PORT_PCR_MUX(1));

     if(dir == 1)//output
     {
    	 GPIO_PDDR_REG(port) |= (1<<index);
    	 if(data == 1)
           GPIO_PDOR_REG(port) |= (1<<index);
         else
           GPIO_PDOR_REG(port) &= ~(1<<index);
     }       
     else
         GPIO_PDDR_REG(port) &= ~(1<<index);

}

//-------------------------------------------------------------------------* 
//������: gpio_ctrl                                                        *
//��  ��: ��������״̬                                                     *
//��  ��: port:�˿���                                                      *
//        index:ָ���˿�����                                               *
//        data: ״̬,0=�͵�ƽ,1=�ߵ�ƽ                                     *
//��  ��: ��                                                               *
//˵  ��: ��                                                               *
//-------------------------------------------------------------------------*
void gpio_ctrl (GPIO_MemMapPtr port, int index, int data)
{
    if(data == 1)//output
         GPIO_PDOR_REG(port) |= (1<<index);
    else
         GPIO_PDOR_REG(port) &= ~(1<<index);
}

//-----------------------------------------------------------------------* 
//������: gpio_reverse                                                   *
//��  ��: �ı�����״̬                                                   *
//��  ��: port:�˿���;                                                   *
//        index:ָ���˿�����                                             *
//��  ��: ��                                                             *
//˵  ��: ��                                                             *
//-----------------------------------------------------------------------*
void gpio_reverse (GPIO_MemMapPtr port, int index)
{
    GPIO_PDOR_REG(port) ^= (1<<index);
}

//-----------------------------------------------------------------------* 
//������: gpio_read                                                      *
//��  ��: ����������ŵ�״̬                                             *
//��  ��: port:�˿���;                                                   *
//        index:ָ���˿�����                                             *
//��  ��: ��                                                             *
//˵  ��: ��                                                             *
//-----------------------------------------------------------------------*
uint32 gpio_read(GPIO_MemMapPtr port,uint8 index)
{
  uint32 a;
  uint8  b;
  a=GPIO_PDIR_REG(port);
  b=(a&(1<<index))>>index;
  return b;
}

/*void hw_gpio_set(GPIO_MemMapPtr port, uint8 pin,uint8 state)
{
   GPIO_MemMapPtr pt=hw_gpio_get_pt_addr(port);
   if(state==0)
     (GPIO_PDOR_REG(pt))&=~(1<<(pin));
   else
     (GPIO_PDOR_REG(pt))|=(1<<(pin));
}

uint8 hw_gpio_get(GPIO_MemMapPtr port,uint8 pin)
{
  uint8 i;
  GPIO_MemMapPtr pt=hw_gpio_get_pt_addr(port);
  i=(((GPIO_PDOR_REG(pt))>>(pin))&1);
  return i;
}

GPIO_MemMapPtr hw_gpio_get_pt_addr(GPIO_MemMapPtr port)
{
   GPIO_MemMapPtr p;
   switch(port)
   {
      case 0x400FF000u:
         p = PORTA_BASE_PTR;
         break;
     case 0x400FF040u:
         p = PORTB_BASE_PTR;
         break;
     case 0x400FF080u:
         p = PORTC_BASE_PTR;
         break;
     case 0x400FF0C0u:
         p = PORTD_BASE_PTR;
         break;
     case 0x400FF100u:
         p = PORTE_BASE_PTR;
         break;
     default:
         break;
   }
   return p;
}*/

