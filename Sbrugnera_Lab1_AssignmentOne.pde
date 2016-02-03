void setup() {

  // Defines the background color to black
  background( 255 );
  
  // Create a frame 1024 pixels wide, 768 pixels high
  size( 1024, 768 );
  
  // Setting the stroke width and color to all shapes
  stroke( 0 );
  strokeWeight( 8 );
  
  // Drawing the first rectangle
  fill( 18, 6, 198 );
  rect( 412, 384, 100, 200 );
  
  // Drawing the second rectangle
  rectMode( CORNERS );
  fill( 18, 6, 198 );
  rect( 562, 384, 662, 584 );
  
  // Drawing the first elipse
  fill( 237, 167, 36 );
  ellipse( 412, 384, 200, 100 );
  
  // Drawing the second elipse
  ellipseMode( RADIUS );
  fill( 110 );
  ellipse( 662, 384, 100, 100 );
  
  // Drawing the two points
  stroke( 222, 11, 36 );
  point( 500, 300 );
  point( 524, 300 );
  
  // Drawing the two lines
  stroke( 11, 222, 12 );
  line( 150, 150, 170, 700 );
  line( 120, 630, 1000, 650 );
  
}
