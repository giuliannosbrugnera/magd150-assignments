import processing.sound.*;
SoundFile themeSong;
SoundFile coinCollected;
SoundFile oneupCollected;
SoundFile flowerCollected;

// Global constants
final String STATIC = "STATIC";
final String NPC = "NPC_MOVEMENT";
final String PLAYER = "PLAYER_MOVEMENT";
final int GLOBAL_TIME = 5500;
final int HIGHEST_INTEGER = 255;

// Timer class (NOT original)
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

// Movement class (NOT original)
class Movement {
  private int centerX;
  private int centerY;
  private int initialCenterX;
  private int initialCenterY;
  private boolean keys[];    // In this array, the index corresponds with W,S,A,D.
  private int xVelocity, yVelocity;
  private Image object;
  
  // constructor
  public Movement( Image object ) {
    this.object = object;
    if ( object.getTypeMovement().equals( NPC ) ) {
      // NPC has a different type of positioning
      centerX = width;
      centerY = round( random( (height / 2) - 100, (height / 2) + 100 ) );
    }
    else {
      initialCenterX = centerX = round( random( object.getImage().width * 2, width - object.getImage().width * 2 ) );
      initialCenterY = centerY = round( random( object.getImage().height * 2, height - object.getImage().height * 2 ) );
    }
    keys = new boolean[4];
  }
  
  public int getCenterX() { return centerX; }
  
  public int getCenterY() { return centerY; }
  
