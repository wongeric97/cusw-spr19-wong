MercatorMap map;
//Raster raster;

void setup(){
  
  size(600,800);
  
  map = new MercatorMap(width, height, 114.1046, 114.2942, 22.2546, 22.3539, 0);
  districts = new ArrayList<Polygon>();
  
  loadData();
  parseData();
}

void draw(){
  
  background(0);
  for (Polygon d: districts){
     d.draw(); 
  }
  
}
