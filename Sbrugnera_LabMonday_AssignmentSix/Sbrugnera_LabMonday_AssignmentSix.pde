// Global variables
int myWidth = 100;
int myHeight = 100;
int count = 0;
int posX = 0;

// Global constants
final int back = 8;

// The setup() function is run once, when the program starts
// It is used to define initial enviroment properties such as screen size
void setup() {

  // Create a frame width pixels wide, height pixels high
  size( 1600, 900 );

}

// The draw() function continuously executes the lines of code contained inside its block until the
// program is stopped or noLoop() is called. draw() is called automatically after setup()
void draw() {
  
  background( 255 );
  
  if ( playerLost() ) {
    // Orange reached right border. Draw random apples
    drawRandomApples();
    noLoop();
  }
  else {
    // Create a message based on the ellipse X position
    String message;
    if ( posX < width / 2 ) {
      message = "The orange is before the half of the screen! Click to keep it away from the right border!";
    }
    else if ( posX < width - 300 ) {
      message = "Do not let the orange reach the right border! Keep clicking!";
    }
    else {
      message = "Oh no... Behold! The apples are coming!!!";
    }
    
    // Display the message and the moving ellipse
    showMessage( message );
    drawMovingOrange();
  }
  
}

// Checks if the ellipse reached the right border
// Returns TRUE if the ellipse reached the right border. FALSE otherwise
boolean playerLost()  {
  
  return posX >= width - myWidth / 2;

}

// Method called every time the mouse is pressed
// Move the ellipse "back" pixels backwards
void mousePressed() {
  
  posX -= back;

}

// Show the message based on the ellipse X position on the screen
void showMessage( String message ) {

  fill( 50 );
  textSize( 32 );
  text( message, 50, 80, width - 50, 800 );  // Text wraps within text box
  
}

// Draw the moving orange
void drawMovingOrange() {

  fill( 222, 122, 0 );
  stroke( 222, 122, 0 );
  ellipse( posX, height / 2, myWidth, myHeight );
  posX += 2;

}

// Draw ten random setted up apples
void drawRandomApples() {

  for ( int i = 0; i < 10; i++ ) {
    // Setting the color for all the ellipses
    fill( 222, 9, 9 );
    
    // Setting the stroke width and color
    stroke( random( 50 ) );
    strokeWeight( random( 10 ) );
  
    ellipse( random( width ), random( height ), myWidth, myHeight );
  }  
  
}