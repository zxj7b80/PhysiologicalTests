#include "Command_analy.h"

uint8 motor_run_pos=0;
uint8 motor_run_nag=0;
uint8 motor_stop=0;
uint8 run_constant_angle_pos=0;
uint8 run_constant_angle_nag=0;
uint8 test_start=0;
uint8 DM_start=0;
uint8 MachineReset=0;
double constant_angle=0;
extern int FTM_Count;
uint8  FrequenceFlag=0;
extern int16 g_nMotorPulseSigma;
uint8 DelayTimeChange=0;
extern uint16 base;
uint16 DelayTime=0;
extern uint8 DelayTimeChange;

//====================================================================//
// 语法格式:  void Command_analy(uchar *buf)
// 实现功能： 解析收到的字符串
// 参    数： 字符串
// 返 回 值： 转化后双精度值
//====================================================================//
void Command_analy(uint8 *buf)
{
	double rev = 0;
	double dat;
	int integer = 1;
	uint8 *str = buf;
	int i;
	while(*str != '*')
	{
		switch(*str)
		{
			case '0':
				dat = 0;
				break;
			case '1':
				dat = 1;
				break;
			case '2':
				dat = 2;
				break;		
			case '3':
				dat = 3;
				break;
			case '4':
				dat = 4;
				break;
			case '5':
				dat = 5;
				break;
			case '6':
				dat = 6;
				break;
			case '7':
				dat = 7;
				break;
			case '8':
				dat = 8;
				break;
			case '9':
				dat = 9;
				break;
			case '.':
				dat = '.';
				break;
                        case '+':
                                run_constant_angle_nag=1;
                                run_constant_angle_pos=0;
                                motor_run_nag=0;
                                motor_run_pos=0;
                                DM_start=0;
                                test_start=0;
                                MachineReset=0;
                                break;
                        case '-':
                                run_constant_angle_nag=0;
                                run_constant_angle_pos=1;
                                motor_run_nag=0;
                                motor_run_pos=0;
                                DM_start=0;
                                test_start=0;
                                MachineReset=0;
                                break;
                        case 'P':
                                run_constant_angle_nag=0;
                                run_constant_angle_pos=0;
                                motor_run_nag=1;
                                motor_run_pos=0;
                                DM_start=0;
                                test_start=0;
                                MachineReset=0;
                                break;
                        case 'N':
                                run_constant_angle_nag=0;
                                run_constant_angle_pos=0;
                                motor_run_nag=0;
                                motor_run_pos=1;
                                DM_start=0;
                                test_start=0;
                                MachineReset=0;
                                break;
                        case 'S':
                                motor_stop=1;
                                break;
                        case 'D':
                                DelayTimeChange=1;
                                break;
                        case 'A':
                                run_constant_angle_nag=0;
                                run_constant_angle_pos=0;
                                motor_run_nag=0;
                                motor_run_pos=0;
                                DM_start=1;
                                test_start=0;
                                MachineReset=0;
                                break;  
                        case 'B':
                                run_constant_angle_nag=0;
                                run_constant_angle_pos=0;
                                motor_run_nag=0;
                                motor_run_pos=0;
                                DM_start=0;
                                test_start=1;
                                MachineReset=0;
                                g_nMotorPulseSigma=0;
                                break;
                        case 'R':
                                run_constant_angle_nag=0;
                                run_constant_angle_pos=0;
                                motor_run_nag=0;
                                motor_run_pos=0;
                                DM_start=0;
                                test_start=0;
                                MachineReset=1;
                                g_nMotorPulseSigma=0;
                                break; 
                        default:
                                break;
		}
		if(dat == '.')
		{
			integer = 0;
			i = 1;
			str ++;
			continue;
		}
		if( integer == 1 )
		{
			rev = rev * 10 + dat;
		}
		else
		{
			rev = rev + dat / (10 * i);
			i = i * 10 ;
		}
		str ++;
	}
        if((run_constant_angle_pos==1||run_constant_angle_nag==1)&&DM_start==0)
        {
          enable_irq(63);
          FTM_Count=0; 
        }
	constant_angle = rev;
        
        //延时设置---
        if(DelayTimeChange==1)
        {
          DelayTimeChange=0;
          if(constant_angle>=0&&constant_angle<=100)
            base=100;
          else if(constant_angle>100&&constant_angle<=5000)
            base=(uint16)constant_angle;
          else if(constant_angle>5000)
            base=5000;
        }
        
}