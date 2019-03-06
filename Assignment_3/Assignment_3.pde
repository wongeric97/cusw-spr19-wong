MercatorMap map;
String info;

void setup(){
  
  size(600,800);
  
  //not sure if this is the right mercatormap. got the shapefile from https://geodata.mit.edu/catalog/stanford-tc394sc6984 and i took the lat and long bounding box
  //from what the metadata said
  map = new MercatorMap(width, height, 113.8347, 114.4408, 22.5622, 22.1531, 0);
  districts = new ArrayList<Polygon>();
  info = "public";
  
  loadData();
  parseData();
  normalizeData();
}

void draw(){
  
  background(255);
  for (Polygon d: districts){
     d.draw(); 
  }
  
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
