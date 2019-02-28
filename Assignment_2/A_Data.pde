JSONObject example;
JSONArray features;
JSONObject bbp;

//Look at https://processing.org/reference/JSONObject.html for more info

void loadData(){
  //Load and resize background image
  background = loadImage("data/background.png");
  background.resize(width, height);
    
  //Whole Area
  bbp = loadJSONObject("data/brooklynbridgepark.json");
  features = bbp.getJSONArray("features");
  
  println("There are : ", features.size(), " features."); 
}

void parseData(){
  //First do the general object
  JSONObject feature = features.getJSONObject(0);
  
  ArrayList<String> food = new ArrayList<String>();
  food.add("restaurant");
  food.add("food");
  ArrayList<String> walkable = new ArrayList<String>();
  walkable.add("residential");
  walkable.add("footway");
  walkable.add("pier");

  //Sort 3 types into our respective classes to draw
  for(int i = 0; i< features.size(); i++){
    //Idenitfy 3 main things; the properties, geometry, and type 
    String type = features.getJSONObject(i).getJSONObject("geometry").getString("type");
    JSONObject geometry = features.getJSONObject(i).getJSONObject("geometry");
    JSONObject properties =  features.getJSONObject(i).getJSONObject("properties");
    String amenity = properties.getJSONObject("tags").getString("amenity");
    String dataAmenity = properties.getJSONObject("tags").getString("amenity");
    if(dataAmenity != null) amenity = dataAmenity;
    else amenity = "";
  
    //Make POIs if it's a point
    if(type.equals("Point")){
      //create new POI
      float lat = geometry.getJSONArray("coordinates").getFloat(1);
      float lon = geometry.getJSONArray("coordinates").getFloat(0);
      //split into two categories: food, bicycle
      if (within(amenity, food)){
          Food f = new Food(lat, lon);
          f.type = amenity;
          foods.add(f);
      } else if (amenity.toLowerCase().contains("bicycle")){
          Bicycle bike = new Bicycle(lat, lon);
          bike.type = amenity;
          bikes.add(bike);
      }    
    }
    
    //Way if a LineString
    if(type.equals("LineString")){
      //only add if walkable
      String road_type = properties.getJSONObject("tags").getString("highway");
      String data_road_type = properties.getJSONObject("tags").getString("highway");
      if (data_road_type != null) road_type = data_road_type;
      else road_type = "";
      if (within(road_type, walkable)){
        ArrayList<PVector> coords = new ArrayList<PVector>();
        //get the coordinates and iterate through them
        JSONArray coordinates = geometry.getJSONArray("coordinates");
        for(int j = 0; j<coordinates.size(); j++){
          float lat = coordinates.getJSONArray(j).getFloat(1);
          float lon = coordinates.getJSONArray(j).getFloat(0);          
          PVector coordinate = new PVector(lat, lon);
          coords.add(coordinate);
        }  
        //Create the Way with the coordinate PVectors
        Way way = new Way(coords);
        ways.add(way);
      }
    }
    
  }
}

boolean within(String instance, ArrayList<String> category) {
   for (String cat: category) {
      if (instance.toLowerCase().contains(cat)){
         return true; 
      }
   }
   return false;
}
