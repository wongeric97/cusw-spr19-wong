ArrayList<Polygon> districts;

class Polygon{
  //Shape, coordinates, and color variables
  PShape p;
  ArrayList<PVector>coordinates;
  
  String id; 
  float pop, pubscore, privflatscore, privscore, otherscore, tempscore;
  String name;
  
  color fill;
  color popcolor, pubcolor, privflatcolor, privcolor, othercolor, tempcolor;
  

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
    if(pubscore < 50) pubcolor = lerpColor(best, mid, (2*pubscore)/100);
    if(pubscore == 50) pubcolor = mid;
    if(pubscore > 50) pubcolor = lerpColor(mid, worst, (2*(pubscore-50))/100);
    
    if(privflatscore < 50) privflatcolor = lerpColor(best, mid, (2*privflatscore)/100);
    if(privflatscore == 50) privflatcolor = mid;
    if(privflatscore > 50) privflatcolor = lerpColor(mid, worst, (2*(privflatscore-50))/100);
    
    if(privscore < 50) privcolor = lerpColor(best, mid, (2*privscore)/100);
    if(privscore == 50) privcolor = mid;
    if(privscore > 50) privcolor = lerpColor(mid, worst, (2*(privscore-50))/100);
    
    if(otherscore < 50) othercolor = lerpColor(best, mid, (2*otherscore)/100);
    if(otherscore == 50) othercolor = mid;
    if(otherscore > 50) othercolor = lerpColor(mid, worst, (2*(otherscore-50))/100);
    
    if(tempscore < 50) tempcolor = lerpColor(best, mid, (2*tempscore)/100);
    if(tempscore == 50) tempcolor = mid;
    if(tempscore > 50) tempcolor = lerpColor(mid, worst, (2*(tempscore-50))/100);
    
    if(pop < 50) popcolor = lerpColor(best, mid, (2*pop)/100);
    if(pop == 50) popcolor = mid;
    if(pop > 50) popcolor = lerpColor(mid, worst, (2*(pop-50))/100);
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
    } else if (info == "population"){
      fill = color(popcolor); 
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
        PVector screenLocation = map.getScreenLocation(coordinates.get(i));
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
