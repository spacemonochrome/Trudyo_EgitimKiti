char getChar(char c){
  switch(c){
    case 'A': return 0xDE;
    case 'B': return 0xF4;
    case 'C': return 0xB8;
    case 'D': return 0xE6;
    case 'E': return 0xF8;
    case 'F': return 0xD8;
    case 'G': return 0xBC;
    case 'H': return 0xD6;
    case 'I': return 0x06;
    case 'J': return 0xA6;
    case 'K': return 0xD4;
    case 'L': return 0xB0;
    case 'M': return 0xCC;
    case 'N': return 0xC4;
    case 'O': return 0xE4;
    case 'P': return 0xDA;
    case 'Q': return 0x5E;
    case 'R': return 0xC0;
    case 'S': return 0x7C;
    case 'T': return 0xF0;
    case 'U': return 0xB6;
    case 'V': return 0xA4;
    case 'Y': return 0x76;
    case 'Z': return 0xEA;
    case '0': return 0xBE;
    case '1': return 0x06;
    case '2': return 0xEA;
    case '3': return 0x6E;
    case '4': return 0x56;
    case '5': return 0x7C;
    case '6': return 0xFC;
    case '7': return 0x0E;
    case '8': return 0xFE;
    case '9': return 0x7E;
    case ' ': return 0x00;
  }
  return 0;
}

void PrintText(char *str){
  LATF=getChar(str[0]);
  LATG=getChar(str[1]);
}
void PrintInt(unsigned short number){
  // Eger sayi 99'dan buyuk ise sadece son iki basamagini goster
  if(number>99)
    number=number%100;

  LATF=getChar(number/10+48);
  LATG=getChar(number%10+48);
}