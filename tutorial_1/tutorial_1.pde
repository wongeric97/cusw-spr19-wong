//Step 1: Allocate memory for instances of Person class
ArrayList<Person> people;

//Runs once
void setup(){
  size(800,700);
  
  background(0); //Black
  //background(255); //White
  
  people = new ArrayList<Person>();
  
  for (int i=0; i<10; i++){
    Person p = new Person("Person " + i, str(int(random(1,5))));
    people.add(p);
  }
}

//Runs approxiamtely 60 FPS
void draw(){
    
  //clear();
  background(0);
  //fill(255);
  //ellipse(mouseX,mouseY,50,50);
  
  //draw person object
  for (Person p: people){
    p.update(); //update location if selected
    p.drawPerson(); 
  }
  
}

void mousePressed() {
    
  for (Person p: people){
    if (p.checkSelection()) { //only selects when mouse clicked
      break; 
    }
  }
    
}

void mouseReleased(){
 
  for (Person p: people){
    p.clicked = false;
  }
  
}
