#include <stc89c5xrc.h>

#define UINT8 unsigned char 


#define SYSCLK	11059200UL
//#define SYSCLK	12000000UL

#define _TH0(ms)	(((65536-(ms*SYSCLK/1000/12)&0xFF00)) >>8)
#define _TL0(ms)  	(((65536-(ms*SYSCLK/1000/12)&0x00FF)) >>0)


void initTime0(){
	
	TMOD = 0x01;//mode 1 16bit
	//TR0 =1;
}


void delay1MS(){
	
	UINT8	TH0_ = _TH0(1);
	UINT8	TL0_ = _TL0(1);
	
	TR0 = 0;

	TH0 = TH0_;
	TL0 = TL0_;
	TR0 = 1;

	while(!TF0);
	TF0 = 0;
	TR0 =0;
}

void delayMS(int ms){

	register int i = 0;

	for(i=0;i<ms;i++){
		delay1MS();
	}
}

int main(){



	initTime0();

	for(;;){
			
			P1 = 0x00;
			delayMS(50);
			P1 = 0xFF;
			delayMS(50);	
	}
	return 0;
}
