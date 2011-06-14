int ledPin[16] = 
{
  0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
};
int layPin[4] = 
{
  16, 17, 19, 18
};

long interval = 500;
long delayTime = 0.9;
long previousMillis = 0;

int frame = 0;

boolean ledState[4][4][16] = 
{
  //frame 0
  {{1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0}, {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0}, {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0}, {1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0}},
  //frame 1
  {{1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, {1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, {1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, {1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}},
  //frame 2
  {{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1}, {0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, {0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, {0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1}},
  //frame 3
  {{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1}}
};


void setup()
{
  for(int thisPin = 0; thisPin != 17; thisPin++)
  {
    pinMode(ledPin[thisPin], OUTPUT);
    digitalWrite(ledPin[thisPin], LOW); 
  }
  for(int thisPin = 0; thisPin != 5; thisPin++)
  {
    pinMode(layPin[thisPin], OUTPUT);
    digitalWrite(layPin[thisPin], LOW);
  }
}

void loop()
{  
  unsigned long currentMillis = millis();
  if(currentMillis - previousMillis > interval) 
  {
    frame++;
    previousMillis = currentMillis;   
    if (frame == 4) frame = 0;
  }
  render(frame);
}

void render(int x)
{
  for(int col = 0; col != 17; col++)
  {
    for(int lay = 0; lay != 5; lay++)
    {
      digitalWrite(layPin[lay], ledState[x][lay][col]);
      digitalWrite(ledPin[col], ledState[x][lay][col]);
      delay(delayTime);
      digitalWrite(layPin[lay], LOW);
      digitalWrite(ledPin[col], LOW);
    }
  }
}