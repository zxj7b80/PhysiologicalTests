#ifndef __Command_analy_H_
#define __Command_analy_H_

#include <string.h>
#include "common.h"

extern uint8 motor_run_pos;
extern uint8 motor_run_nag;
extern uint8 motor_stop;
extern uint8 run_constant_angle_pos;
extern uint8 run_constant_angle_nag;
extern uint8 test_start;
extern uint8 DM_start;
extern double constant_angle;

extern void Command_analy(uint8 *buf);
#endif