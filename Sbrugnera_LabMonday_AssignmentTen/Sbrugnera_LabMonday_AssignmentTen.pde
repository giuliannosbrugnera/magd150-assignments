class Timer {
  // two variables to keep track of the time that the timer starts and length of time for the timer.
  private float startTime;
  private float stopTime;
  
  // keep track of the timer, where it's been started on not.
  boolean started = false; 
  
  // constructor. This sets the amount of the time to lapse before it sets the boolean below to true.
  public Timer( float stopTime ) {
    this.stopTime = stopTime;
  }
  
  public void startTimer() {
    startTime = millis();
    started = true;
  }
  
  public void stopTimer() {
    started = false;
  }
  
  public boolean isFinished() {  
    float passedTime = millis() - startTime;
    
    if ( (passedTime > stopTime) && started ) {
      return true;
    }
    
    return false;
  }
}


// Every Fruit instance is represented by an ellipse
abstract class Fruit {

  // Instance variables
  private PImage img;
  private int offset;
  
  // Constructor
  public Fruit( PImage img ) {
    this.img = img;
    this.offset = 0;
  }
  
  // Get methods
  public PImage getImage() { return this.img; }
  
  public int getOffset() { return this.offset; }
  
  public void setOffset( int offset ) {
    this.offset = offset;
  }
  
  public abstract void display();

}

// Subclass of Fruit
class Orange extends Fruit {
  
  // Constructor
  public Orange( PImage img ) {
    super( img );
  }
 
  // Displays the image on the screen
  public void display() {
    image( getImage(), mouseX, mouseY );
  }

}

// Subclass of Fruit
class Apple extends Fruit {
  
  float x;
  float y;

  // Constructor
  public Apple( PImage img, float x, float y ) {
    super( img );
    this.x = x;
    this.y = y;
  }
  
  public void display() {
    image( getImage(), x, y );
  }
  
}

// Global variables
Timer timer;

// Array of objects
Fruit[] fruits;

boolean mouseClicked = false;

// The setup() function is run once, when the program starts
// It is used to define initial enviroment properties such as screen size
void setup() {

  // Create a frame width pixels wide, height pixels high
  size( 1600, 900 );
  
  // Create a new instance of the Timer class
  timer = new Timer( 5000 );
  fruits = new Fruit[3];
  
  // Create new instances
  fruits[0] = new Orange( loadImage( "orange.jpg" ) );
  fruits[1] = new Apple( loadImage( "apple1.jpg" ), random(800), random(800) );
  fruits[2] = new Apple( loadImage( "apple2.jpg" ), random(800), random(800) );
  
  // Start timer
  timer.startTimer();

}

// The draw() function continuously executes the lines of code contained inside its block until the
// program is stopped or noLoop() is called. draw() is called automatically after setup()
void draw() {
  
  background( 255 );
  
  if ( !mouseClicked ) {
    if ( timer.isFinished() ) {
      showFruits( "orange" );
    }
    else {
      showFruits( "apple" );
    }
  }
  
}

// Change the state of the variable when the mouse is clicked
void mouseClicked() {
  mouseClicked = !mouseClicked;
}

// Display a set of fruits, based on the fruitType parameter
void showFruits( String fruitType ) {
  int length = fruits.length;
  for ( int i = 0; i < length; i++ ) {
    switch (fruitType) {
      case "orange" :
        if ( fruits[i] instanceof Orange ) {
          fruits[i].display();
        }
        break;
      case "apple" :
        if ( fruits[i] instanceof Apple ) {
          fruits[i].display();
        }
        break;
    }
  }
}