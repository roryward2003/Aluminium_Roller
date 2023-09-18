//////////////////////////
//// Abstract widget    //
//////////////////////////

//// Widgets used for various kinds of user interaction

//abstract class Widget implements Drawable {
//  int x, y, width, height;
//  String label; int event;
//  color widgetColor, labelColor;
//  PFont widgetFont;
//  boolean outlineActive;

//  Widget(int x,int y, int width, int height, String label,
//  color widgetColor, PFont widgetFont, int event){
//    this.x=x; this.y=y; this.width = width; this.height= height;
//    this.label=label; this.event=event; 
//    this.widgetColor=widgetColor; this.widgetFont=widgetFont;
//   }
   
  //void setWidgetColor(color widgetColor)
  //{
  //  this.widgetColor = widgetColor;
  //}
 
  //boolean getOutlineStatus()
  //{
  //  return outlineActive;
  //}
  
  //void setOutlineStatus(boolean newStatus)
  //{
  //  this.outlineActive = newStatus;
  //}
  
//  void draw(){
//    fill(widgetColor);
//    if (outlineActive)
//    {
//      pushStyle();
//      stroke(200);
//      rect(x,y,width,height, 28);
//      popStyle();
//    }
//    else
//    {
//      rect(x,y,width,height, 28);
//    }
//    fill(labelColor);
//    textFont(widgetFont);
//    text(label, x+10, y+height-10);
//  }
  
//  abstract void pressWidget();
  
//  int getEvent(int mX, int mY){
//     if(mX>x && mX < x+width && mY >y && mY <y+height){
//        return event;
//     }
//     return EVENT_NULL;
//  }
//}

//////////////////////////
//// Buttons            //
//////////////////////////

//// SubClass of Widget that allows users to cause a given action to occur

//class Button extends Widget {
//  Button(int x,int y, int width, int height, String label, color widgetColor, PFont widgetFont, int event){
//    super(x, y, width, height, label, widgetColor, widgetFont, event);
//  } 
   
//  void pressWidget() {
//    if (event != EVENT_NULL)
//      switch(event) {
//        case EVENT_FORWARD:
//          if(currScreenIndex<screenList.size()-1)
//            currScreenIndex++;
//          else
//            currScreenIndex = 0;
//          break;
//        case EVENT_BACK:
//        if(currScreenIndex>0)
//            currScreenIndex--;
//        else
//            currScreenIndex = screenList.size() - 1;
//          break;
//        case EVENT_SCREEN_1:
//          currScreenIndex = 0;
//          break;
//        case EVENT_SCREEN_2:
//          currScreenIndex = 1;
//          break;
//        case EVENT_SCREEN_3:
//          currScreenIndex = 2;
//          break;
//        case EVENT_SCREEN_4:
//          currScreenIndex = 3;
//          break;
//        case EVENT_SCREEN_5:
//          currScreenIndex = 4;
//          break;
//        case EVENT_SAVE_FRAME:
//          PImage frame = get(244, 0, SCREENX-244, SCREENY);
//          String file = JOptionPane.showInputDialog("Enter the name (and/or full path) for your file (e.g. frame.png (default), C:/Users/test/frame.png):");
//          if (file == null)
//            break;
//          try {
//            if (file.equals(""))
//            {
//              file = "frame.png";
//            }
//            if (!file.contains("."))
//            {
//              file = file + ".png";
//            }
//            frame.save(file);
//            JOptionPane.showMessageDialog(null, "Frame saved successfully as " + file + "!", "Operation successful", 1);
//          }
//          catch (Exception e) { 
//            JOptionPane.showMessageDialog(null, "The frame was not saved. Error: " + e.getClass().getCanonicalName(), "Operation unsuccessful", 0);
//          }
//          break;
//        case EVENT_SAVE_CSV:
//          String csv = JOptionPane.showInputDialog("Enter the name (and/or full path) for your file (e.g. export.csv (default)):");
//          if (csv == null)
//            break;
//          try {
//            if (csv.equals(""))
//            {
//              csv = "export.csv";
//            }
//            if (!csv.contains("."))
//            {
//              csv = csv + ".csv";
//            }
//            FileWriter newCsv = new FileWriter(sketchPath() + "/" + csv);
//            BufferedWriter bufferWrite = new BufferedWriter(newCsv);
            
