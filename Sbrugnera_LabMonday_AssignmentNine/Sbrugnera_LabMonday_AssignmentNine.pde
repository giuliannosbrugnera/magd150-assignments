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

// Class that represents a Character
class Char {
  // Instance variable, stores an image
  private PImage img;
  
  // Constructor
  public Char( PImage img ) {
    this.img = img;
  }
  
  // Displays the image on the screen
  public void display( float x_coordinate, float y_coordinate ) {
    image( img, x_coordinate, y_coordinate );
  }

}

// Global variables
Timer timer;

Char mario;
Char luigi;
Char bowser;

float marioCounter = 700;
float luigiCounter = -200;

boolean mouseClicked = false;

// The setup() function is run once, when the program starts
// It is used to define initial enviroment properties such as screen size
void setup(){

  // Create a frame width pixels wide, height pixels high
  size( 1600, 900 );
  
  // Create a new instance of the Timer class
  timer = new Timer( 5000 );
  
  // Create new instances of the Char class
  mario = new Char( loadImage( "mario.jpg" ) );
  luigi = new Char( loadImage( "luigi.jpg" ) );
  bowser = new Char( loadImage( "bowser.png" ) );

  // Start timer
  timer.startTimer();

}

// The draw() function continuously executes the lines of code contained inside its block until the
// program is stopped or noLoop() is called. draw() is called automatically after setup()
void draw(){
  
  background( 255 );
  
  if ( !mouseClicked ) {
    if ( timer.isFinished() ) {
      luigi.display( luigiCounter, -300 );
      luigiCounter += 0.5;
    }
    else {
      mario.display( marioCounter, 0 );
      marioCounter -= 0.5;
    }
  }
  else {
    bowser.display( (width / 2) - 300, 0 );
  }
  
}

// Change the state of the variable when the mouse is clicked
void mouseClicked() {
  mouseClicked = true;
}