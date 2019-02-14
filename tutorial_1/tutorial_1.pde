ArrayList<Person> people;
ArrayList<Connection> relationships;

//Runs once
void setup(){
  size(800,700);
  initialize();
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
  
  //draw connections
  for (Connection c: relationships) {
     c.drawConnection(); 
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

void keyPressed(){
   initialize(); 
}

void initialize(){
    
  background(0); //Black
  //background(255); //White
  
  people = new ArrayList<Person>();
  relationships = new ArrayList<Connection>();
  
  for (int i=0; i<10; i++){
    Person p = new Person("Person " + i, str(int(random(1,5))));
    people.add(p);
  }
  
  //determine relationships
  for (Person origin: people){
     for (Person destination: people){
         if (!origin.name.equals(destination.name)) {
            if (origin.year.equals(destination.year)) {
               relationships.add(new Connection(origin, destination, "friends"));
            }
         }
     }
  }
  
  println(relationships.size());
  
}
