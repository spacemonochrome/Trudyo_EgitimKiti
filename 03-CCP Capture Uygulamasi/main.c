// Not: IN4 headeri ile PWM headerini jumper kablo ile birlestiriniz. 
//      initialize.c ve interrupt.c dosyalarina eklemeler yapilmistir.
unsigned int i;
unsigned int counter=0;
char txt[7];

#include "connection.c"
#include "function.c"
#include "display.c"
#include "initialize.c"
#include "interrupt.c"
#include "DS18B20.c"

void main() {
  InitMCU();

  Lcd_Out(1,1,"3.CCP Capture   ");    // Ekranda 1.satir 1.sütundan itibaren yaz
  Lcd_Out(2,1,"Capture Cnt:   0");    // Ekranda 2.satir 1.sütundan itibaren yaz
  
  while(1){
    counter =0;             // Sayac sifirlaniyor;
    
    // 100 adet IN4 sinyali gonderiliyor
    for(i=0;i<1600;i++){
      IN4=1;                // IN4 cikisini aktif et
      delay_us(1);          // 1ms bekle
      IN4=0;                // IN4 cikisini pasif et
      delay_us(1);          // 1ms bekle
    }
    
    IntToStr(counter,txt);  // Sayac degerini txt dizisine karakter karakter yaz
    Lcd_Chr(2,13,txt[2]);   // 1.karakteri 13.sutuna yaz
    Lcd_Chr(2,14,txt[3]);   // 2.karakteri 14.sutuna yaz
    Lcd_Chr(2,15,txt[4]);   // 3.karakteri 15.sutuna yaz
    Lcd_Chr(2,16,txt[5]);   // 4.karakteri 16.sutuna yaz
  }
}