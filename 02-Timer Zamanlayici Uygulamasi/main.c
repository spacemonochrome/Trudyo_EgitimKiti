// Not: Bu uygulamada Timer Calculator kullanilmistir. 
//      Indirmek icin: https://libstock.mikroe.com/projects/download/398/4397/1468924105_timer_calculator_other_other.zip
//      initialize.c ve interrupt.c dosyalarina eklemeler yapilmistir.
unsigned short number=0;

#include "connection.c"
#include "function.c"
#include "display.c"
#include "initialize.c"
#include "interrupt.c"
#include "DS18B20.c"

void main() {
  InitMCU();

  while(1){
    Lcd_Out(1,1,"2.TMR0 Zamanlayici");    // Ekranda 1.satir 1.sütundan itibaren yaz
    
    if(!BUTTON_MENU)                     // Eger Menu butonuna basilirsa
      number=0;                          // sayiyi sifir yap

    PrintInt(number);                    // 7 Segment ekrana sayiyi yazdir
    delay_ms(50);                        // 50ms bekleme
  }
}