void Interrupt(){
  // 5ms Timer
  if (TMR2IF_bit){
    TMR2IF_bit = 0;
    //Enter your code here
    UpdateExternalPorts();
  }
  
  if(IOCIF_bit){
    //LED06=RB5_bit;     // LED06'ya RB5'in yani OK butonunun durumunu yaz
    //LED07=RB6_bit;     // LED07'ya RB6'nin yani UP butonunun durumunu yaz
    //LED08=RB7_bit;     // LED08'ya RB7'nin yani DOWN butonunun durumunu yaz
    
    if(!BUTTON_OK)                 // Eger OK butonuna basilmis ise
      number=0;                    // sayaci sifirla

    if(!BUTTON_UP && number<99)    // Eger UP butonuna basilmis ise ve sayacimiz 99'dan kucuk ise
      number++;                    // sayaci bir arttir

    if(!BUTTON_DOWN && number>0)   // Eger DOWN butonuna basilmis ise ve sayacimiz 0'dan buyuk ise
      number--;                    // sayaci bir azalt
      
    PrintInt(number);              // Sayaci ekrana yaz
    
    // Degisiklik kesmesinde hem butona bastiginda hemde biraktiginda kesme olusur. Bu da
    // her basim ile birlikte sayacin 2 artmasi demektir. Bu sebeple butonlar birakilana kadar 
    // programi durdurup sonrasinda kesme bayragini temizliyoruz
    while(!BUTTON_OK || !BUTTON_UP || !BUTTON_DOWN);  // Butonlar birakilana kadar bekle
    
    IOCIF_bit=0;       // degisiklik kesme bayragini sifirliyoruz.
  }
}