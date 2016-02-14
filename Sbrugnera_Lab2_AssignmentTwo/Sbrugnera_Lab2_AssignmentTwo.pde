// The setup() function is run once, when the program starts
// It is used to define initial enviroment properties such as screen size
void setup() {

  // Create a frame 1600 pixels wide, 900 pixels high
  size( 1600, 900 );

}

// The draw() function continuously executes the lines of code contained inside its block until the
// program is stopped or noLoop() is called. draw() is called automatically after setup()
void draw() {
  
  // Defines the background color to white
  // Since it is being defined inside the draw() method, it must be the first statement
  // Otherwise anything drawn using a statement above this one would be overlapped
  background( 255 );
  
  // Setting the stroke width and color to all shapes
  stroke( 0 );
  strokeWeight( 8 );
  
  // Print out the coordinates of the mouse, for test purposes
  // This way it is simpler to choose coordinates for the shape's vertex
  // Uncomment these two lines to see the text on the frame. fill( 0 ) improves the text readability
  //fill( 0 );
  //text( "x: " + mouseX + " y: " + mouseY, 10, 15 );
  
  // Setting the color for all the irregular polygons
  fill( 216, 28, 255 );
  
  // Drawing the first irregular polygon
  beginShape();
  vertex( 300, 220 );
  vertex( 450, 122 );
  vertex( 600, 220 );
  vertex( 525, 360 );
  vertex( 375, 360 );
  endShape( CLOSE );
  
  // Drawing the second irregular polygon
  beginShape();
  vertex( 400, 520 );
  vertex( 550, 422 );
  vertex( 700, 420 );
  vertex( 625, 660 );
  vertex( 475, 660 );
  endShape( CLOSE );
  
  // Drawing the third irregular polygon
  beginShape();
  vertex( 1066, 356 );
  vertex( 1066, 200 );
  vertex( 1215, 83 );
  vertex( 1215, 356 );
  endShape( CLOSE );
  
  // Drawing the fourth irregular polygon
  beginShape();
  vertex( 820, 620 );
  vertex( 870, 620 );
  vertex( 870, 840 );
  vertex( 910, 840 );
  vertex( 910, 860 );
  vertex( 820, 860 );
  endShape( CLOSE );
  
  // Drawing the two triangles
  fill( 11, 222, 12 );
  beginShape( TRIANGLES );
  vertex( 29, 22 );
  vertex( 35, 132 );
  vertex( 144, 29 );
  vertex( 1431,37 );
  vertex( 1570,49 );
  vertex( 1545, 271 );
  endShape( CLOSE );
  
  // Drawing the two rectangles
  fill( 18, 6, 198 );
  beginShape( QUADS );
  vertex( 66, 583 );
  vertex( 215, 583 );
  vertex( 215, 856 );
  vertex( 66, 856 );
  vertex( 1066, 856 );
  vertex( 1066, 700 );
  vertex( 1500, 700 );
  vertex( 1500, 856 );
  endShape( CLOSE );
  
  // Drawing the two arcs
  fill( 157, 112, 27 );
  arc( 860, 290, 100, 100, 0, HALF_PI );
  arc( 750, 150, 100, 100, HALF_PI, HALF_PI + PI );
  
  // Drawing the two points
  stroke( 222, 11, 36 );
  point( 1133, 755 );
  point( 1133, 800 );
  
  // Drawing the two lines
  stroke( 247, 255, 28 );
  line( 67, 62, 170, 700 );
  line( 1294, 784, 1513, 114 );
  
  stroke( 0 );
  // Drawing the first elipse. Controlled by the mouse position
  fill( 237, 167, 36 );
  ellipse( mouseX, mouseY, 200, 100 );
  
  // Drawing the second elipse. Controlled by the mouse position (inverted)
  ellipseMode( RADIUS );
  fill( 247, 255, 28 );
  ellipse( mouseY, mouseX, 100, 100 );
  

}
