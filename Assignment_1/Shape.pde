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
      circle(x, y, zoom);
    } else if (type == 1) {
      square(x-0.5*zoom, y-0.5*zoom, zoom);
    } else {
      triangle(x-zoom/2, y-zoom/sqrt(24), x, y+zoom/sqrt(3), x+zoom/2, y-zoom/sqrt(24));
    }
  }
  
  float getArea(){
    if (type == 0){
      area = sq(zoom/2)*PI;
    } else if (type == 1) {
      area = sq(zoom);
    } else {
      area = sqrt(3)/4*sq(zoom);
    }
    return area;
  }
  
}
