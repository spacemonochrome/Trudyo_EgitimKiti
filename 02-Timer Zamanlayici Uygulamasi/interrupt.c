void Interrupt(){
  // 5ms Timer
  if (TMR2IF_bit){
    TMR2IF_bit = 0;
    //Enter your code here
    UpdateExternalPorts();
  }
  
  // 1000ms Timer
  if (TMR0IF_bit){
    TMR0IF_bit = 0;
    TMR0H	 = 0x48;
    TMR0L	 = 0xE5;
    //Enter your code here
    if(number<99)  // Eger sayi 99'dan kucuk ise
      number++;    // bir arttir
    else           // degilse
      number=0;    // sifir yap
  }
}