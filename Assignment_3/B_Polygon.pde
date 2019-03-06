ArrayList<Polygon> districts;

class Polygon{
  //Shape, coordinates, and color variables
  PShape p;
  ArrayList<PVector>coordinates;
  
  String id; 
  float pop, pubscore, privflatscore, privscore, otherscore, tempscore;
  String name;
  
  color fill;
  color pubcolor, privflatcolor, privcolor, othercolor, tempcolor;
  

  //Empty constructor
  Polygon(){
    coordinates = new ArrayList<PVector>();
  }
  
  //Constructor with coordinates
  Polygon(ArrayList<PVector> coords){
    coordinates = coords;
    fill = 255;
  }
  
  Polygon(ArrayList<PVector> coords, color _c){
    coordinates = coords;
    fill = _c;
  }
  
  void updateColor(){
    if(pubscore < 50) pubcolor = lerpColor(worst, mid, (2*pubscore)/100);
    if(pubscore == 50) pubcolor = mid;
    if(pubscore > 50) pubcolor = lerpColor(mid, best, (2*(pubscore-50))/100);
    
    if(privflatscore < 50) privflatcolor = lerpColor(worst, mid, (2*privflatscore)/100);
    if(privflatscore == 50) privflatcolor = mid;
    if(privflatscore > 50) privflatcolor = lerpColor(mid, best, (2*(privflatscore-50))/100);
    
    if(privscore < 50) privcolor = lerpColor(worst, mid, (2*privscore)/100);
    if(privscore == 50) privcolor = mid;
    if(privscore > 50) privcolor = lerpColor(mid, best, (2*(privscore-50))/100);
    
    if(otherscore < 50) othercolor = lerpColor(worst, mid, (2*otherscore)/100);
    if(otherscore == 50) othercolor = mid;
    if(otherscore > 50) othercolor = lerpColor(mid, best, (2*(otherscore-50))/100);
    
    if(tempscore < 50) tempcolor = lerpColor(worst, mid, (2*tempscore)/100);
    if(tempscore == 50) tempcolor = mid;
    if(tempscore > 50) tempcolor = lerpColor(mid, best, (2*(tempscore-50))/100);
  }
  
  void colorByScore(){
    updateColor();
    if (info == "public"){
      fill = color(pubcolor);
    } else if (info == "private flat"){
      fill = color(privflatcolor);
    } else if (info == "private"){
      fill = color(privcolor);
    } else if (info == "other"){
      fill = color(othercolor);
    } else if (info == "temporary"){
      fill = color(tempcolor);
    }
  }
  
  
  //Making the shape to draw
  void makeShape(){
    p = createShape();
    p.beginShape();
    p.fill(0);
    p.stroke(0);
    p.strokeWeight(.5);
    for(int i = 0; i<coordinates.size(); i++){
      //println(coordinates.get(i));
        PVector screenLocation = map.getScreenLocation(coordinates.get(i));
        println(screenLocation.x);
        p.vertex(screenLocation.x, screenLocation.y);
    }
    p.endShape();
  }
  
  void updateShape(){
    colorByScore();
    p.beginShape();
    p.fill(fill);
    p.endShape();
  }

  //Drawing shape
  void draw(){
    updateShape();
    shape(p, 0, 0);
  }

}
