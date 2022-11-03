float x = 0;
float y = 0;

float px;
float py;

float num = 1;

int stepSize = 10;

int turnCount = 0;
int nSteps = 1;
int step = 1;
int state = 0;

void setup() {
  background(0);
  size(600, 600);
}

boolean isPrime(float value) {
  if (value == 1) return false;

  for (int i = 0; i <= sqrt(value); i++) {
    if (value % i == 0) {
      return false;
    }
  }
  return true;
}


void draw() {
  translate(width/2, height/2);

  fill(255);
  stroke(255);
  
  if(isPrime(step)){
    circle(x, y, stepSize*0.25);
  }
  
  line(x, y, px, py);

  px = x;
  py = y;

  switch (state) {
  case 0:
    x += stepSize;
    break;
  case 1:
    y -= stepSize;
    break;
  case 2:
    x -= stepSize;
    break;
  case 3:
    y += stepSize;
    break;
  }

  if (step % nSteps == 0) {
    state = (state + 1) % 4;
    turnCount ++;
    if (turnCount % 2 == 0) {
      nSteps++;
      
    }
  }

  step++;
}
