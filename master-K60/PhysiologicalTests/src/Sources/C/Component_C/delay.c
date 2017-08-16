#include"delay.h"
#include"includes.h"

void delay(uint32 a)//由什么决定执行一次命令的时间呢？ 
{
  uint32 i;
  for(i=0;i<a;i++);
}

void SamplingDelay(void)//CCD延时程序 200ns
{
   volatile uint8 i;
   for(i=0;i<1;i++)
   {
    asm("nop");
    asm("nop");
   }
}

void Delay5us()
{
  uint8 i=0;
  for(i = 0; i < 25; i++)
  {
    SamplingDelay();//200ns
  }
}

void Delay_us(int count)
{
  uint8 i=0;
  
  for(i = 0; i < count; i++)
  {
    SamplingDelay();//200ns
    SamplingDelay();//200ns
    SamplingDelay();//200ns
    SamplingDelay();//200ns
    SamplingDelay();//200ns
  }
}

void delay_ms(uint32 count_val)
{
  /* Make sure the clock to the LPTMR is enabled */
  SIM_SCGC5|=SIM_SCGC5_LPTIMER_MASK; 
  
  /* Set the compare value to the number of ms to delay */
  LPTMR0_CMR = count_val; 
  
  /* Set up LPTMR to use 1kHz LPO with no prescaler as its clock source */
  LPTMR0_PSR = LPTMR_PSR_PCS(1)|LPTMR_PSR_PBYP_MASK; 
  
  /* Start the timer */
  LPTMR0_CSR |= LPTMR_CSR_TEN_MASK; 

  /* Wait for counter to reach compare value */
  while (!(LPTMR0_CSR & LPTMR_CSR_TCF_MASK));
  
  /* Clear Timer Compare Flag */
  LPTMR0_CSR &= ~LPTMR_CSR_TEN_MASK;
  
  return;
}