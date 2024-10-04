unsigned short number=0;

#include "connection.c"
#include "function.c"
#include "display.c"
#include "initialize.c"
#include "interrupt.c"
#include "DS18B20.c"

void main() {
  InitMCU();
  IOCIE_bit=1;    // PORTB degisiklik kesmesini aktif ediyoruz.
  IOCB4_bit=0;    // B4 pini degisiklik kesmesi kapali
  IOCB5_bit=1;    // B4 pini degisiklik kesmesi acik
  IOCB6_bit=1;    // B4 pini degisiklik kesmesi acik
  IOCB7_bit=1;    // B4 pini degisiklik kesmesi acik
  
  // Not: PIC18F45K50 için C portunda C3 pini hariç tüm pinlerinde degisiklik kesmesi ozelligi bulunmaktadir.

  Lcd_Out(1,1,"10.PORTB Dgsklik");         // Ekranda 1.satir 1.sütundan itibaren yaz
  Lcd_Out(2,1,"Kesm. ile sayici");         // Ekranda 2.satir 1.sütundan itibaren yaz
  
  // MENU butonu sifirlama
  // UP butonu bir arttirma
  // DOWN butonu bir azaltma
}