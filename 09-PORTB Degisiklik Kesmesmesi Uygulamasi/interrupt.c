void Interrupt(){
  // 5ms Timer
  if (TMR2IF_bit){
    TMR2IF_bit = 0;
    //Enter your code here
    UpdateExternalPorts();
  }
  
  if(IOCIF_bit){
    IOCIF_bit=0;       // degisiklik kesme bayragini sifirliyoruz.
    LED06=RB5_bit;     // LED06'ya RB5'in yani OK butonunun durumunu yaz
    LED07=RB6_bit;     // LED07'ya RB6'nin yani UP butonunun durumunu yaz
    LED08=RB7_bit;     // LED08'ya RB7'nin yani DOWN butonunun durumunu yaz
  }
}