//            boolean firstLineDone = false;
//            for (String[] line: mainSpreadsheet.data)
//            {
//              String newLine = String.join(",", line);
//              if ((!firstLineDone) || (newLine.toLowerCase().contains(search.label.toLowerCase())))
//              {
//                bufferWrite.write(newLine + "\n");
//                firstLineDone = true;
//              }
//            }
//            bufferWrite.flush();
//            bufferWrite.close();
//            JOptionPane.showMessageDialog(null, "File saved successfully as " + csv + "!", "Operation successful", 1);
//          }
//          catch (Exception e) { 
//            JOptionPane.showMessageDialog(null, "The file was not saved. Error: " + e.getClass().getCanonicalName(), "Operation unsuccessful", 0);
//          }

//        default:
//          break;
//      }
//  }
//}

//////////////////////////
//// Checkboxes         //
//////////////////////////

//// SubClass of Widget that allows users to turn a given function on or off

//class Checkbox extends Widget {
//  private boolean pressed;
//  String hoverText = null;
//  TextBox tooltip;
    
//  Checkbox(int x,int y, int width, int height, color widgetColor, PFont widgetFont, int event) {
//    super(x, y, width, height, "", widgetColor, widgetFont, event);
//    if(event != EVENT_KILOMETER_CHECKBOX && event != EVENT_INVERTER_CHECKBOX && event != EVENT_DESCENDING_CHECKBOX)
//      tooltip = new TextBox (50, 550, 175, 45, "", color(220, 255, 220), color(0), stdFont, EVENT_DO_NOTHING);
//    else
//      tooltip = new TextBox (100, 100, 100, 100, "", color(255), color(255), stdFont, EVENT_DO_NOTHING, false);
//  }
  
//  boolean getPressed() {
//    return this.pressed;
//  }
  
//  void setPressed(boolean value) {
//    if (value)
//    {
//      pressed = true;
//      //label = "√";
//    }
//    else
//    {
//      pressed = false;
//      label = "";
//    }
//  }
  
//  void pressWidget() {
//    if (event != EVENT_KILOMETER_CHECKBOX && event != EVENT_INVERTER_CHECKBOX && event != EVENT_DESCENDING_CHECKBOX) infoToPrint[event-101] = !pressed;
//    getCertainFlightInfo();
//    if (!pressed)
//    {
//    setPressed(true);
//      switch (event)
//      {
//        case EVENT_KILOMETER_CHECKBOX: {
//          kilometerConverter = true;
//          Histogram currHist = (Histogram) screenList.get(2).drawableList.get(1);
//          currHist.swapMilesKm();
//          for(String i : airportDistances.keySet())
//            airportDistances.replace(i, (int)(1.609344*airportDistances.get(i)));
//          getCertainFlightInfo();
//          break;
//        }    
//        case EVENT_INVERTER_CHECKBOX:
//          inverted = true;
//          for(Screen screen : screenList) {
//            for(Drawable drawable : screen.drawableList) {
//              if(drawable instanceof Histogram) {
//                Histogram hist = (Histogram) drawable;
//                if(descending)
//                  hist.sortDescending();
//                hist.invertData();
//              }
//              else if(drawable instanceof LineGraph) {
//                LineGraph lineGraph = (LineGraph) drawable;
//                if(descending)
//                  lineGraph.sortDescending();
//                lineGraph.invertData();
//              }
//            }
//          }
//          screenList.get(currScreenIndex).updateHistogram(true);
//          break;
//        case EVENT_DESCENDING_CHECKBOX:
//          descending = true;
//          for(Screen screen : screenList) {
//            for(Drawable drawable : screen.drawableList) {
//              if(drawable instanceof Histogram) {
//                Histogram hist = (Histogram) drawable;
//                hist.sortDescending();
//                if(inverted)
//                  hist.invertData();
//              }
//              else if(drawable instanceof LineGraph) {
//                LineGraph lineGraph = (LineGraph) drawable;
//                lineGraph.sortDescending();
//                if(inverted)
//                  lineGraph.invertData();
//              }
//            }
//          }
//          screenList.get(currScreenIndex).updateHistogram(true);
//          break;
//      }
//    }
//    else
//    {
//      setPressed(false);
//      switch (event)
//      {
//        case EVENT_KILOMETER_CHECKBOX:
//          kilometerConverter = false;
//          Histogram currHist = (Histogram) screenList.get(2).drawableList.get(1);
//          currHist.swapMilesKm();
//          for(String i : airportDistances.keySet())
//            airportDistances.replace(i, (int)((1/1.609344)*airportDistances.get(i)));
//          getCertainFlightInfo();
//          break;
//        case EVENT_INVERTER_CHECKBOX:
//          inverted = false;
//          for(Screen screen : screenList) {
//            for(Drawable drawable : screen.drawableList) {
//              if(drawable instanceof Histogram) {
//                Histogram hist = (Histogram) drawable;
//                if(descending)
//                  hist.sortDescending();
//                else
//                  hist.invertData();
//              }
//              else if(drawable instanceof LineGraph) {
//                LineGraph lineGraph = (LineGraph) drawable;
//                if(descending)
//                  lineGraph.sortDescending();
//                else
//                  lineGraph.invertData();
//              }
//            }
//          }
//          screenList.get(currScreenIndex).updateHistogram(true);
//          break;
//        case EVENT_DESCENDING_CHECKBOX:
//          descending = false;
//          for(Screen screen : screenList) {
//            for(Drawable drawable : screen.drawableList) {
//              if(drawable instanceof Histogram) {
//                Histogram hist = (Histogram) drawable;
//                hist.sortOriginal();
//                if(inverted)
//                  hist.invertData();
//              }
//              else if(drawable instanceof LineGraph) {
//                LineGraph lineGraph = (LineGraph) drawable;
//                lineGraph.sortOriginal();
//                if(inverted)
//                  lineGraph.invertData();
//              }
//            }
//          }
//          screenList.get(currScreenIndex).updateHistogram(true);
//          break;
//      }
//    }
//  }
  
