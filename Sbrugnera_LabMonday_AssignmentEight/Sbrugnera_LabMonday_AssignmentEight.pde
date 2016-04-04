
// Every Fruit instance is represented by an ellipse
abstract class Fruit {

  // Instance variables
  private float x;
  private float y;
  private float myWidth;
  private float myHeight;
  private int offset;
  private float r;
  private float g;
  private float b;
  private boolean displayed;
  
  // Constructor
  public Fruit( float x, float y, float myWidth, float myHeight, float r, float g, float b ) {
    this.x = x;
    this.y = y;
    this.myWidth = myWidth;
    this.myHeight = myHeight;
    this.r = r;
    this.g = g;
    this.b = b;
    this.offset = 0;
    this.displayed = false;
  }
  
  // Get methods
  public float getX() { return this.x; }
  
  public float getY() { return this.y; }
  
  public float getMyWidth() { return this.myWidth; }
  
  public float getMyHeight() { return this.myHeight; }
  
  public float getR() { return this.r; }
  
  public float getG() { return this.g; }
  
  public float getB() { return this.b; }
  
  public int getOffset() { return this.offset; }
  
  public boolean isDisplayed() { return this.displayed; }
  
  public void setOffset( int offset ) {
    this.offset = offset;
  }
  
  public void switchDisplayed() { this.displayed = !this.displayed; }
  
  public abstract void display();
  
  public abstract void move();

}

// Subclass of Fruit
class Orange extends Fruit {
  
  // Constructor
  public Orange( float x, float y, float myWidth, float myHeight, float r, float g, float b ) {
    super( x, y, myWidth, myHeight, r, g, b );
  }
 
  public void display() {
    // Setting the color for the fruit
    fill( getR(), getG(), getB() );
    
    // Setting the stroke width and color
    stroke( random( 50 ) );
    strokeWeight( random( 10 ) );
  
    ellipse( (getX() + getOffset()) % 1600, (getY() + getOffset()) % 900, getMyWidth(), getMyHeight() );
  }
  
  public void move() {
    // Call superclass method
    super.setOffset( getOffset() * 2 );
  }

}

// Subclass of Fruit
class Apple extends Fruit {

  // Constructor
  public Apple( float x, float y, float myWidth, float myHeight, float r, float g, float b ) {
    super( x, y, myWidth, myHeight, r, g, b );
  }
  
  public void display() {
    // Setting the color for the fruit
    fill( getR(), getG(), getB() );
    
    // Setting the stroke width and color
    stroke( random( 50 ) );
    strokeWeight( random( 10 ) );
  
    for ( int i = 0; i < 5; i++ ) {
      ellipse( (getX() + getOffset() + i * 5) % 1600, (getY() + getOffset() + i * 5) % 900, getMyWidth(), getMyHeight() );
    }
    
  }
  
  public void move() {
    // Call superclass method
    super.setOffset( getOffset()  * 3 );
  }
  
}

// Global variables
Fruit orange;
Fruit apple;

// The setup() function is run once, when the program starts
// It is used to define initial enviroment properties such as screen size
void setup() {

  // Create a frame width pixels wide, height pixels high
  size( 1600, 900 );
  
  // Create new instances
  orange = new Orange( random( 20 ), random( 20 ), 100, 100, 222, 122, 0 );
  apple = new Apple( random( 800 ), random( 800 ), 60, 60, 224, 18, 18 );

}

// The draw() function continuously executes the lines of code contained inside its block until the
// program is stopped or noLoop() is called. draw() is called automatically after setup()
void draw() {
  
  // First state
  while ( millis() < 5000 ) {
    background( 18, 224, 26 );
  }
  
  // Second state
  if ( !orange.isDisplayed() ) {
   background( 255 );
   orange.setOffset( (int)random( 30 ) );
   orange.display();
   orange.switchDisplayed();
  }
  
  if ( !apple.isDisplayed() ) {
   apple.setOffset( (int)random( 40 ) );
   apple.display();
   apple.switchDisplayed();
  }
  
}

// Move the fruits on the screen
void mouseClicked() {

  background( 255 );
  orange.move();
  apple.move();
  
  orange.display();
  apple.display();
  
}