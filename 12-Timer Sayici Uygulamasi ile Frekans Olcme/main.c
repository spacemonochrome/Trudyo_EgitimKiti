unsigned int freq=0;
unsigned int freqH=0;
unsigned int freqL=0;
char txt[7];

#include "connection.c"
#include "function.c"
#include "display.c"
#include "initialize.c"
#include "interrupt.c"
#include "DS18B20.c"

void main() {
  InitMCU();
  
  // Not: Klemens üzerinde EXT.OUT ile EXT.IN girisleri birbirine kisa devre edilerek test edilmelidir.

  Lcd_Out(1,1,"12.Timer Sayici ");         // Ekranda 1.satir 1.sütundan itibaren yaz
  Lcd_Out(2,1,"Freq:         Hz");         // Ekranda 2.satir 1.sütundan itibaren yaz
  
  PWM2_Init(5000);         // PWM2 frekansi - EXT.OUT cikisina uygulanir
  PWM2_Set_Duty(127);      // Duty Cycle degerini 0-255 arasinda ayarliyoruz
  PWM2_Start();            // PWM2'yi baslatiyoruz
  
  T1CON=0b10000010; // [TMR1CS1][TMR1CS2][T1CKPS1][T1CKPS0][SOSCEN][T1SYNC][RD16][TMR1ON]
                    // TMR1CS:10 ile T1CKI pininden harici clock girisi
                    // T1CKPS:00 ile on bolucu 1:1
                    // SOSCEN:0  ile ikincil osilator (SOSCI/SOSCO pini) degil T1CKI kullanilacak
                    // T1SYNC:0  ile FOSC ile senkronize edilecek
                    // RD16:1    ile 16 bit sayac akif edildi.
                    // TMR1ON:0  ile sayici pasif durumda
  
  GIE_bit=0;        // Kesmeler delay surasini geciktirecegi icin pasif ediliyor
  
  while(1){
    TMR1H=0;          // Sayaci sifirla
    TMR1L=0;          // Sayaci sifirla
    TMR1ON_bit=1;     // Timer'i calistir.
    delay_ms(1000);   // 1 saniye bekle
    TMR1ON_bit=0;     // Timer'i durdur.

    // Timer degerini freqL ve freqH'ye yaziyoruz
    freqL=TMR1L;
    freqH=TMR1H;
    
    // Iki degeri birlestiriyoruz
    freq=freqH;
    freq<<=8;
    freq+=freqL;
    
    // freq degerini metne donusturup ekrana yaziyoruz
    IntToStr(freq,txt);
    Lcd_Out(2,6,txt);
  }
}