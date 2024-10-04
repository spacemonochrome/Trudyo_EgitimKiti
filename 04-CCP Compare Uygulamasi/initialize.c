// 5ms Timer Initialize
void InitTimer2(){
  T2CON         = 0x76;
  TMR2IE_bit         = 1;
  PR2                 = 250;
  INTCON         = 0xC0;
}

void InitMCU(){
  // Giris-Cikis Secimleri
  TRISA=0b00101010;// [][][DIPSW][LED][TRIMPOT2][BUZZER][TRIMPOT1][RELAY]
  TRISB=0b11100100;// [BUTTON_ESC][BUTTON_DOWN][BUTTON_UP][IN4][DS][BUTTON_MENU][][]
  TRISC=0b10000001;// [RXD][TXD][][][][LEDG-IN3][EXT_OUT][EXT_IN]
  TRISD=0b00000000;// [LCD_RS][LCD_EN][LCD_D4][LCD_D5][LCD_D6][LCD_D7][LEDB-IN1][LEDR-IN2]
  TRISE=0b00000000;// [][][][][][SH_CP][ST_CP][DS18B20]

  // Analog-Dijital Giris Secimleri
  ANSELA=0b00001010;// [][][][][TRIMPOT2][][TRIMPOT1][]
  ANSELB=0b00000000;// [][][][][][][][]
  ANSELC=0b00000000;// [][][][][][][][]
  ANSELD=0b00000000;// [][][][][][][][]
  ANSELE=0b00000000;// [][][][][][][][]

  // Port Temizleme
  LATA=0x00;
  LATB=0x00;
  LATC=0x00;
  LATD=0x00;
  LATE=0x00;

  // DIPSW taramasi için timer
  InitTimer2();
  
  // Uart hazirlama
  UART1_Init(9600);

  // LCD Ekran Hazirlama
  Lcd_Init();
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Lcd_Cmd(_LCD_CLEAR);
  
  // C1ON=1         Karsilastirici aktif edildi.
  // C1OUT=0        Karsilastirici cikisi
  // C1OE=1         Karsilastirici cikisi aktif edildi (RA4 Pini, Dahili LED uzerinden gozlemlenebilir)
  // C1POL=0        Karsilastirici cikisi terleme biti
  // C1SP=0         Karsilastirici calisma guc ve hizi secimi (Dusuk guc ve dusuk calisma hizi)
  // C1R=0          Karsilastirici referans pini (RA3, C1IN+ Pini)
  // C1CH<01>=01    Karsilastirici Cx kanal secimi (RA1, C12IN1- Pini)
         //[C1ON][C1OUT][C1OE][C1POL][C1SP][C1R][C1CH1][C1CH0]
  CM1CON0=0b10100001;
}