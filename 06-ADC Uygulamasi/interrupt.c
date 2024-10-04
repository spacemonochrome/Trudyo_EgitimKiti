void Interrupt(){
  // 5ms Timer
  if (TMR2IF_bit){
    TMR2IF_bit = 0;
    //Enter your code here
    UpdateExternalPorts();
  }
}