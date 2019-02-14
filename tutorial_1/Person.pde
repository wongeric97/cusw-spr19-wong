//This Person class with represent people in our class

class Person {
 
  String name;
  String year;
  PVector screenLocation;
  
  Person(String _name, String _year){
   name = _name;
   year = _year;
   //screenLocation = new PVector(width/2, height/2);
   randomLocation();
  }
  
  void randomLocation(){
   screenLocation = new PVector(random(width), random(height)); 
  }
  
  void draw(){
   noStroke(); //no outline around drawing
   fill(255); //white fill
   ellipse(screenLocation.x, screenLocation.y, 25, 25);
   
   text(name + "\nYear: " + year, screenLocation.x + 30, screenLocation.y + 30);
  }
  
}
