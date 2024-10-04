float temp;
unsigned int t3;
char txt[15];
unsigned int t1,t2;

#include "connection.c"
#include "function.c"
#include "display.c"
#include "initialize.c"
#include "interrupt.c"
#include "DS18B20.c"

void main() {
  InitMCU();
  
  /*// Uygulama 1
  
  Lcd_Out(1,1,"7.DS18B20 Uyg.  ");         // Ekranda 1.satir 1.sütundan itibaren yaz
  Lcd_Out(2,1,"Sicaklik:       ");         // Ekranda 2.satir 1.sütundan itibaren yaz
  
  while(1){
    temp=ReadDS18B20();        // DS18B20.c kutuphane dosyasi icerisindeki ReadDS18B20 fonksiyonu ile sicaklik degerini getir
    FloatToStr(temp, txt);     // Float degeri metin olarak degistir
    Lcd_Out(2,10,txt);         // Ekranda 2.satir 10.sütundan itibaren sicaklik degerini yaz
    wait(100);                 // 100ms bekleme
  }
  
  */
  
  // Uygulama 2

  Lcd_Out(1,1,"7.DS18B20 Uyg.  ");         // Ekranda 1.satir 1.sütundan itibaren yaz
  Lcd_Out(2,1,"1:123 2:123 T:25");         // Ekranda 2.satir 1.sütundan itibaren yaz

  while(1){
    t1=ADC_Read(1)/10;                     // Trimpot1'in degerini Analog 1.kanaldan oku ve t1'e yaz    Sogutma icin klima
    t2=ADC_Read(3)/10;                     // Trimpot2'nin degerini Analog 2.kanaldan oku ve t2'ye yaz  Yüksek sicaklik alarm
    t3=ReadDS18B20();                      // DS18B20.c kutuphane dosyasi icerisindeki ReadDS18B20 fonksiyonu ile sicaklik degerini getir
    
    // Trimpot 1 degerini ekrana yazma
    Lcd_Chr(2,3,((t1%1000)/100+48));       // Ekranda 2.satir 5.sütuna yaz
    Lcd_Chr(2,4,((t1%100)/10+48));         // Ekranda 2.satir 6.sütuna yaz
    Lcd_Chr(2,5,(t1%10+48));               // Ekranda 2.satir 7.sütuna yaz

    // Trimpot 2 degerini ekrana yazma
    Lcd_Chr(2,9,((t2%1000)/100+48));       // Ekranda 2.satir 5.sütuna yaz
    Lcd_Chr(2,10,((t2%100)/10+48));        // Ekranda 2.satir 6.sütuna yaz
    Lcd_Chr(2,11,(t2%10+48));              // Ekranda 2.satir 7.sütuna yaz

    // Sicaklik degerini ekrana yazma
    Lcd_Chr(2,15,((t3%100)/10+48));        // Ekranda 2.satir 6.sütuna yaz
    Lcd_Chr(2,16,(t3%10+48));              // Ekranda 2.satir 7.sütuna yaz

    // Eger sicaklik degeri t1(klima) degerinden büyük veya esit ise
    // klima calisacak ve ortam sogutulacak
    if(t3>=t1)
      RELAY=1;
    else
      RELAY=0;
    
    // Eger sicaklik degeri t2(alarm) degerinden büyük veya esit ise
    // buzzler calisacak ve 1ms lik alarm verilecek
    if(t3>=t2){
      BUZZER=1; 
      wait(1);
      BUZZER=0;
    }
    else
      BUZZER=0;

    wait(100); // 100ms bekleme
  }
}