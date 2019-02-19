ArrayList<Shape> shapes;
int s = int(random(3));
int r = int(random(10,255));
int g = int(random(10,255));
int b = int(random(10,255));
int zoom = 100;

void setup(){
  size(640, 360); 
  shapes = new ArrayList<Shape>();
}

void draw(){
  background(255); 
  
  Shape temp = new Shape(s, mouseX, mouseY, r, g, b, zoom/25);
  temp.drawShape();
  
  int total_area = 0;
  
  for (Shape shape: shapes){
     shape.drawShape(); 
     total_area += shape.getArea();
  }
  
  //keep track of number of shapes drawn and total area
  
  textSize(10);
  fill(0);
  text("Number of Shapes Draw: " + shapes.size() + "\nTotal Area: " + total_area, 500, 330);
}



void mouseClicked(){
  //When mouse is clicked, current shape will be drawn on the canvas
  shapes.add(new Shape(s, mouseX, mouseY, r, g, b, zoom/25));  
}

void mouseWheel(MouseEvent event){
  //Wheel scroll will change size of shape
  zoom += event.getCount();
}

void keyPressed(){
  //When a key is pressed, the shape and fill will change randomly
  s = int(random(3));
  r = int(random(10,255));
  g = int(random(10,255));
  b = int(random(10,255));
}
