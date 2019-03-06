MercatorMap map;
String info;
color worst, mid, best;

void setup(){
  
  size(1000,800);
 
  map = new MercatorMap(width, height, 22.5622, 22.1531, 113.8347, 114.4408,0);
  districts = new ArrayList<Polygon>();
  info = "public";
  worst = color(200, 0, 0);
  mid = color(255, 255, 0);
  best = color(0, 200, 0);
  
  loadData();
  parseData();
  normalizeData();
}

void draw(){
  
  background(255);
  for (Polygon d: districts){
     d.draw(); 
  }
  
  drawLegend();
  
}

void keyPressed(){
    if (key == '1'){
        print("public housing");
        info = "public";
    } else if (key == '2'){
        print("private flat");
        info = "private flat";
    } else if (key == '3'){
        print("general private housing");
        info = "private";
    } else if (key == '4'){
        print("other");
        info = "other";
    } else if (key == '5'){
        print("temporary");
       info = "temporary"; 
    }
}
