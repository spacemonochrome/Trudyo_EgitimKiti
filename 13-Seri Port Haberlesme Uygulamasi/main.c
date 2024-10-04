char receivedText[32];                  // 2x16 LCD icin 2x16=32 karakterlik dizi olusturuyoruz
unsigned short receivedBytes=0;         // Gelen byte sayaci
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
  
  wait(2000);                              // 2 saniye bekleme
  Lcd_Cmd(_LCD_CLEAR);
  
  UART1_Init(9600);                        // UART 9600 baud hizinda hazirlaniyor
  RCIE_bit=1;                              // UART veri alma kesmesi aktif
  
  // Dizimizin icerigini temizliyoruz
  for(i=0;i<32;i++)
    receivedText[i]=' ';
  
  while(1){
    receivedBytes=0;                       // Alinan veri sayacimizi sifirliyoruz
    UART1_Write_Text("Merhaba Dunya!  ");  // 16 karakter veri gonderiyoruz
    UART1_Write_Text("Sayac:    ");        // 16 karakter veri gonderiyoruz
    
    counter++;                             // Sayaci bir arttirma
    IntToStrWithZeros(counter,txt);        // Sayaci metin formatina cevirme
    UART1_Write_Text(txt);                 // 6 karakter veri gonderiyoruz

    // Eger gerekli ise cevap icin zaman gecikmesi eklenebilir

    // Gelen cebabi ekrana yazdirma
    for(i=0;i<16;i++){
      Lcd_Chr(1,i+1,receivedText[i]);      // i=0 icin LCD_OUT(1,1,... olmalidir
      Lcd_Chr(2,i+1,receivedText[i+16]);   // i+1 ler bu sebeple eklenmistir
    }
    
    // Dizimizin icerigini temizliyoruz
    for(i=0;i<32;i++)
      receivedText[i]=' ';
    
    wait(1000);                              // 1 saniye bekleme
  }
}