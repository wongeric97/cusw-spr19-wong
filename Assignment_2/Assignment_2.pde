MercatorMap map;
PImage background;

boolean draw_food = false;
boolean draw_road = false;
boolean draw_bikes = false;

void setup(){
    size(1500,975);
  
    map = new MercatorMap(width, height, 40.7060, 40.6904, -74.0031, -73.9666, 0);
    bikes = new ArrayList<Bicycle>();
    foods = new ArrayList<Food>();
    ways = new ArrayList<Way>();
    
    loadData();
    parseData();
}

void draw(){

    image(background, 0, 0);
    fill(0, 120);
    rect(0, 0, width, height);
    
    if (draw_food){
       for (Food f: foods){
          f.draw(); 
       }
    }
    if (draw_road){
       for (Way w: ways){
          w.draw(); 
       }
    }
    if (draw_bikes){
       for (Bicycle b: bikes){
          b.draw(); 
       }
    }
    
    drawInfo();
}

void keyPressed(){
    if (key == 'f'){
        print("food toggled");
        draw_food = !draw_food;
    } else if (key == 'r'){
        draw_road = !draw_road;
    } else if (key == 'b'){
        draw_bikes = !draw_bikes;
    }
}