//  void handleMouseMoveEvents() {
//    tooltip.x=mouseX+10;
//    tooltip.y=mouseY+10;
//    int event = getEvent(mouseX, mouseY);
//    switch (event) {
//      case EVENT_FLIGHT_ID_CHECKBOX :
//        hoverText =  "Flight I.D.";
//        break;
//      case EVENT_FLIGHT_DATE_CHECKBOX :
//        hoverText = "Flight Date";
//        break;
//      case EVENT_CARRIER_CHECKBOX :
//        hoverText = "Carrier";
//        break;
//      case EVENT_CARRIER_NUMBER_CHECKBOX :
//        hoverText = "Carrier Number";
//        break;
//      case EVENT_ORIGIN_CHECKBOX :
//        hoverText = "Origin";
//        break;
//      case EVENT_ORIGIN_CITY_CHECKBOX :
//        hoverText = "Origin City";
//        break;
//      case EVENT_ORIGIN_STATE_CHECKBOX :
//        hoverText = "Origin State";
//        break;
//      case EVENT_DESTINATION_CHECKBOX :
//        hoverText = "Destination";
//        break;
//      case EVENT_DESTINATION_CITY_CHECKBOX :
//        hoverText = "Destination City";
//        break;
//      case EVENT_DESTINATION_STATE_CHECKBOX :
//        hoverText = "Destination State";
//        break;
//      case EVENT_SCHEDULED_DEPARTURE_TIME_CHECKBOX :
//        hoverText = "Scheduled Departure Time";
//        break;
//      case EVENT_DEPARTURE_TIME_CHECKBOX :
//        hoverText = "Actual Departure Time";
//        break;
//      case EVENT_SCHEDULED_ARRIVAL_TIME_CHECKBOX :
//        hoverText = "Scheduled Arrival Time";
//        break;
//      case EVENT_ARRIVAL_TIME_CHECKBOX :
//        hoverText = "Actual Arrival Time";
//        break;
//      case EVENT_CANCELLED_CHECKBOX :
//        hoverText = "Cancelled?";
//        break;
//      case EVENT_DIVERTED_CHECKBOX :
//        hoverText = "Diverted?";
//        break;
//      case EVENT_DISTANCE_CHECKBOX :
//        hoverText = "Distance Flown";
//        break;
//    }
//  }
  
//  void draw()
//  {
//    super.draw();
//    if(pressed)
//      image(tickImgBlack, x+(width-tickImgBlack.width)/2, y+(height-tickImgBlack.height)/2);
//    handleMouseMoveEvents();
//    if (getOutlineStatus() && hoverText != null) {
//      tooltip.label = hoverText;
//      tooltip.draw();
//    }
//  }
//}


//////////////////////////
//// Radio buttons      //
//////////////////////////

//// SubClass of Widget that allows users to select one button out of a given group of buttons to be active

//class RadioButton extends Widget
//{
//  int group;
//  boolean pressed;
  
//  RadioButton(int x,int y, int width, int height, String label, color widgetColor, PFont widgetFont, int event, int group, boolean pressed){
//      super(x, y, width, height, label, widgetColor, widgetFont, event);
//      this.group = group;
//      this.pressed = pressed;
//  }
  
