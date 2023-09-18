//Events
final int EVENT_NULL = 0;
final int EVENT_SLIDER = 10;
final int SCALE = 5;
final int X_ZERO = 400;
final int Y_ZERO = 300;
final int X_TEXT = 800;
final int Y_TEXT = 350;

//Vars
float d;
float k;
float h;
float t;

PFont sliderFont;
Slider mainSlider;

void settings() {
  size(1200, 600);
  sliderFont = loadFont("Arial-BoldMT-30.vlw");
}

void setup() {
  frameRate(60);
  //int x,int y, int width, int height, color widgetColor, PFont widgetFont, int value, int min, int max, boolean isVertical, boolean isHistController
  mainSlider = new Slider(85, 500, 1026, 20, color(120, 120, 120), sliderFont, 606, 39, 1006, false, false);
  calculations();
  strokeWeight(3);
}

void draw() {
  background(225, 255, 220);
  
  fill(235, 200, 255);
  ellipse(X_ZERO, Y_ZERO-((d/2)*SCALE), d*SCALE, d*SCALE);
  fill(225, 255, 220);
  ellipse(X_ZERO, Y_ZERO-((d/2)*SCALE), (d-6)*SCALE, (d-6)*SCALE);
  
  fill(200);
  ellipse(X_ZERO, Y_ZERO-(19.5*SCALE), 33*SCALE, 33*SCALE);
  ellipse(X_ZERO, Y_ZERO+(16.5*SCALE), 33*SCALE, 33*SCALE);
  
  fill(255, 150, 150);
  ellipse(X_ZERO+1+((47.5+k)*SCALE), Y_ZERO+1+((16+k)*SCALE), 32*SCALE, 32*SCALE);
  
  mainSlider.draw();
  
  text("Outer diameter = "+mainSlider.getValue()+"mm", X_TEXT, Y_TEXT);
  text("Inner diameter = "+(mainSlider.getValue()-6)+"mm", X_TEXT, Y_TEXT+30);
  text("Turns = "+t+" turns", X_TEXT, Y_TEXT+60);
  text("Turns = "+t+" turns", X_TEXT, Y_TEXT+60);
}

void calculations() {
  d = mainSlider.getValue();
  
  float b = 127+d;
  float numerator = -b+(float)Math.sqrt((b*b)-18050);
  float denominator = 4;
  k = numerator/denominator;
  
  h = (float)Math.sqrt(2*k*k);
  
  t = h/1.5033333;
  println(d);
  println(k);
}

void mousePressed() {
  int event = mainSlider.getEvent(mouseX, mouseY);
  if(event!=EVENT_NULL)
  {
    mainSlider.pressWidget();
  }
  mouseMoved();
}

void mouseMoved() {
  int event = mainSlider.getEvent(mouseX, mouseY);
  if(event!=EVENT_NULL)
    mainSlider.setOutlineStatus(true);
  else
    mainSlider.setOutlineStatus(false);
  calculations();
}

void mouseDragged() {
  if(mainSlider.sliderInUse)
  {
    if ((mainSlider.value <= mainSlider.max) && (mainSlider.value >= mainSlider.min))
    {
      mainSlider.sliderPos = mouseX - 10;
      mainSlider.value = mouseX - mainSlider.x - 10;
      
      mainSlider.label = Integer.toString(mainSlider.value);
    }
    mainSlider.checkMinMax();
  }
  calculations();
}

void mouseReleased() {
  mainSlider.sliderInUse = false;
  mouseMoved();
}

void keyPressed() {
  if(key == CODED)
  {
    if(keyCode == UP || keyCode == RIGHT)
      mainSlider.value+=1;
    else if(keyCode == DOWN || keyCode == LEFT)
      mainSlider.value-=1;
    mainSlider.checkMinMax();
    mouseMoved();
  }
}
