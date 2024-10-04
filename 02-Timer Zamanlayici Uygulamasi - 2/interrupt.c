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
    TMR0H         = 0x48;
    TMR0L         = 0xE5;
    
    //Enter your code here
    if(direction)     // Eger yön artan ise -> if(direction) ile if(direction==1) kullanimi aynidir.
      number++;       // bir arttir
    else              // degilse
      number--;       // bir azalt

    if(number==10)    // sayi 10 ise
      direction=0;    // Yonu azalan olarak degistir
    if(number==0)     // sayi 0 ise
      direction=1;    // Yonu artan olarak degistir
  }
}