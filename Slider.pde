class Slider
{
  int x, y, width, height;
  String label; int event;
  color widgetColor, labelColor;
  PFont widgetFont;
  boolean outlineActive;
  
  int value;
  int min;
  int max;
  int sliderPos;
  boolean isVertical;
  boolean isHistController;
  boolean sliderInUse;
  
  Slider(int x,int y, int width, int height, color widgetColor, PFont widgetFont, int value, int min, int max, boolean isVertical, boolean isHistController){
      this.x=x; this.y=y; this.width = width; this.height= height;
      this.label=""; this.event=EVENT_SLIDER; 
      this.widgetColor=widgetColor; this.widgetFont=widgetFont;
      this.value = value;
      this.min = min;
      this.max = max;
      this.label = Integer.toString(value);
      this.isHistController = isHistController;
      this.isVertical = isVertical;
      this.sliderPos = this.x+value;
  }
  
  void setWidgetColor(color widgetColor)
  {
    this.widgetColor = widgetColor;
  }
 
  boolean getOutlineStatus()
  {
    return outlineActive;
  }
  
  void setOutlineStatus(boolean newStatus)
  {
    this.outlineActive = newStatus;
  }

  void checkMinMax()
  {
    if (value < min)
    {
      if (isVertical)
        sliderPos = y;
      else
        sliderPos = x+min;
      value = min;
      label = Integer.toString(value);
    }
    else if (value > max)
    {
      if (isVertical)
        sliderPos = y + max;
      else
        sliderPos = x + max;
      value = max;
      label = Integer.toString(value);
    }
    else
      sliderPos = value+x;
      label = Integer.toString(value);
  }
  
  void draw(){
    checkMinMax();
    
    fill(widgetColor);
    if (outlineActive)
    {
      pushStyle();
      stroke(255);
      rect(x+min,y,width-min,height);
      if (isVertical)
        rect(x, sliderPos, 20, 20);
      else
        rect(sliderPos, y, 20, 20);
      popStyle();
    }
    else
    {
      rect(x+min,y,width-min,height);
      if (isVertical)
        rect(x, sliderPos, 20, 20);
      else
        rect(sliderPos, y, 20, 20);
    }
    fill(labelColor);
    textFont(widgetFont);
    label = Integer.toString(value);
    text(label, x-45, y+height);
  }

  void pressWidget() {
    if (isVertical)
    {
      sliderPos = mouseY - 10;
      value = mouseY - y - 10;
      sliderInUse = true;
    }
    else
    {
      sliderPos = mouseX - 10;
      value = mouseX - x - 10;
      sliderInUse = true;
    }
    label = Integer.toString(value);
    checkMinMax();
  }

  int getEvent(int mX, int mY){
    if (isVertical)
    {
      if((mY>sliderPos && mY < sliderPos+20 && mX >x && mX <x+20)
      || (mY>y && mY < y+height && mX >x && mX <x+width)){
        return event;
      }
    }
    else
    {
      if((mX>sliderPos && mX < sliderPos+20 && mY >y && mY <y+20)
      || (mX>x+min && mX < x+width && mY >y && mY <y+height)){
        return event;
      }
    }
    return EVENT_NULL;
  }
  
  int getValue() {
    return this.value;
  }
}
