// Global variables
int redColor = 254;
int greenColor = 254;
int blueColor = 254;
int xpos = 0;
int size = 0;

// Modular arithmetic is being used so the values do not surpass their limits
// In example, for colors, we should have numbers between the closed range [0, 255]
// Hence, using modular arithmetic, we can map any integer into a range we want
// Useful to declare constants to achieve this purpose
final int width = 1600;
final int height = 900;
final int highestInteger = 255;

// The setup() function is run once, when the program starts
// It is used to define initial enviroment properties such as screen size
void setup() {

  // Create a frame width pixels wide, height pixels high
  size( 1600, 900 );

}

// The draw() function continuously executes the lines of code contained inside its block until the
// program is stopped or noLoop() is called. draw() is called automatically after setup()
void draw() {
  
  if ( size > 200 ) {
    // When the ellipses's size is greater than 200, the fallacy is shown
    background( 255 );
    
    String fallacy = "The increase of these ellipses's size is augmenting global warming! No one can prove me wrong, therefore my claim is valid :)";
    fill( 50 );
    textSize( 32 );
    text( fallacy, 400, 80, 1000, 800 );  // Text wraps within text box
    
    String fallacyName = "\"burden of proof\". You said that the burden of proof lies not with the person making the claim, but with someone else to disprove.";
    fill( 50 );
    textSize( 32 );
    text( fallacyName, 400, 600, 1000, 800 );  // Text wraps within text box
  }
  else {
    // Defines the background color
    // Since it is being defined inside the draw() method, it must be the first statement
    // Otherwise anything drawn using a statement above this one would be overlapped
    background( redColor % highestInteger, greenColor % highestInteger, blueColor % highestInteger );
    
    // Setting the stroke width and color to all shapes
    stroke( 0 );
    strokeWeight( 8 );
    
    // Print out the coordinates of the mouse, for test purposes
    // This way it is simpler to choose coordinates for the shape's vertex
    // Uncomment these two lines to see the text on the frame. fill( 0 ) improves the text readability
    fill( 0 );
    text( "x: " + mouseX + " y: " + mouseY, 10, 15 );
    
    // Setting the color for all the irregular polygons
    fill( (redColor * 2) % highestInteger, (greenColor * 3) % highestInteger, (blueColor * 4) % highestInteger );
    
    // Drawing the first irregular polygon
    beginShape();
    vertex( (300 + xpos) % width, 220 );
    vertex( (450 + xpos) % width, 122 );
    vertex( (600 + xpos) % width, 220 );
    vertex( (525 + xpos) % width, 360 );
    vertex( (375 + xpos) % width, 360 );
    endShape( CLOSE );
    
    // Drawing the second irregular polygon
    beginShape();
    vertex( (400 + xpos) % width, 520 );
    vertex( (550 + xpos) % width, 422 );
    vertex( (700 + xpos) % width, 420 );
    vertex( (625 + xpos) % width, 660 );
    vertex( (475 + xpos) % width, 660 );
    endShape( CLOSE );
    
    // Drawing the third irregular polygon
    beginShape();
    vertex( (1066 + xpos) % width, 356 );
    vertex( (1066 + xpos) % width, 200 );
    vertex( (1215 + xpos) % width, 83 );
    vertex( (1215 + xpos) % width, 356 );
    endShape( CLOSE );
    
    // Drawing the fourth irregular polygon
    beginShape();
    vertex( (820 + xpos) % width, 620 );
    vertex( (870 + xpos) % width, 620 );
    vertex( (870 + xpos) % width, 840 );
    vertex( (910 + xpos) % width, 840 );
    vertex( (910 + xpos) % width, 860 );
    vertex( (820 + xpos) % width, 860 );
    endShape( CLOSE );
    
    // Drawing the two triangles
    fill( 11, 222, 12 );
    beginShape( TRIANGLES );
    vertex( (29 + xpos) % width, 22 );
    vertex( (35 + xpos) % width, 132 );
    vertex( (144 + xpos) % width, 29 );
    vertex( (1431 + xpos) % width,37 );
    vertex( (1570 + xpos) % width,49 );
    vertex( (1545 + xpos) % width, 271 );
    endShape( CLOSE );
    
    // Drawing the two rectangles
    fill( 18, 6, 198 );
    beginShape( QUADS );
    vertex( (66 + xpos) % width, 583 );
    vertex( (215 + xpos) % width, 583 );
    vertex( (215 + xpos) % width, 856 );
    vertex( (66 + xpos) % width, 856 );
    vertex( (1066 + xpos) % width, 856 );
    vertex( (1066 + xpos) % width, 700 );
    vertex( (1500 + xpos) % width, 700 );
    vertex( (1500 + xpos) % width, 856 );
    endShape( CLOSE );
    
    // Drawing the two arcs
    fill( 157, 112, 27 );
    arc( (860 + xpos) % width, 290, 100, 100, 0, HALF_PI );
    arc( (750 + xpos) % width, 150, 100, 100, HALF_PI, HALF_PI + PI );
    
    // Drawing the two points
    stroke( 222, 11, 36 );
    point( (1133 + xpos) % width, 755 );
    point( (1133 + xpos) % width, 800 );
    
    // Drawing the two lines
    stroke( 247, 255, 28 );
    line( (67 + xpos) % width, 62, (170 + xpos) % width, 700 );
    line( (1294 + xpos) % width, 784, (1513 + xpos) % width, 114 );
    
    stroke( 0 );
    // Drawing the first elipse. Controlled by the mouse position
    fill( 237, 167, 36 );
    ellipse( mouseX, mouseY, 200 + size, 100 + size );
    
    // Drawing the second elipse. Controlled by the mouse position (inverted)
    ellipseMode( RADIUS );
    fill( 247, 255, 28 );
    ellipse( mouseY, mouseX, 100 + size, 100 + size );
  }
  
}

// Method called every time the mouse is pressed
// Changes the variables values for the colors and the elipses's size
void mousePressed() {
  
  redColor += 222;
  blueColor += 25;
  greenColor += 60;
  size += 10;
  
  
}

// Method called every time a key on the keyboard is pressed
// Change the variable value for the x position for the objects
// This way, if the keys keep being pressed, it will create the impression of movement
void keyPressed() {
  
  xpos += 15;
  
}