//PIC18F45K50 Datasheet:https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/ProductDocuments/DataSheets/PIC18F2X_45K50-30000684B.pdf
// Not:  initialize.c dosyasina eklemeler yapilmistir.
//       PWM1 RGB LED'in yesil renkli LED pinine baglidir.
//       Klemens üzerindeki PWM cikisi için PWM2 kullanilmalidir.
unsigned short dutyCycle=0;
char txt[7];

#include "connection.c"
#include "function.c"
#include "display.c"
#include "initialize.c"
#include "interrupt.c"
#include "DS18B20.c"

void main() {
  InitMCU();

  
  // Uygulama 1
  // RGB LED'in Yesil Renkli LED'ine bagli bulunan PWM1 kanalinin duty cycle 
  // degerini 127'ye kadar artip daha sonra 0'a kadar düsüren ve bu islemi sürekli
  // tekrar eden program
  /*
  Lcd_Out(1,1,"5.CCP PWM       ");         // Ekranda 1.satir 1.sütundan itibaren yaz
  Lcd_Out(2,1,"F:5kHz Duty:Auto");         // Ekranda 2.satir 1.sütundan itibaren yaz
  while(1){
    for(dutyCycle=0;dutyCycle<127;dutyCycle++){
      PWM1_Set_Duty(dutyCycle);
      wait(25);
    }
    for(dutyCycle=127;dutyCycle>0;dutyCycle--){
      PWM1_Set_Duty(dutyCycle);
      wait(5);
    }
  }
  */
  
  // Uygulama 2
  // UP ve DOWN butonuna basildikca RGB LED'in Yesil Renkli LED'ine bagli
  // bulunan PWM1 kanalinin duty cycle degerini guncelleyerek Yesil LED'in
  // parlakligini kontrol eden program
  Lcd_Out(1,1,"5.CCP PWM       ");         // Ekranda 1.satir 1.sütundan itibaren yaz
  Lcd_Out(2,1,"F:5kHz Duty:   0");         // Ekranda 2.satir 1.sütundan itibaren yaz
  while(1){                                // Sonsuz dongu
    if(!BUTTON_UP && dutyCycle<255){       // UP butonuna basilmis ise ve dutyCycle degeri 255'ten kucuk ise
      dutyCycle+=5;                        // dutyCycle degerini bes arttir
      PWM1_Set_Duty(dutyCycle);            // PWM Duty degerini guncelle
      wait(100);                           // 100ms bekle -> delay_ms(100) fonksiyonu esdegeri
      IntToStr(dutyCycle,txt);             // Sayac degerini txt dizisine karakter karakter yaz
      Lcd_Chr(2,13,txt[2]);                // 1.karakteri 13.sutuna yaz
      Lcd_Chr(2,14,txt[3]);                // 2.karakteri 14.sutuna yaz
      Lcd_Chr(2,15,txt[4]);                // 3.karakteri 15.sutuna yaz
      Lcd_Chr(2,16,txt[5]);                // 4.karakteri 16.sutuna yaz
      while(!BUTTON_UP);                   // Butona hala basili ise buton birakilana kadar bekle
    }
    else if(!BUTTON_DOWN && dutyCycle>0){  // DOWN butonuna basilmis ise ve dutyCycle degeri 0'dan buyuk ise
      dutyCycle-=5;                        // dutyCycle degerini bes azalt
      PWM1_Set_Duty(dutyCycle);            // PWM Duty degerini guncelle
      wait(100);                           // 100ms bekle -> delay_ms(100) fonksiyonu esdegeri
      IntToStr(dutyCycle,txt);             // Sayac degerini txt dizisine karakter karakter yaz
      Lcd_Chr(2,13,txt[2]);                // 1.karakteri 13.sutuna yaz
      Lcd_Chr(2,14,txt[3]);                // 2.karakteri 14.sutuna yaz
      Lcd_Chr(2,15,txt[4]);                // 3.karakteri 15.sutuna yaz
      Lcd_Chr(2,16,txt[5]);                // 4.karakteri 16.sutuna yaz
      while(!BUTTON_UP);                   // Butona hala basili ise buton birakilana kadar bekle
    }
  }
}