unsigned int t1,t2;

#include "connection.c"
#include "function.c"
#include "display.c"
#include "initialize.c"
#include "interrupt.c"
#include "DS18B20.c"

void main() {
  InitMCU();
  
  Lcd_Out(1,1,"6.ADC Uygulamasi");         // Ekranda 1.satir 1.sütundan itibaren yaz
  Lcd_Out(2,1,"T1:0000  T2:0000");         // Ekranda 2.satir 1.sütundan itibaren yaz
  
  while(1){
    t1=ADC_Read(1);                        // Trimpot1'in degerini Analog 1.kanaldan oku ve t1'e yaz
    t2=ADC_Read(3);                        // Trimpot2'nin degerini Analog 2.kanaldan oku ve t2'ye yaz

    // Chr   Decimal
    //  0         48  -> (48+0)
    //  1         49  -> (48+1)
    //  2         50  -> (48+2)
    //  3         51  -> (48+3)
    //  4         52  -> (48+4)
    //  5         53  -> (48+5)
    //  6         54  -> (48+6)
    //  7         55  -> (48+7)
    //  8         56  -> (48+8)
    //  9         57  -> (48+9)
    // t1=1234 olmak üzere
    // t1/1000       = 1'dir.  +48 ekleyerek 1 sayisal degerini '1' karakter degerine ceviririz.
    // t1%1000       =234'tur. 234/100=2'dir. +48 ekleyerek 2 sayisal degerini '2' karakter degerine ceviririz.
    // t1%100        =34'tur.  34/100=3'tür. +48 ekleyerek 3 sayisal degerini '3' karakter degerine ceviririz.
    // t1%10         =4'tur.   +48 ekleyerek 4 sayisal degerini '4' karakter degerine ceviririz.

    Lcd_Chr(2,4,(t1/1000+48));             // Ekranda 2.satir 4.sütuna yaz
    Lcd_Chr(2,5,((t1%1000)/100+48));       // Ekranda 2.satir 5.sütuna yaz
    Lcd_Chr(2,6,((t1%100)/10+48));         // Ekranda 2.satir 6.sütuna yaz
    Lcd_Chr(2,7,(t1%10+48));               // Ekranda 2.satir 7.sütuna yaz

    Lcd_Chr(2,13,(t2/1000+48));            // Ekranda 2.satir 13.sütuna yaz
    Lcd_Chr(2,14,((t2%1000)/100+48));      // Ekranda 2.satir 14.sütuna yaz
    Lcd_Chr(2,15,((t2%100)/10+48));        // Ekranda 2.satir 15.sütuna yaz
    Lcd_Chr(2,16,(t2%10+48));              // Ekranda 2.satir 16.sütuna yaz
    
    wait(100);                             // 100ms bekleme
  }
}