ArrayList<Food> foods;

class Food {
  //What is the coordinate of the POI in lat, lon
  PVector coord;

  //Lat, lon values
  float lat;
  float lon;

  //String to hold the type -- defaults to empty if there is none
  String type;

  Food(float _lat, float _lon) {
    lat = _lat;
    lon = _lon;
    coord = new PVector(lat, lon);
  }

  void draw() {
    PVector screenLocation = map.getScreenLocation(coord);
    fill(food_fill);
    noStroke();
    ellipse(screenLocation.x, screenLocation.y, 6, 6);
  }
}
