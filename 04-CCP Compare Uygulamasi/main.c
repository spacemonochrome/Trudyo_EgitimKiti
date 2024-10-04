//PIC18F45K50 Datasheet:https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/ProductDocuments/DataSheets/PIC18F2X_45K50-30000684B.pdf
// Not: initialize.c dosyasina eklemeler yapilmistir.
#include "connection.c"
#include "function.c"
#include "display.c"
#include "initialize.c"
#include "interrupt.c"
#include "DS18B20.c"

void main() {
  InitMCU();

  Lcd_Out(1,1,"4.CCP Compare   ");    // Ekranda 1.satir 1.sütundan itibaren yaz
  Lcd_Out(2,1,"      T1<T2     ");    // Ekranda 2.satir 1.sütundan itibaren yaz

  while(1){
    if(C1OUT_bit)                     // C1OUT=1 ise C1<C2'dir (Datasheet sy.307 CMxCON register)
      Lcd_Chr(2,9,'<');               // Ekranda 2.satir 9.sütuna tek bir yaz
    else                              // C1OUT=0 ise C1>C2'dir
      Lcd_Chr(2,9,'>');               // Ekranda 2.satir 9.sütuna tek bir yaz
  }
}