//  void draw() {
//    fill(widgetColor);
//    if (outlineActive)
//    {
//      pushStyle();
//      stroke(200);
//      rect(x,y,width,height, 28);
//      if(pressed) {
//        stroke(0);
//        fill(0, 0, 150);
//        rect(x+3, y+3, width-6, height-6, 28);
//      }
//      popStyle();
//    }
//    else
//    {
//      rect(x,y,width,height, 28);
//      if(pressed) {
//        fill(0, 0, 150);
//        rect(x+3, y+3, width-6, height-6, 28);
//      }
//    }
//    fill(labelColor);
//    textFont(widgetFont);
//    text(label, x+width+5, y+height-5);
//  }
  
//  void pressWidget() {
//    if(event!=EVENT_NULL) {
//      ArrayList<Drawable> drawableList = screenList.get(currScreenIndex).drawableList;
//      Chart chart;
//      switch(event) {
//        case EVENT_RADIO_GRAPH_1:
//          for(int i=0; i<drawableList.size(); i++) {
//            if (drawableList.get(i) instanceof Chart) {
//              chart = (Chart) drawableList.get(i);
//              chart.active = false;
//            }
//          }
//          chart = (Chart) drawableList.get(0);
//          chart.active = true;
//          break;
//        case EVENT_RADIO_GRAPH_2:
//          for(int i=0; i<drawableList.size(); i++) {
//            if (drawableList.get(i) instanceof Chart) {
//              chart = (Chart) drawableList.get(i);
//              chart.active = false;
//            }
//          }
//          chart = (Chart) drawableList.get(1);
//          chart.active = true;
//          break;
//        case EVENT_RADIO_GRAPH_3:
//          for(int i=0; i<drawableList.size(); i++) {
//            if (drawableList.get(i) instanceof Chart) {
//              chart = (Chart) drawableList.get(i);
//              chart.active = false;
//            }
//          }
//          chart = (Chart) drawableList.get(2);
//          chart.active = true;
//          break;
//      }
//    }
//    Screen currentScreen = (Screen) screenList.get(currScreenIndex);
    
//    if (!pressed)
//    {
//      for (Drawable drawable: currentScreen.drawableList)
//      {
//        if (drawable instanceof RadioButton)
//        {
//          RadioButton button = (RadioButton) drawable;
//          if (button.group == group)
//          {
//            button.pressed = false;
//          }
//        }
//      }
//      pressed = true;
//    }
//  }
    
//  int getEvent(int mX, int mY){
//    if(mX>x && mX < x+width && mY >y && mY <y+height) {
//      return event;
//    }

//    return EVENT_NULL;
//  }
//}

//////////////////////////
//// Sliders            //
//////////////////////////

//// SubClass of Widget that allows users to scroll or select any value within a given range

//class Slider extends Widget
//{
//  int value;
//  int min;
//  int max;
//  int sliderPos;
//  boolean isVertical;
//  boolean isHistController;
//  boolean sliderInUse;
  
//  Slider(int x,int y, int width, int height, color widgetColor, PFont widgetFont, int value, int min, int max, boolean isVertical, boolean isHistController){
//      super(x, y, width, height, "", widgetColor, widgetFont, EVENT_SLIDER);
//      this.value = value;
//      this.min = min;
//      this.max = max;
//      this.label = Integer.toString(value);
//      this.isHistController = isHistController;
//      this.isVertical = isVertical;
//      if (isVertical)
//        this.sliderPos = this.y;
//      else if(isHistController)
//        this.sliderPos = this.x+value;
//      else
//        this.sliderPos = this.x;
//  }

//  void checkMinMax()
//  {
//    if (value < min)
//    {
//      if (isVertical)
//        sliderPos = y;
//      else
//        sliderPos = x;
//      value = min;
//      label = Integer.toString(value);
//    }
//    else if (value > max)
//    {
//      if (isVertical)
//        sliderPos = y + max;
//      else
//        sliderPos = x + max;
//      value = max;
//      label = Integer.toString(value);
//    }
//  }
  
//  void draw(){
//    checkMinMax();
    
//    fill(widgetColor);
//    if (outlineActive)
//    {
//      pushStyle();
//      stroke(255);
//      rect(x,y,width,height);
//      if (isVertical)
//        rect(x, sliderPos, 20, 20);
//      else
//        rect(sliderPos, y, 20, 20);
//      popStyle();
//    }
//    else
//    {
//      rect(x,y,width,height);
//      if (isVertical)
//        rect(x, sliderPos, 20, 20);
//      else
//        rect(sliderPos, y, 20, 20);
//    }
//    fill(labelColor);
//    textFont(widgetFont);
//    if (!isVertical && !isHistController)
//      text(label, x-50, y+height);
//  }

