#include "connection.c"
#include "function.c"
#include "display.c"
#include "initialize.c"
#include "interrupt.c"
#include "DS18B20.c"

void main() {
  InitMCU();
  
  INT2E_bit=1;    // INT2 dis kesme kaynagini aktif ediyoruz. INT0 ve INT1'de ayri ayri kullanilabilir.
                  // Ancak INT2 pinine MENU Butonu bagli oldugu için uygulamamizi INT2 ile yapacagiz.
  //INTEDG2_bit=0;  // Kesme yükselen kenarda olusacak
  INTEDG2_bit=1;  // Kesme duselen kenarda olusacak

  Lcd_Out(1,1,"8.INT2 Dis Kesme");         // Ekranda 1.satir 1.sütundan itibaren yaz
  Lcd_Out(2,1,"MENU Btn. Basin ");         // Ekranda 2.satir 1.sütundan itibaren yaz
}