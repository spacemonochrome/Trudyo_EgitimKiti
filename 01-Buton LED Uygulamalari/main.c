#include "connection.c"
#include "function.c"
#include "display.c"
#include "initialize.c"
#include "interrupt.c"
#include "DS18B20.c"

void main() {
  InitMCU();

  while(1){
    // 1. Dahili LED'i yakma ve sondurme

    Lcd_Out(1,1,"1.1.LED Yakma   ");    // Ekranda 1.satir 1.sütundan itibaren yaz
    LED=1;                              // LED'i yak
    delay_ms(1000);                     // 1000ms=1saniye bekle
    LED=0;                              // LED'i sondur
    delay_ms(1000);                     // 1000ms=1saniye bekle

    
    // 2. LED'leri sirayla yakma ve sondurme
    /*
    Lcd_Out(1,1,"1.2.Sirali LED  ");    // Ekranda 1.satir 1.sütundan itibaren yaz
    LED01=1;                            // LED01'i yak
    delay_ms(1000);                     // 1000ms=1saniye bekle
    LED01=0;                            // LED01'i sondur
    LED02=1;                            // LED02'i yak
    delay_ms(1000);                     // 1000ms=1saniye bekle
    LED02=0;                            // LED02'i sondur
    LED03=1;                            // LED03'i yak
    delay_ms(1000);                     // 1000ms=1saniye bekle
    LED03=0;                            // LED03'i sondur
    LED04=1;                            // LED04'i yak
    delay_ms(1000);                     // 1000ms=1saniye bekle
    LED04=0;                            // LED04'i sondur
    LED05=1;                            // LED05'i yak
    delay_ms(1000);                     // 1000ms=1saniye bekle
    LED05=0;                            // LED05'i sondur
    LED06=1;                            // LED06'i yak
    delay_ms(1000);                     // 1000ms=1saniye bekle
    LED06=0;                            // LED06'i sondur
    LED07=1;                            // LED07'i yak
    delay_ms(1000);                     // 1000ms=1saniye bekle
    LED07=0;                            // LED07'i sondur
    LED08=1;                            // LED08'i yak
    delay_ms(1000);                     // 1000ms=1saniye bekle
    LED08=0;                            // LED08'i sondur
    */
    
    // 3. MENU-OK-UP-DOWN butonu ile LED kontrolu
    /*
    Lcd_Out(1,1,"1.3.Buton-LED   ");    // Ekranda 1.satir 1.sütundan itibaren yaz
    LED01=!BUTTON_MENU;                  // Menu butonuna basilinca LED01'i yak
    LED02=!BUTTON_OK;                    // Ok butonuna basilinca LED02'yi yak
    LED03=!BUTTON_UP;                    // Up butonuna basilinca LED03'u yak
    LED04=!BUTTON_DOWN;                  // Down butonuna basilinca LED04'u yak
    delay_ms(50);                        // 50ms bekleme
    */
    
    // 4. DIP-Switch ile LED kontrolu
    /*
    Lcd_Out(1,1,"1.4.DIPSW-LED    ");    // Ekranda 1.satir 1.sütundan itibaren yaz
    LATH=PORTI;                          // H sanal portuna (LED Serisi) I sanal portundan (DIP Switch) okunan degeri yaz
    // Yukaridaki komut yerine asagidaki gibi tek tek tanimlama yapabiliriz.
    //LED01=DIP01;
    //LED02=DIP02;
    //LED03=DIP03;
    //LED04=DIP04;
    //LED05=DIP05;
    //LED06=DIP06;
    //LED07=DIP07;
    //LED08=DIP08;
    delay_ms(50);                        // 50ms bekleme
    */
  }
}