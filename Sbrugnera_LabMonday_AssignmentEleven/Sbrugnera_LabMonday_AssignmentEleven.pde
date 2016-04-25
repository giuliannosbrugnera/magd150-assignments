// Timer class
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

// Movement class
class Movement {
  private int centerX, centerY;
  private boolean keys[];    // In this array, the index corresponds with W,S,A,D.
  private int xVelocity, yVelocity;
  private Object object;
  
  // constructor
  public Movement() {
    centerX = round( random( 0, width ) );
    centerY = round( random( 0, height ) );
    keys = new boolean[4];
  }
  
  public void setObject( Object object ) {
    this.object = object;
  }
  
  public void display() {
    if ( object.getPositionStatic() ) {
      // Display the image in the center of the screen
      image( object.getImage(), (width / 2) - (object.getImage().width / 2), (height / 2) - (object.getImage().height / 2) );
    }
    else {
      // Image that can be moved
      image( object.getImage(), centerX, centerY );
    }
  }
  
  public void update() {
    if ( keys[0] ) {
      yVelocity = -5;
    }
    if ( keys[1] ) {
      yVelocity = 5;
    }
    if ( keys[2] ) {
      xVelocity = -5;
    }
    if ( keys[3] ) {
      xVelocity = 5;
    }
    if ( !keys[2] && !keys[3] ) { // if both Left and Right are released, horizontal velocity should be zero.
      xVelocity = 0;
    }
    if ( !keys[0] && !keys[1] ){ // if both Up and Down are released, vertical velocity should be zero.
      yVelocity = 0;
    }
    centerX += xVelocity;
    centerY += yVelocity;
  }
  
  public void keyPressed() {
    if ( key == 'w' ) {
      keys[0] = true;
    } 
    if ( key == 's' ) {
      keys[1] = true;
    }
    if ( key == 'a' ) {
      keys[2] = true;
    }
    if ( key == 'd' ) {
      keys[3] = true;
    } 
  }
  
  public void keyReleased() { // the 
    if ( key == 'w' ) {
      keys[0] = false;
    } 
    if ( key == 's' ) {
      keys[1] = false;
    }
    if ( key == 'a' ) {
      keys[2] = false;
    }
    if ( key == 'd' ) {
      keys[3] = false;
    } 
  }   
}

class Object {
  private PImage image;
  private boolean positionStatic;
  
  public Object( PImage image, boolean positionStatic ) {
    this.image = image;
    this.positionStatic = positionStatic;
  }
  
  public PImage getImage() { return this.image; }
  
  public boolean getPositionStatic() { return this.positionStatic; }
}

// Global variables
Timer timer;
Movement[] movementArray;

// The setup() function is run once, when the program starts
// It is used to define initial enviroment properties such as screen size
void setup() {
  
  // Create a frame width pixels wide, height pixels high
  size( 1600, 900 );
  
  // Create a new instance of the Timer class
  timer = new Timer( 5000 );
  
  // Create a new instance of the Movement class
  movementArray = new Movement[2];
  
  // Create new instances
  movementArray[0] = new Movement();
  movementArray[0].setObject( new Object( loadImage( "tv.png" ), true ) );
  
  movementArray[1] = new Movement();
  movementArray[1].setObject( new Object( loadImage( "tom.jpg" ), false ) );
  
  // Start timer
  timer.startTimer();
}

void draw() {
  
  background( 255 );
  
  // Update and display each object in the array
  for ( int i = 0; i < movementArray.length; i++ ) {
    movementArray[i].update();
    movementArray[i].display();
  }
  
}

void keyPressed() {
  for ( int i = 0; i < movementArray.length; i++ ) {
    movementArray[i].keyPressed(); // the global keyPressed function calls the Movement class keyPressed method.
  }
}

void keyReleased() {
  for ( int i = 0; i < movementArray.length; i++ ) {
    movementArray[i].keyReleased(); // the global keyReleased function calls the Movement class keyReleased method.
  }
}