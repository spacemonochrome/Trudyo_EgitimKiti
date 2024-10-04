// Datasheet:https://www.analog.com/media/en/technical-documentation/data-sheets/DS18B20.pdf


// -55      11111100 10010000
// -25.0625 11111110 01101111

float ReadDS18B20(){
  signed short sign=1;
  unsigned short tempDataMSB, tempDataLSB;
  unsigned int tempData;
  float temperature=0;

  Ow_Reset(&PORTE,0);               // Reset
  Ow_Write(&PORTE,0,0xCC);          // Skip ROM
  Ow_Write(&PORTE,0,0x44);          // Convert Temperature
  Delay_us(120);

  Ow_Reset(&PORTE,0);               // Reset
  Ow_Write(&PORTE,0,0xCC);          // Skip ROM
  Ow_Write(&PORTE,0,0xBE);          // Read Scratchpad
  
  tempDataLSB=Ow_Read(&PORTE,0);    // Read LSB
  tempDataMSB=Ow_Read(&PORTE,0);    // Read MSB
  
  tempData=tempDataMSB;
  tempData<<=8;
  tempData+=tempDataLSB;

  // Negative Temperature
  if(tempData>0xF800){
    tempData=~tempData+1;
    sign=-1;
  }

  temperature = (tempData>>4);
  temperature+= 0.0625*(tempData&0x000F);
  
  return (float)sign*temperature;
}