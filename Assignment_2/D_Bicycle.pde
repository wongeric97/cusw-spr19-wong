ArrayList<Bicycle> bikes;

class Bicycle {
  //What is the coordinate of the POI in lat, lon
  PVector coord;

  //Lat, lon values
  float lat;
  float lon;

  //String to hold the type -- defaults to empty if there is none
  String type;

  Bicycle(float _lat, float _lon) {
    lat = _lat;
    lon = _lon;
    coord = new PVector(lat, lon);
  }

  void draw() {
    PVector screenLocation = map.getScreenLocation(coord);
    fill(rent_fill);
    noStroke();
    if (type.toLowerCase().contains("parking")) fill(park_fill);
    ellipse(screenLocation.x, screenLocation.y, 6, 6);
  }
}
