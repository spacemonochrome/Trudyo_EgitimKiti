void Interrupt(){
  // 5ms Timer
  if (TMR2IF_bit){
    TMR2IF_bit = 0;
    //Enter your code here
    UpdateExternalPorts();
  }
  
  // UART Kesmesi
  if(RCIE_bit && RCIF_bit){   // Eger UART veri alma kesmesi aktifse ve kesme bayragi set edilmis ise
    RCIF_bit=0;               // Kesme bayragini temizle
    if(UART1_Data_Ready()){   // Eger UART verisi okumaya hazir ise
      receivedText[receivedBytes]=UART1_Read();    // Gelen veriyi oku ve receivedText dizisine yaz
      receivedBytes++;                             // Gelen veri sayacini 1 arttir
    }
  }
}