  public void display() {
    switch ( object.getTypeMovement() ) {
      case ( STATIC ) :
        // Static image, does not move
        image( object.getImage(), initialCenterX, initialCenterY );
        break;
      case ( NPC ) :
      case ( PLAYER ) :
        // Images that has movement (centerX and centerY get updated)
        image( object.getImage(), centerX, centerY );
        break;
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
    if ( object.getTypeMovement().equals( NPC ) ) {
      centerX -= 5;
    }
    else {
      centerX += xVelocity;
      centerY += yVelocity;
    }
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

// Image class (ORIGINAL)
class Image {
  private PImage image;
  private String typeMovement;
  
  // Constructor
  public Image( PImage image, String typeMovement ) {
    this.image = image;
    this.typeMovement = typeMovement;
  }
  
  public PImage getImage() { return this.image; }
  
  public String getTypeMovement() { return this.typeMovement; }
}

// Element abstract class (ORIGINAL), works as the base class for the different shapes to be drawn
abstract class Element {
  private float x;
  private float y;
  private color c;
  private float myWidth;
  private float myHeight;
  
  // Constructor
  public Element( float x, float y, color c, float myWidth, float myHeight ) {
    this.x = x;
    this.y = y;
    this.c = c;
    this.myWidth = myWidth;
    this.myHeight = myHeight;
  }
  
  public float getX() { return x; }
  
  public float getY() { return y; }
  
  public color getC() { return c; }
  
  public float getWidth() { return myWidth; }
  
  public float getHeight() { return myHeight; }
  
  // Abstract method that every derived class must implement
  public abstract void display();
}

// Ellipse class (ORIGINAL)
final class Ellipse extends Element {
  // Constructor
  public Ellipse( float x, float y, color c, float myWidth, float myHeight ) {
    super( x, y, c, myWidth, myHeight );
  }
  
  // Displays an ellipse
  public final void display() {
    ellipseMode( CENTER );
    fill( getC() );
    stroke( getC() );
    ellipse( getX(), getY(), getWidth(), getHeight() );
  }
}

// Rectangle class (ORIGINAL)
final class Rectangle extends Element {
  // Constructor
  public Rectangle( float x, float y, color c, float myWidth, float myHeight ) {
    super( x, y, c, myWidth, myHeight );
  }
  
  // Displays a rectangle
  public final void display() {
    rectMode( CORNER );
    fill( getC() );
    stroke( getC() );
    rect( getX(), getY(), getWidth(), getHeight() );
  }
}

// Arc class (ORIGINAL)
final class Arc extends Element {
  public float start;
  public float stop;
  
  // Constructor
  public Arc( float x, float y, color c, float myWidth, float myHeight, float start, float stop ) {
    super( x, y, c, myWidth, myHeight );
    this.start = start;
    this.stop = stop;
  }
  
  // Displays an arc
  public final void display() {
    fill( getC() );
    stroke( getC() );
    arc( getX(), getY(), getWidth(), getHeight(), start, stop );
  }
}

// Point class (ORIGINAL)
final class Point extends Element {
  // Constructor
  public Point( float x, float y, color c ) {
    super( x, y, c, 0, 0 );
  }
  
  // Displays a point
  public final void display() {
    stroke( getC() );
    point( getX(), getY() );
  }
}

// Global instance variables
int redColor = 254;
int greenColor = 254;
int blueColor = 254;
int itemsCollected = 0;

Timer timer;

// Two arrays
Movement[] movements;
Element[] elements;

// The setup() function is run once, when the program starts
// It is used to define initial enviroment properties such as screen size
void setup() {
  
  // Create a frame width pixels wide, height pixels high
  size( 1600, 900 );
  
  // Create a new instance of the Timer class and start it
  createAndStartTimer();
  
  // Create an array of Element elements
  elements = new Element[5];
  
  // Create new instances
  // In total, it will load 4 distinct original elements
  elements[0] = new Ellipse( 1450, 100, color( 252, 208, 25 ), 200, 200 );
  elements[1] = new Rectangle( 1400, 140, color( 35, 124, 11 ), 100, 2 );
  elements[2] = new Arc( 1350, 40, color( 10, 54, 147 ), 100, 100, 0, HALF_PI );
  elements[3] = new Point( 1430, 70, color( 35, 124, 11 ) );
  elements[4] = new Point( 1470, 70, color( 35, 124, 11 ) );
  
  // Create a new instance of the Movement class
  movements = new Movement[5];
  
  // Create new instances
  // In total, it will load 7 images (these 5 plus other 2 for the last 2 stages)
  movements[0] = new Movement( new Image( loadImage( "paper_mario.png" ), PLAYER ) );
  movements[1] = new Movement( new Image( loadImage( "magikoopa.png" ), STATIC ) );
  movements[2] = new Movement( new Image( loadImage( "marching_milde.png" ), STATIC ) );
  movements[3] = new Movement( new Image( loadImage( "bigger_boo.png" ), STATIC ) );
  movements[4] = new Movement( new Image( loadImage( "coin.png" ), NPC ) );
  
  // Setting the stroke width and color to all shapes
  stroke( 0 );
  strokeWeight( 8 );
  
  // Loading the soundfiles from the /data folder of the sketch
  // In total, it will load 4 sounds
  // 'themeSong' plays in a loop, the other three are triggered whenever the specific item is collected
  themeSong = new SoundFile( this, "smw_title_theme.mp3" );
  coinCollected = new SoundFile( this, "smw_coin.wav" );
  oneupCollected = new SoundFile( this,  "smw_1-up.wav" );
  flowerCollected = new SoundFile( this, "smw_fireball.wav" );
  
  themeSong.loop();
}

// The draw() function continuously executes the lines of code contained inside its block until the
// program is stopped or noLoop() is called. draw() is called automatically after setup()
void draw() {
  
  // Defines the background color
  // Since it is being defined inside the draw() method, it must be the first statement
  // Otherwise anything drawn using a statement above this one would be overlapped
  background( redColor % HIGHEST_INTEGER, greenColor % HIGHEST_INTEGER, blueColor % HIGHEST_INTEGER );
  
  // Display each object in the array
  for ( int i = 0; i < elements.length; i++ ) {
    elements[i].display();
  }
  
  // Update and display each object in the array
  for ( int i = 0; i < movements.length; i++ ) {
    movements[i].update();
    movements[i].display();
  }
  
  // Verify if the times has finished
  if ( timer.isFinished() ) {
    // Create and start a new timer
    createAndStartTimer();
    
    // An item is created every time that a new timer is started
    createNewItem();
  }
  
  // Level of collision detection
  // Calculates the distance between the player and the coin
  if ( dist( movements[0].getCenterX(), movements[0].getCenterY(), movements[4].getCenterX(), movements[4].getCenterY() ) < 40 ) {
    itemsCollected++;
    if ( itemsCollected <= 10 ) {
      // Coin collected! Trigger the sound
      coinCollected.play();
    }
    else if ( itemsCollected <= 20 ) {
      // 1-up collected! Trigger the sound
      oneupCollected.play();
    }
    else {
      // Flower collected! Trigger the sound
      flowerCollected.play();
    }
    createAndStartTimer();
    createNewItem();
  }
  
}

// Create a new instance of the Timer class and start it
void createAndStartTimer() {
  timer = new Timer( GLOBAL_TIME );
  timer.startTimer();
}

// Create a new item
// This is the 3 stages:
// 1 - collect coins
// 2 - collect 1-ups
// 3 - collect flowers
// Each stage is triggered based on the number of items collected
void createNewItem() {
  String itemPath = "";
  
  if ( itemsCollected <= 10 ) {
    itemPath = "coin.png";
  }
  else if ( itemsCollected <= 20 ) {
    itemPath = "1up.png";
  }
  else {
    itemPath = "flower.png";
  }
  // 5th position is always for the item (NPC because has movement)
  movements[4] = new Movement( new Image( loadImage( itemPath ), NPC ) );
}

// Input from keyboard: moves the player
void keyPressed() {
 for ( int i = 0; i < movements.length; i++ ) {
   movements[i].keyPressed(); // the global keyPressed function calls the Movement class keyPressed method.
 }
}

// Input from keyboard: moves the player
void keyReleased() {
 for ( int i = 0; i < movements.length; i++ ) {
   movements[i].keyReleased(); // the global keyReleased function calls the Movement class keyReleased method.
 }
}

// Input from mouse
// Method called every time the mouse is pressed
void mousePressed() {
  redColor += 222;
  blueColor += 25;
  greenColor += 60; 
}