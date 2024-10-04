unsigned int counter=0;                 // Gideb veri sayaci
char txt[7];                            // Sayacin metin degerini cevirmek icin txt dizisi
unsigned short i;                       // Genel index kullanimi icin

#include "connection.c"
#include "function.c"
#include "display.c"
#include "initialize.c"
#include "interrupt.c"
#include "DS18B20.c"

void main() {
  InitMCU();
  
  // Not: RXD-TXD headerleri jumper ile birlestirilmelidir.

  Lcd_Out(1,1,"13.UART Haberles");         // Ekranda 1.satir 1.sütundan itibaren yaz
  Lcd_Out(2,1,"me Uygulamasi   ");         // Ekranda 2.satir 1.sütundan itibaren yaz
  wait(2000);
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(1,1,"Sayac:          ");         // Ekranda 1.satir 1.sütundan itibaren yaz
  IntToStrWithZeros(counter,txt);
  Lcd_Out(1,11,txt);
  
  UART1_Init(9600);                        // UART 9600 baud hizinda hazirlaniyor
  RCIE_bit=1;                              // UART veri alma kesmesi aktif
  
  while(1){
    if(!BUTTON_MENU || !BUTTON_OK || !BUTTON_UP || !BUTTON_DOWN){
      if(!BUTTON_MENU && counter>=10)
        counter-=10;                           // Sayaci 10 azalt
      if(!BUTTON_OK && counter<=89)
        counter+=10;                           // Sayaci 10 arttir
      if(!BUTTON_UP && counter<99)
        counter++;                             // Sayaci bir arttirma
      if(!BUTTON_DOWN && counter>0)
        counter--;                             // Sayaci bir azaltma
        
      BUZZER=1; wait(5); BUZZER=0;             // Tusa basma sesi
      
      // Sayac degerini aliciya gonderme
      UART1_Write(counter);                    // Sayac verisini gonder
      
      // Gonderilen sayac degerini ekrana yazdirma
      IntToStrWithZeros(counter,txt);
      Lcd_Out(1,11,txt);
      
      wait(100);                               // 100ms bekleme
      
      // Buton birakilana kadar programi bu satirda beklet
      while(!BUTTON_MENU || !BUTTON_OK || !BUTTON_UP || !BUTTON_DOWN);
    }
  }
}