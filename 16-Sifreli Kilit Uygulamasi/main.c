unsigned int p0=0;                          // Pozisyon 0 degiskeni
unsigned int p1=0;                          // Pozisyon 1  degiskeni
unsigned int p2=0;                          // Pozisyon 2  degiskeni
unsigned int p3=0;                          // Pozisyon 3 fre degiskeni
unsigned int position=0;                    // Sifre pozisyonu
unsigned int password=1234;                 // Dogru sifre degiskeni

#include "connection.c"
#include "function.c"
#include "display.c"
#include "initialize.c"
#include "interrupt.c"
#include "DS18B20.c"

void main() {
  InitMCU();

  Lcd_Out(1,1,"14.Sifreli Kilit");         // Ekranda 1.satir 1.sütundan itibaren yaz
  Lcd_Out(2,1,"Sifre:          ");         // Ekranda 2.satir 1.sütundan itibaren yaz

  Lcd_Cmd(_LCD_BLINK_CURSOR_ON);           // Imlec konumunda blink aktif

  // Girilen sifreyi ekrana yazma
  Lcd_Chr(2,16,p3+48);
  Lcd_Chr(2,15,p2+48);
  Lcd_Chr(2,14,p1+48);
  Lcd_Chr(2,13,p0+48);

  Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);           // Imlec konumunu bir sola kaydir
  
  while(1){
    // MENU : Sayilar arasi gecis
    // OK   : Sifre onay
    // UP   : Sifre arttirma
    // DOWN : Sifre azaltma
    
    if(!BUTTON_MENU || !BUTTON_OK || !BUTTON_UP || !BUTTON_DOWN){
      
      BUZZER=1; wait(5); BUZZER=0;             // Tusa basma sesi

      if(!BUTTON_MENU){       // Menu butonuna basilirsa
        position++;           // Secili sifre hanesini bir arttir
        
        if(position>3)        // Pozisyon 3'ten buyuk ise
          position=0;         // 0 yap
      }
        
      if(!BUTTON_OK){
        

        if(password==(p0*1000+p1*100+p2*10+p3)){          // Sifre dogru mu?
          LED04=1;                                        // Yesil LED'i aktif et
          RELAY=1;                                        // Roleyi aktif et
        }
        else{                                             // Sifre yanlis ise
          LED08=1;                                        // Kirmizi LED'i aktif et
          
          // Buzzer alarm
          BUZZER=1; wait(10); BUZZER=0; wait(100);
          BUZZER=1; wait(10); BUZZER=0; wait(100);
          BUZZER=1; wait(10); BUZZER=0; wait(100);
        }
        
        // Sifre kontrolu yapildiginde sifre dogru olsada olmasada 1 sn sonra ekrani temizleme
        wait(1000);                                       // 1 sn bekleme
        LED04=0;                                          // Yesil LED'i pasif et
        LED08=0;                                          // Kirmizi LED'i pasif et
        RELAY=0;                                          // Roleyi pasif et
        p3=0; Lcd_Chr(2,16,p3+48);                        // p3 degerini 0 yap ve ekrana yaz
        p2=0; Lcd_Chr(2,15,p2+48);                        // p2 degerini 0 yap ve ekrana yaz
        p1=0; Lcd_Chr(2,14,p1+48);                        // p3 degerini 0 yap ve ekrana yaz
        p0=0; Lcd_Chr(2,13,p0+48);                        // p0 degerini 0 yap ve ekrana yaz
        Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);                   // Imlec konumunu bir sola kaydir
      }
      
      if(!BUTTON_UP){
        switch (position){                                // Eger position degeri
          case 0: if(p0<9) p0++; break;                   // 0 ise ve p0 9'dan kucuk ise
          case 1: if(p1<9) p1++; break;                   // 1 ise ve p1 9'dan kucuk ise
          case 2: if(p2<9) p2++; break;                   // 2 ise ve p2 9'dan kucuk ise
          case 3: if(p3<9) p3++; break;                   // 3 ise ve p3 9'dan kucuk ise
        }
      }
      
      if(!BUTTON_DOWN){                                   // Eger position degeri
        switch(position){                                 // 0 ise ve p0 0'dan buyuk ise
          case 0: if(p0>0) p0--; break;                   // 1 ise ve p0 0'dan buyuk ise
          case 1: if(p1>0) p1--; break;                   // 2 ise ve p0 0'dan buyuk ise
          case 2: if(p2>0) p2--; break;                   // 3 ise ve p0 0'dan buyuk ise
          case 3: if(p3>0) p3--; break;
        }
      }
      
      switch(position){                                   // Eger position degeri
        case 0: Lcd_Chr(2,13,p0+48); break;               // 0 ise, p0 0degerini ekrana yaz
        case 1: Lcd_Chr(2,14,p1+48); break;               // 1 ise, p0 0degerini ekrana yaz
        case 2: Lcd_Chr(2,15,p2+48); break;               // 2 ise, p0 0degerini ekrana yaz
        case 3: Lcd_Chr(2,16,p3+48); break;               // 3 ise, p0 0degerini ekrana yaz
      }
      
      Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);                     // Imlec konumunu bir sola kaydir

      wait(100);                               // 100ms bekleme

      // Buton birakilana kadar programi bu satirda beklet
      while(!BUTTON_MENU || !BUTTON_OK || !BUTTON_UP || !BUTTON_DOWN);
    }
  }
}