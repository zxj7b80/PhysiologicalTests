#ifndef __UPMONITOR_H__
#define __UPMONITOR_H__
//1 Í·ÎÄ¼þ
#include "common.h"

void SendImageData(unsigned char * ImageData);
void virtual_scope_show(void);
void serial_Txd(void);
void serial_choose();

void virtual_scope_show(void);
void serial_Txd();
unsigned short CRC_CHECK(unsigned char *Buf, unsigned char CRC_CNT);
void OutPut_Data(void);
void SendHex(unsigned char hex);


void Clear();

#endif