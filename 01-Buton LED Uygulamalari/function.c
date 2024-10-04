void wait(unsigned int time){
  unsigned int i;

  for(i=0;i<time;i++){
    delay_ms(1);
    asm clrwdt;
  }
}

void UpdateExternalPorts(){
  unsigned short i,buffer;
  
  if(LATI==0b00000000)
    LATI=0b00000001;
  
  ST_CP=0;
  SH_CP=0;
  DS=0;

  // Update PORT F
  buffer=LATF;
  for(i=0;i<8;i++){
    if(buffer.B7)
      DS=1;
    else
      DS=0;

    SH_CP=1;
    asm nop;
    SH_CP=0;

    buffer<<=1;
  }

  // Update PORT G
  buffer=LATG;
  for(i=0;i<8;i++){
    if(buffer.B7)
      DS=1;
    else
      DS=0;

    SH_CP=1;
    asm nop;
    SH_CP=0;

    buffer<<=1;
  }

  // Update PORT H
  buffer=LATH;
  for(i=0;i<8;i++){
    if(buffer.B7)
      DS=1;
    else
      DS=0;

    SH_CP=1;
    asm nop;
    SH_CP=0;

    buffer<<=1;
  }

  // Update PORT I
  buffer=LATI;
  for(i=0;i<8;i++){
    if(buffer.B7)
      DS=1;
    else
      DS=0;

    SH_CP=1;
    asm nop;
    SH_CP=0;

    buffer<<=1;
  }
  ST_CP=1;
  asm nop;
  ST_CP=0;
  
  switch(LATI){
    case 0b00000001:
      PORTI0_bit=DIPSW;
      break;
    case 0b00000010:
      PORTI1_bit=DIPSW;
      break;
    case 0b00000100:
      PORTI2_bit=DIPSW;
      break;
    case 0b00001000:
      PORTI3_bit=DIPSW;
      break;
    case 0b00010000:
      PORTI4_bit=DIPSW;
      break;
    case 0b00100000:
      PORTI5_bit=DIPSW;
      break;
    case 0b01000000:
      PORTI6_bit=DIPSW;
      break;
    case 0b10000000:
      PORTI7_bit=DIPSW;
      break;
  }
  LATI<<=1;
}