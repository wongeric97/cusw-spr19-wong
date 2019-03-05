Table districtBlocks, districtData;

void loadData(){
  districtBlocks = loadTable("data/temp-nodes.csv", "header");
  districtData = loadTable("data/CensusAttrs.csv", "header");
  println("Data Loaded");
}

void parseData(){
    //parse distrcit polygons
    ArrayList<PVector> coords = new ArrayList<PVector>();

    //Now we can parse the population polygons
    String previd = "0";
    coords = new ArrayList<PVector>();
    for(int i = 0; i<districtBlocks.getRowCount(); i++){
      String shapeid = districtBlocks.getString(i, 0);
         if(shapeid != previd){
             if(coords.size() > 0){
                 Polygon poly = new Polygon(coords);
                 poly.id = shapeid;
                 districts.add(poly);
             }
             //clear coords
             coords = new ArrayList<PVector>();
             //reset variable
             previd = shapeid;
         }
         if(shapeid == previd){
           float lat = float(districtBlocks.getString(i, 2));
           float lon = float(districtBlocks.getString(i, 1));
           //println(lat, lon);
           coords.add(new PVector(lat, lon));
         }
    }
  
    ////Add attribute you want to your polygon 
    //for(int i = 0; i<districts.size(); i++){
    //  districts.get(i).score = CensusData.getFloat(i, "B19113"); //this is ONLY if the IDs are accurate
    //  districts.get(i).colorByScore();
    //  districts.get(i).makeShape();
    //}
  

  //Test case for point in Polygon
  //println(county.pointInPolygon(new PVector(27.25, -80.85)));
  
  println("Data Parsed");
}
