#line 1 "C:/Users/uemin/Desktop/GitHub/Trudyo/Program/Development Board/06-ADC Uygulamasi/main.c"
unsigned int t1,t2;
#line 1 "c:/users/uemin/desktop/github/trudyo/program/development board/06-adc uygulamasi/connection.c"

unsigned short LATF=0;
sbit LATF0_bit at LATF.B0;
sbit LATF1_bit at LATF.B1;
sbit LATF2_bit at LATF.B2;
sbit LATF3_bit at LATF.B3;
sbit LATF4_bit at LATF.B4;
sbit LATF5_bit at LATF.B5;
sbit LATF6_bit at LATF.B6;
sbit LATF7_bit at LATF.B7;
unsigned short LATG=0;
sbit LATG0_bit at LATG.B0;
sbit LATG1_bit at LATG.B1;
sbit LATG2_bit at LATG.B2;
sbit LATG3_bit at LATG.B3;
sbit LATG4_bit at LATG.B4;
sbit LATG5_bit at LATG.B5;
sbit LATG6_bit at LATG.B6;
sbit LATG7_bit at LATG.B7;
unsigned short LATH=0;
sbit LATH0_bit at LATH.B0;
sbit LATH1_bit at LATH.B1;
sbit LATH2_bit at LATH.B2;
sbit LATH3_bit at LATH.B3;
sbit LATH4_bit at LATH.B4;
sbit LATH5_bit at LATH.B5;
sbit LATH6_bit at LATH.B6;
sbit LATH7_bit at LATH.B7;
unsigned short LATI=0;
sbit LATI0_bit at LATI.B0;
sbit LATI1_bit at LATI.B1;
sbit LATI2_bit at LATI.B2;
sbit LATI3_bit at LATI.B3;
sbit LATI4_bit at LATI.B4;
sbit LATI5_bit at LATI.B5;
sbit LATI6_bit at LATI.B6;
sbit LATI7_bit at LATI.B7;
unsigned short PORTI=0;
sbit PORTI0_bit at PORTI.B0;
sbit PORTI1_bit at PORTI.B1;
sbit PORTI2_bit at PORTI.B2;
sbit PORTI3_bit at PORTI.B3;
sbit PORTI4_bit at PORTI.B4;
sbit PORTI5_bit at PORTI.B5;
sbit PORTI6_bit at PORTI.B6;
sbit PORTI7_bit at PORTI.B7;


sbit LED at LATA4_bit;


sbit SEG1H at LATF0_bit;
sbit SEG1B at LATF1_bit;
sbit SEG1C at LATF2_bit;
sbit SEG1A at LATF3_bit;
sbit SEG1F at LATF4_bit;
sbit SEG1D at LATF5_bit;
sbit SEG1G at LATF6_bit;
sbit SEG1E at LATF7_bit;

sbit SEG2H at LATG0_bit;
sbit SEG2B at LATG1_bit;
sbit SEG2C at LATG2_bit;
sbit SEG2A at LATG3_bit;
sbit SEG2F at LATG4_bit;
sbit SEG2D at LATG5_bit;
sbit SEG2G at LATG6_bit;
sbit SEG2E at LATG7_bit;


sbit LED01 at LATH0_bit;
sbit LED02 at LATH1_bit;
sbit LED03 at LATH2_bit;
sbit LED04 at LATH3_bit;
sbit LED05 at LATH4_bit;
sbit LED06 at LATH5_bit;
sbit LED07 at LATH6_bit;
sbit LED08 at LATH7_bit;


sbit DIP01 at PORTI0_bit;
sbit DIP02 at PORTI1_bit;
sbit DIP03 at PORTI2_bit;
sbit DIP04 at PORTI3_bit;
sbit DIP05 at PORTI4_bit;
sbit DIP06 at PORTI5_bit;
sbit DIP07 at PORTI6_bit;
sbit DIP08 at PORTI7_bit;


sbit BUTTON_MENU at RB2_bit;
sbit BUTTON_OK at RB5_bit;
sbit BUTTON_UP at RB6_bit;
sbit BUTTON_DOWN at RB7_bit;


