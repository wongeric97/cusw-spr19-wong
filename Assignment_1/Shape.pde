class Shape{
  
  int type;
  int x;
  int y;
  int r;
  int g;
  int b;
  int zoom;
  float area;
  
  Shape(int _type, int _x, int _y, int _r, int _g, int _b, int _zoom){
     type = _type;
     x = _x;
     y = _y;
     r = _r;
     g = _g;
     b = _b;
     zoom = _zoom;
     area = 0;
  }
  
  void drawShape(){
    noStroke();
    fill(r, g, b);
    if (type == 0){
      circle(x, y, 25*zoom);
    } else if (type == 1) {
      square(x-12.5*zoom, y-12.5*zoom, 25*zoom);
    } else {
      triangle(x-25*zoom/2, y-25*zoom/sqrt(24), x, y+25*zoom/sqrt(3), x+25*zoom/2, y-25*zoom/sqrt(24));
    }
  }
  
  float getArea(){
    if (type == 0){
      area = sq(25*zoom/2)*PI;
    } else if (type == 1) {
      area = sq(25*zoom);
    } else {
      area = sqrt(3)/4*sq(25*zoom);
    }
    return area;
  }
  
}
