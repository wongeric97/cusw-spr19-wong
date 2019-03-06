MercatorMap map;
PImage background;
String info;
color worst, mid, best;

void setup(){
  
  size(1600,1000);
 
  map = new MercatorMap(width, height, 22.5622, 22.1531, 113.8347, 114.4408,0); 
  districts = new ArrayList<Polygon>();
  info = "public";
  worst = color(200, 0, 0, 100);
  mid = color(255, 255, 0, 100);
  best = color(0, 200, 0, 100);
  
  loadData();
  parseData();
  normalizeData();
}

void draw(){
  
  image(background, 0, 0);
  for (Polygon d: districts){
     d.draw(); 
  }
  
  drawLegend();
  
}

void keyPressed(){
    if (key == '1'){
        print("public housing\n");
        info = "public";
    } else if (key == '2'){
        print("private flat\n");
        info = "private flat";
    } else if (key == '3'){
        print("general private housing\n");
        info = "private";
    } else if (key == '4'){
        print("other\n");
        info = "other";
    } else if (key == '5'){
        print("temporary\n");
       info = "temporary"; 
    } else if (key == '6'){
       print("population\n");
       info = "population";
    }
}
