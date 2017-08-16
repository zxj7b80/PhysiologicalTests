#ifndef __MMA8451_H__
#define __MMA8451_H__

//1 Í·ÎÄ¼þ
#include "common.h"

#define	SlaveAddress   0x38

#define SCL_SET()  gpio_ctrl(PORTC,4,1)
#define SCL_CLR()  gpio_ctrl(PORTC,4,0)
#define SDA_SET()  gpio_ctrl(PORTC,6,1)
#define SDA_CLR()  gpio_ctrl(PORTC,6,0)

void   MMA8452_Start();
void   MMA8452_Stop();
uint8  MMA8452_RecvACK();
void   MMA8452_SendByte(uint8 dat);
void   Single_Write_MMA8452(uint8 REG_Address,uint8 REG_data);   
void   Init_MMA8452(void); 

void   MMA8452_SendACK(uint8 ack);
uint8  MMA8452_RecvByte();
void   Multiple_Read_MMA8452();

#endif