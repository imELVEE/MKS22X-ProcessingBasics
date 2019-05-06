int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y;
  float [] values;
  float [] speeds;
  Visualizer(float x, float y) {
    this.x = x;
    this.y = y;
    values = new float[int(random(40)+1)];
    //speeds = new float[10];
    speeds = new float[values.length];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }

  void display() {
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    fill(255);
    rect(x, y, values.length * 20, 200);
    //This is a 200x400 box.
    //The width of the visualizer is 400! This rect is the border

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+100, x+values.length*20, y+100);

    //You need to use a loop. You need to make the HEIGHT of the bars 
    //the values in the array.
    //Negative values are red, and go below the line.
    //Positive values are green and go above the line.

    //???WRITE THIS METHOD FIRST!!!
    int space = 0;
    for (float value: values){
      if (value > 0){
        fill(255,0,0);
      }
      else{
        fill(0,255,0);
      }
      
      rect(x+space, y+100, 20, value);
      space += 20;
    }
    
    //THESE ARE WRONG: They just illustrate how they could look
    /*
    fill(255, 0, 0);
    rect(x+40, y+100, 60, 50);
    fill(0, 255, 0);
    rect(x+120, y+50, 60, 50);
    */


    //Width of the visualizer is 400!

  
  }
  void update() {
    //???WRITE THIS METHOD SECOND!!!
    for (int i = 0; i < values.length; i++) {
      values[i] += speeds[i]; //the speed updates the values. Do not touch this.
      //??? keep them values between max/min value so they stay in the box.
      if(values[i] >= MAX_VALUE || values[i] <= MIN_VALUE){
        speeds[i] = -speeds[i];
      }

      //??? reverse the speeds so the bar oscillates up/down when it reaches max/min

      
    }
  }
}

void setup() {
  size(1000, 500);
  v = new Visualizer(20, 20);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