sbit LEDR at LATD0_bit;
sbit LEDG at LATC2_bit;
sbit LEDB at LATD1_bit;


sbit IN1 at LATD1_bit;
sbit IN2 at LATD0_bit;
sbit IN3 at LATC2_bit;
sbit IN4 at LATB4_bit;


sbit BUZZER at LATA2_bit;


sbit EXT_OUT at LATC1_bit;
sbit EXT_IN at RC0_bit;


sbit RELAY at LATA0_bit;


sbit DIPSW at RA5_bit;


sbit DS at LATB3_bit;
sbit SH_CP at LATE2_bit;
sbit ST_CP at LATE1_bit;


sbit LCD_RS at LATD7_bit;
sbit LCD_EN at LATD6_bit;
sbit LCD_D4 at LATD5_bit;
sbit LCD_D5 at LATD4_bit;
sbit LCD_D6 at LATD3_bit;
sbit LCD_D7 at LATD2_bit;

sbit LCD_RS_Direction at TRISD7_bit;
sbit LCD_EN_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD2_bit;
#line 1 "c:/users/uemin/desktop/github/trudyo/program/development board/06-adc uygulamasi/function.c"
void wait(unsigned int time){
 unsigned int i;

 for(i=0;i<time;i++){
 delay_ms(1);
 asm clrwdt;
 }
}

void UpdateExternalPorts(){
 unsigned short i,buffer;

 if(LATI==0b00000000)
 LATI=0b00000001;

 ST_CP=0;
 SH_CP=0;
 DS=0;


 buffer=LATF;
 for(i=0;i<8;i++){
 if(buffer.B7)
 DS=1;
 else
 DS=0;

 SH_CP=1;
 asm nop;
 SH_CP=0;

 buffer<<=1;
 }


 buffer=LATG;
 for(i=0;i<8;i++){
 if(buffer.B7)
 DS=1;
 else
 DS=0;

 SH_CP=1;
 asm nop;
 SH_CP=0;

 buffer<<=1;
 }


 buffer=LATH;
 for(i=0;i<8;i++){
 if(buffer.B7)
 DS=1;
 else
 DS=0;

 SH_CP=1;
 asm nop;
 SH_CP=0;

 buffer<<=1;
 }


 buffer=LATI;
 for(i=0;i<8;i++){
 if(buffer.B7)
 DS=1;
 else
 DS=0;

 SH_CP=1;
 asm nop;
 SH_CP=0;

 buffer<<=1;
 }
 ST_CP=1;
 asm nop;
 ST_CP=0;

 switch(LATI){
 case 0b00000001:
 PORTI0_bit=DIPSW;
 break;
 case 0b00000010:
 PORTI1_bit=DIPSW;
 break;
 case 0b00000100:
 PORTI2_bit=DIPSW;
 break;
 case 0b00001000:
 PORTI3_bit=DIPSW;
 break;
 case 0b00010000:
 PORTI4_bit=DIPSW;
 break;
 case 0b00100000:
 PORTI5_bit=DIPSW;
 break;
 case 0b01000000:
 PORTI6_bit=DIPSW;
 break;
 case 0b10000000:
 PORTI7_bit=DIPSW;
 break;
 }
 LATI<<=1;
}
#line 1 "c:/users/uemin/desktop/github/trudyo/program/development board/06-adc uygulamasi/display.c"
char getChar(char c){
 switch(c){
 case 'A': return 0xDE;
 case 'B': return 0xF4;
 case 'C': return 0xB8;
 case 'D': return 0xE6;
 case 'E': return 0xF8;
 case 'F': return 0xD8;
 case 'G': return 0xBC;
 case 'H': return 0xD6;
 case 'I': return 0x06;
 case 'J': return 0xA6;
 case 'K': return 0xD4;
 case 'L': return 0xB0;
 case 'M': return 0xCC;
 case 'N': return 0xC4;
 case 'O': return 0xE4;
 case 'P': return 0xDA;
 case 'Q': return 0x5E;
 case 'R': return 0xC0;
 case 'S': return 0x7C;
 case 'T': return 0xF0;
 case 'U': return 0xB6;
 case 'V': return 0xA4;
 case 'Y': return 0x76;
 case 'Z': return 0xEA;
 case '0': return 0xBE;
 case '1': return 0x06;
 case '2': return 0xEA;
 case '3': return 0x6E;
 case '4': return 0x56;
 case '5': return 0x7C;
 case '6': return 0xFC;
 case '7': return 0x0E;
 case '8': return 0xFE;
 case '9': return 0x7E;
 case ' ': return 0x00;
 }
 return 0;
}

