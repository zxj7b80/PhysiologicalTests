#ifndef __CONTROL_H__
#define __CONTROL_H__
//1 м╥нд╪Ч
#include "common.h"

#define DIR_PORT_BASE PTB_BASE_PTR //PORTB
#define MOTOR_LEFT     0
#define MOTOR_RIGHT    1
#define DIR_LEFT_B   GPIO_PDOR_REG(DIR_PORT_BASE) |= (1<<9);//PB9
#define DIR_LEFT_F   GPIO_PDOR_REG(DIR_PORT_BASE) &= ~(1<<9);//PB9
#define DIR_RIGHT_B  GPIO_PDOR_REG(DIR_PORT_BASE) |= (1<<12);//PA12
#define DIR_RIGHT_F  GPIO_PDOR_REG(DIR_PORT_BASE) &= ~(1<<12);//PA12


void Car_Control_PWM(uint8 motor,int pwmin);

void GetSamplezhi();
void GetOFFSET();
void get_ad();

void GetMotorPulse(void);

void shache1();
void Speed_PID();
int  Abs(int a);
#endif