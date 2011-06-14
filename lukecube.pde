int ledPin[16] = 
{
  0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, A0, A1
};
int layPin[4] = 
{
  A2, A3, A4, A5
};

long frameTime = 1000;
long delayTime = 1;
long lastMillis = 0;

int frame = 0;

boolean ledState[4][4][16] = 
{
  //frame 1
  {{1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0}, {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0}, {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0}, {1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0}},
  //frame 2
  {{1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, {1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, {1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, {1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}},
  //frame 3
  {{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1}, {0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, {0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, {0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1}},
  //frame 4
  {{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1}}
};


void setup()
{
  for(int thisPin = 0; thisPin < 16; thisPin++)
  {
    pinMode(ledPin[thisPin], OUTPUT);
    digitalWrite(ledPin[thisPin], LOW); 
  }
}

void loop()
{  
  if(timeCheck() == true)
  {
    frame++;
    if(frame > 5) frame = 0;
  }
  render();
}

boolean timeCheck()
{
  unsigned long nowMillis = millis();
  if(nowMillis - lastMillis > frameTime) 
    return true; 
  else 
    return false;
}

void render()
{
  for(int col = 0; col < 16; col++)
  {
    for(int lay = 0; lay < 4; lay++)
    {
      digitalWrite(layPin[lay], ledState[frame][lay][col]);
      digitalWrite(ledPin[col], ledState[frame][lay][col]);
      delay(1);
      digitalWrite(ledPin[col], LOW);
      digitalWrite(layPin[lay], LOW);
    }
  }
}