void PrintText(char *str){
 LATF=getChar(str[0]);
 LATG=getChar(str[1]);
}
void PrintInt(unsigned short number){

 if(number>99)
 number=number%100;

 LATF=getChar(number/10+48);
 LATG=getChar(number%10+48);
}
#line 1 "c:/users/uemin/desktop/github/trudyo/program/development board/06-adc uygulamasi/initialize.c"

void InitTimer2(){
 T2CON = 0x76;
 TMR2IE_bit = 1;
 PR2 = 250;
 INTCON = 0xC0;
}

void InitMCU(){

 TRISA=0b00101010;
 TRISB=0b11100100;
 TRISC=0b10000001;
 TRISD=0b00000000;
 TRISE=0b00000000;


 ANSELA=0b00001010;
 ANSELB=0b00000000;
 ANSELC=0b00000000;
 ANSELD=0b00000000;
 ANSELE=0b00000000;


 LATA=0x00;
 LATB=0x00;
 LATC=0x00;
 LATD=0x00;
 LATE=0x00;


 InitTimer2();


 UART1_Init(9600);


 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);
}
#line 1 "c:/users/uemin/desktop/github/trudyo/program/development board/06-adc uygulamasi/interrupt.c"
void Interrupt(){

 if (TMR2IF_bit){
 TMR2IF_bit = 0;

 UpdateExternalPorts();
 }
}
#line 1 "c:/users/uemin/desktop/github/trudyo/program/development board/06-adc uygulamasi/ds18b20.c"






float ReadDS18B20(){
 signed short sign=1;
 unsigned short tempDataMSB, tempDataLSB;
 unsigned int tempData;
 float temperature=0;

 Ow_Reset(&PORTE,0);
 Ow_Write(&PORTE,0,0xCC);
 Ow_Write(&PORTE,0,0x44);
 Delay_us(120);

 Ow_Reset(&PORTE,0);
 Ow_Write(&PORTE,0,0xCC);
 Ow_Write(&PORTE,0,0xBE);

 tempDataLSB=Ow_Read(&PORTE,0);
 tempDataMSB=Ow_Read(&PORTE,0);

 tempData=tempDataMSB;
 tempData<<=8;
 tempData+=tempDataLSB;


 if(tempData>0xF800){
 tempData=~tempData+1;
 sign=-1;
 }

 temperature = (tempData>>4);
 temperature+= 0.0625*(tempData&0x000F);

 return (float)sign*temperature;
}
#line 10 "C:/Users/uemin/Desktop/GitHub/Trudyo/Program/Development Board/06-ADC Uygulamasi/main.c"
void main() {
 InitMCU();

 Lcd_Out(1,1,"6.ADC Uygulamasi");
 Lcd_Out(2,1,"T1:0000  T2:0000");

 while(1){
 t1=ADC_Read(1);
 t2=ADC_Read(3);
#line 37 "C:/Users/uemin/Desktop/GitHub/Trudyo/Program/Development Board/06-ADC Uygulamasi/main.c"
 Lcd_Chr(2,4,(t1/1000+48));
 Lcd_Chr(2,5,((t1%1000)/100+48));
 Lcd_Chr(2,6,((t1%100)/10+48));
 Lcd_Chr(2,7,(t1%10+48));

 Lcd_Chr(2,13,(t2/1000+48));
 Lcd_Chr(2,14,((t2%1000)/100+48));
 Lcd_Chr(2,15,((t2%100)/10+48));
 Lcd_Chr(2,16,(t2%10+48));

 wait(100);
 }
}