//  void pressWidget() {
//    if (isVertical)
//    {
//      sliderPos = mouseY - 10;
//      value = mouseY - y - 10;
//      sliderInUse = true;
//    }
//    else
//    {
//      sliderPos = mouseX - 10;
//      value = mouseX - x - 10;
//      sliderInUse = true;
//    }
//    label = Integer.toString(value);
//  }

//  int getEvent(int mX, int mY){
//    if (isVertical)
//    {
//      if((mY>sliderPos && mY < sliderPos+20 && mX >x && mX <x+20)
//      || (mY>y && mY < y+height && mX >x && mX <x+width)){
//        return event;
//      }
//    }
//    else
//    {
//      if((mX>sliderPos && mX < sliderPos+20 && mY >y && mY <y+20)
//      || (mX>x && mX < x+width && mY >y && mY <y+height)){
//        return event;
//      }
//    }
//    return EVENT_NULL;
//  }
  
//  int getValue() {
//    return this.value;
//  }
//}

//////////////////////////
//// TextBox            //
//////////////////////////

//// SubClass of Widget that displays text on the screen

//class TextBox extends Widget {
//  color text_colour;
//  int newlines = 0;
//  boolean visibleBackground;
//  boolean checkBoxText;
 
//  TextBox (int x, int y, int width, int height, String text, color bg, color text_colour, PFont font, int event)
//  {
//    super (x, y, width, height, text, bg, font, event);
//    this.text_colour = text_colour;
//    this.newlines = text.length() - text.replace("\n", "").length();
//    this.visibleBackground = true;
//    this.checkBoxText = false;
//  }
  
//  TextBox (boolean checkBoxText, int x, int y, int width, int height, String text, color bg, color text_colour, PFont font, int event)
//  {
//    super (x, y, width, height, text, bg, font, event);
//    this.checkBoxText = checkBoxText;
//    this.text_colour = text_colour;
//    this.newlines = text.length() - text.replace("\n", "").length();
//    this.visibleBackground = true;
//  }
 
//  TextBox (int x, int y, int width, int height, String text, color bg, color text_colour, PFont font, int event, boolean visibleBackground)
//  {
//    this(x, y, width, height, text, bg, text_colour, font, event);
//    this.visibleBackground = visibleBackground;
//    this.checkBoxText = false;
//  }
 
//  void pressWidget() {} // "nothing yet"
 
//  void draw()
//  {
//    pushStyle();
//    fill(widgetColor);
//    textFont(widgetFont);
//    if(checkBoxText)
//      textSize(height/2);
//    else
//      textSize(height/3);
//    if (visibleBackground)
//      rect(x, y, width, height + ((height/2)*newlines), 10);
//    fill(text_colour);
//    if (label != null)
//      text(label, x+10, (checkBoxText ? y+(3*height/4) : y+(height/2) ));
//    popStyle();
//  }
//}

//////////////////////////
//// SearchBox          //
//////////////////////////

//// SubClass of Widget that allows users to search for a given phrase within the displayed data

//class SearchBox extends Widget {
//  int tick;
//  boolean active;
//  int charLimit;
  
//  SearchBox (int x, int y, int width, int height, String text, color bg, PFont font, int event, int charLimit)
//  {
//    super (x, y, width, height, text, bg, font, event);
//    tick = -30;
//    active = false;
//    this.charLimit = charLimit;
//  }
  
//  void pressWidget() {
//    if (!active)
//    {
//      label = "";
//      active = true;
//    }
//  }
 
//  void keyPressed(char keyEntered) {
//    if (keyEntered == BACKSPACE)
//      label = label.substring(0, max(0, label.length()-1));
//    else if (keyEntered != ENTER)
//    {
//      if ((label.length() <= charLimit) && ((Character.isLetterOrDigit(keyEntered)) || (keyEntered == ' ') || (Pattern.matches("\\p{Punct}", keyEntered + ""))))
//        label += keyEntered;
//    }
//  }
 
//  void draw()
//  {
//    pushStyle();
//    fill(widgetColor);
//    textFont(widgetFont);
//    textSize(height/3);
//    rect(x, y, width, height, 10);
//    fill(0);
//    if (active)
//    {
//      if (tick < 0)
//      {
//        text(label + "|", x+10, y+(height/2));
//        tick++;
//      }
//      else
//      {
//        text(label, x+10, y+(height/2));
//        tick++;
//        if (tick >= 30)
//          tick = -30;
//      }
//    }
//    else {
//      pushStyle();
//      fill((label == "" ? 50 : 0));
//      text((label == "" ? "Enter search here" : label), x+10, y+(height/2));
//      popStyle();
//    }
//    popStyle();
//  }
//}
