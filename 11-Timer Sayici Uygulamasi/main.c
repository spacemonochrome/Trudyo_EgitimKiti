#include "connection.c"
#include "function.c"
#include "display.c"
#include "initialize.c"
#include "interrupt.c"
#include "DS18B20.c"

void main() {
  InitMCU();
  
  // Not: Klemens üzerinde EXT.COM ile EXT.IN girisleri birbirine kisa devre edilerek test edilmelidir.

  Lcd_Out(1,1,"11.Timer Sayici ");         // Ekranda 1.satir 1.sütundan itibaren yaz
  Lcd_Out(2,1,"Uygulamasi      ");         // Ekranda 2.satir 1.sütundan itibaren yaz
  
  T1CON=0b10000001; // [TMR1CS1][TMR1CS2][T1CKPS1][T1CKPS0][SOSCEN][T1SYNC][RD16][TMR1ON]
                    // TMR1CS:10 ile T1CKI pininden harici clock girisi
                    // T1CKPS:00 ile on bolucu 1:1
                    // SOSCEN:0  ile ikincil osilator (SOSCI/SOSCO pini) degil T1CKI kullanilacak
                    // T1SYNC:0  ile FOSC ile senkronize edilecek
                    // RD16:0    ile 8 bit sayac akif edildi.
                    // TMR1ON:1  ile sayici calisir durumda
                    
  TMR1L=0;          // Sayaci sifirla
  while(1){
    PrintInt(TMR1L);  // Sayaci ekrana yaz
    
    if(TMR1L>99)      // Sayac 99'dan buyuk ise
      TMR1L=0;        // sifirla
  }
}