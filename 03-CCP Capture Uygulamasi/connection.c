// 74HC595 Expanded Ports
unsigned short LATF=0;
sbit LATF0_bit at LATF.B0;
sbit LATF1_bit at LATF.B1;
sbit LATF2_bit at LATF.B2;
sbit LATF3_bit at LATF.B3;
sbit LATF4_bit at LATF.B4;
sbit LATF5_bit at LATF.B5;
sbit LATF6_bit at LATF.B6;
sbit LATF7_bit at LATF.B7;
unsigned short LATG=0;
sbit LATG0_bit at LATG.B0;
sbit LATG1_bit at LATG.B1;
sbit LATG2_bit at LATG.B2;
sbit LATG3_bit at LATG.B3;
sbit LATG4_bit at LATG.B4;
sbit LATG5_bit at LATG.B5;
sbit LATG6_bit at LATG.B6;
sbit LATG7_bit at LATG.B7;
unsigned short LATH=0;
sbit LATH0_bit at LATH.B0;
sbit LATH1_bit at LATH.B1;
sbit LATH2_bit at LATH.B2;
sbit LATH3_bit at LATH.B3;
sbit LATH4_bit at LATH.B4;
sbit LATH5_bit at LATH.B5;
sbit LATH6_bit at LATH.B6;
sbit LATH7_bit at LATH.B7;
unsigned short LATI=0;
sbit LATI0_bit at LATI.B0;
sbit LATI1_bit at LATI.B1;
sbit LATI2_bit at LATI.B2;
sbit LATI3_bit at LATI.B3;
sbit LATI4_bit at LATI.B4;
sbit LATI5_bit at LATI.B5;
sbit LATI6_bit at LATI.B6;
sbit LATI7_bit at LATI.B7;
unsigned short PORTI=0;
sbit PORTI0_bit at PORTI.B0;
sbit PORTI1_bit at PORTI.B1;
sbit PORTI2_bit at PORTI.B2;
sbit PORTI3_bit at PORTI.B3;
sbit PORTI4_bit at PORTI.B4;
sbit PORTI5_bit at PORTI.B5;
sbit PORTI6_bit at PORTI.B6;
sbit PORTI7_bit at PORTI.B7;

// LED
sbit LED at LATA4_bit;

// 7 Segment 1 Connections
sbit SEG1H at LATF0_bit;
sbit SEG1B at LATF1_bit;
sbit SEG1C at LATF2_bit;
sbit SEG1A at LATF3_bit;
sbit SEG1F at LATF4_bit;
sbit SEG1D at LATF5_bit;
sbit SEG1G at LATF6_bit;
sbit SEG1E at LATF7_bit;
// 7 Segment 2 Connections
sbit SEG2H at LATG0_bit;
sbit SEG2B at LATG1_bit;
sbit SEG2C at LATG2_bit;
sbit SEG2A at LATG3_bit;
sbit SEG2F at LATG4_bit;
sbit SEG2D at LATG5_bit;
sbit SEG2G at LATG6_bit;
sbit SEG2E at LATG7_bit;

// LED Series
sbit LED01 at LATH0_bit;
sbit LED02 at LATH1_bit;
sbit LED03 at LATH2_bit;
sbit LED04 at LATH3_bit;
sbit LED05 at LATH4_bit;
sbit LED06 at LATH5_bit;
sbit LED07 at LATH6_bit;
sbit LED08 at LATH7_bit;

// DIP Switch
sbit DIP01 at PORTI0_bit;
sbit DIP02 at PORTI1_bit;
sbit DIP03 at PORTI2_bit;
sbit DIP04 at PORTI3_bit;
sbit DIP05 at PORTI4_bit;
sbit DIP06 at PORTI5_bit;
sbit DIP07 at PORTI6_bit;
sbit DIP08 at PORTI7_bit;

// Buttons
sbit BUTTON_MENU at RB2_bit;
sbit BUTTON_OK   at RB5_bit;
sbit BUTTON_UP   at RB6_bit;
sbit BUTTON_DOWN at RB7_bit;

// RGB LED
sbit LEDR at LATD0_bit;
sbit LEDG at LATC2_bit;
sbit LEDB at LATD1_bit;

// Step Motor
sbit IN1 at LATD1_bit;
sbit IN2 at LATD0_bit;
sbit IN3 at LATC2_bit;
sbit IN4 at LATB4_bit;

// Buzzer
sbit BUZZER at LATA2_bit;

// External I/O
sbit EXT_OUT at LATC1_bit;
sbit EXT_IN  at RC0_bit;

// Relay
sbit RELAY at LATA0_bit;

// DIP Switch
sbit DIPSW at RA5_bit;

// 74HC595 Shift Register
sbit DS    at LATB3_bit;
sbit SH_CP at LATE2_bit;
sbit ST_CP at LATE1_bit;

// LCD module connections
sbit LCD_RS         at LATD7_bit;
sbit LCD_EN         at LATD6_bit;
sbit LCD_D4         at LATD5_bit;
sbit LCD_D5         at LATD4_bit;
sbit LCD_D6         at LATD3_bit;
sbit LCD_D7         at LATD2_bit;

sbit LCD_RS_Direction at TRISD7_bit;
sbit LCD_EN_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD2_bit;