void Interrupt(){
  // 5ms Timer
  if (TMR2IF_bit){
    TMR2IF_bit = 0;
    //Enter your code here
    UpdateExternalPorts();
  }
  
  if(CCP2IE_bit && CCP2IF_bit){    // Eger CCP2 kesmesi aktifse ve kesme bayragi set edilmis ise
    counter++;                     // Sayaci bir arttir
    CCP2IF_bit=0;                  // Kesme bayragini sifirla
  }
}