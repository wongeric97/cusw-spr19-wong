//fill color
color road_color = color(100,149,237);
color rent_fill = color(0, 255, 0);
color park_fill = color(255, 255, 0);
color food_fill = color(255, 0, 0);
  
void drawInfo(){
  int count = 0;
  if (draw_food) count += 1;
  if (draw_road) count += 1;
  if (draw_bikes) count += 2;
  
  if (count != 0){
    fill(0);
    rect(20, 20, 125, 20*(count+1)-10);
    textSize(16);
    if (draw_bikes){
       fill(rent_fill);
       text("Rent Bike", 25, 20*(count));
       fill(park_fill);
       text("Park Bike", 25, 20*(count+1));
       count -= 2;
    }
    if (draw_food){
       fill(food_fill);       
       text("Food", 25, 20*(count+1));
       count -= 1;
    }
    if (draw_road){
       fill(road_color);       
       text("Walkable Road", 25, 20*(count+1));
       count -= 1;
    }
  }
}
