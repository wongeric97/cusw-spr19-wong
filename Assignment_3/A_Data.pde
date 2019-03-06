Table districtBlocks, districtData;
float pub_min, privflat_min, priv_min, other_min, temp_min;
float pub_max, privflat_max, priv_max, other_max, temp_max;

void loadData(){
    districtBlocks = loadTable("data/temp-nodes.csv", "header");
    districtData = loadTable("data/hongkong.csv", "header");
    println("Data Loaded");
}

void parseData(){
    //parse distrcit polygons
    ArrayList<PVector> coords = new ArrayList<PVector>();
    String previd = "0";
    coords = new ArrayList<PVector>();
    for(int i = 0; i<districtBlocks.getRowCount(); i++){
    //for(int i = 0; i<5; i++){
       String shapeid = districtBlocks.getString(i, 0);
       //debugging what shapeid is throwing it off
       //print(previd+"\n");
       //print(shapeid+"\n");
       //print(previd == shapeid);
       //print(float(previd) == float(shapeid));
       if(shapeid.equals(previd) == false){
           if(coords.size() > 0){
               //println(coords.get(0));
               Polygon poly = new Polygon(coords);
               poly.id = shapeid;
               //println(poly.coordinates.get(0));
               districts.add(poly);
           }
           //clear coords
           coords = new ArrayList<PVector>();
           //reset variable
           previd = shapeid;
           //println("new shape");
       }
       if(float(shapeid) == float(previd)){
         float lat = float(districtBlocks.getString(i, 2));
         float lon = float(districtBlocks.getString(i, 1));
         //println(lat, lon);
         coords.add(new PVector(lat, lon));
       }
    }
  
    //Add attribute you want to your polygon 
    for(int i = 0; i<districts.size(); i++){
      districts.get(i).pop = districtData.getFloat(i, "population");
      districts.get(i).pubscore = districtData.getFloat(i, "public");
      districts.get(i).privflatscore = districtData.getFloat(i, "private flat");
      districts.get(i).privscore = districtData.getFloat(i, "private");
      districts.get(i).otherscore = districtData.getFloat(i, "other");
      districts.get(i).tempscore = districtData.getFloat(i, "temporary");
      districts.get(i).name = districtData.getString(i, "district");
      //districts.get(i).colorByScore();
      districts.get(i).makeShape();
    }
   println(districts.size());
    println("Data Parsed");
}

void normalizeData(){
    pub_min = 1000000;
    privflat_min = 1000000;
    priv_min = 1000000;
    other_min = 1000000;
    temp_min = 1000000;
    pub_max = 0;
    privflat_max = 0;
    priv_max = 0;
    other_max = 0;
    temp_max = 0;
    
    for (int i=0; i<districts.size(); i++){
       float pubval = districts.get(i).pubscore;
       float privflatval = districts.get(i).privflatscore;
       float privval = districts.get(i).privscore;
       float otherval = districts.get(i).otherscore;
       float tempval = districts.get(i).tempscore;
       
       if (pubval < pub_min) pub_min = pubval;
       if (pubval > pub_max) pub_max = pubval;
       if (privflatval < privflat_min) privflat_min = privflatval;
       if (privflatval > privflat_max) privflat_max = privflatval;
       if (privval < priv_min) priv_min = privval;
       if (privval > priv_max) priv_max = privval;
       if (otherval < other_min) other_min = otherval;
       if (otherval > other_max) other_max = otherval;
       if (tempval < temp_min) temp_min = tempval;
       if (tempval > temp_max) temp_max = tempval;
    }
    
    for (int i=0; i<districts.size(); i++){
       float pubval = districts.get(i).pubscore;
       float privflatval = districts.get(i).privflatscore;
       float privval = districts.get(i).privscore;
       float otherval = districts.get(i).otherscore;
       float tempval = districts.get(i).tempscore;
       
       float newpub = map(pubval, pub_min, pub_max, 0, 100);
       float newprivflat = map(privflatval, privflat_min, privflat_max, 0, 100);
       float newpriv = map(privval, priv_min, priv_max, 0, 100);
       float newother = map(otherval, other_min, other_max, 0, 100);
       float newtemp = map(tempval, temp_min, temp_max, 0, 100);
       
       districts.get(i).pubscore = newpub;
       districts.get(i).privflatscore = newprivflat;
       districts.get(i).privscore = newpriv;
       districts.get(i).otherscore = newother;
       districts.get(i).tempscore = newtemp;
    }
    
}
