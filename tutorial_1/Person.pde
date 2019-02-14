//This Person class with represent people in our class

class Person {
 
  String name;
  String year;
  PVector screenLocation;
  boolean clicked; //is this person clicked on
  
  Person(String _name, String _year){
   name = _name;
   year = _year;
   //screenLocation = new PVector(width/2, height/2);
   randomLocation();
  }
  
  void randomLocation(){
   screenLocation = new PVector(random(width), random(height)); 
  }
  
  boolean hoverEvent(){
    float xDist = abs(mouseX - screenLocation.x);
    float yDist = abs(mouseY - screenLocation.y);
    
    if (xDist <= 15 && yDist <= 15) {
      return true;
    } else {
      return false;
    }  
  }
  
  boolean checkSelection(){
   if (hoverEvent()) {
     clicked = true;
   } else {
     clicked = false;
   }
   return hoverEvent();
  }
  
  void update(){
   if (clicked) {
     screenLocation = new PVector(mouseX, mouseY);
   }
  }
  
  void drawPerson(){
   noStroke(); //no outline around drawing
   
   if (hoverEvent()) {
     fill(#FFFF00); //green
   } else {
     fill(255); //white fill
   }
   
   ellipse(screenLocation.x, screenLocation.y, 25, 25);
   
   text(name + "\nYear: " + year, screenLocation.x + 30, screenLocation.y + 30);
  }
  
}
