void drawLegend(){
   float w = 40;
   float h = 240;
   int x = width-40-int(w);
   int y = height-40-int(h);
   
   
   for (int i=y; i<=y+h; i++){
      float inter = map(i, y, y+h, 0, 1);
      color c = color(0,0,0);
      if(inter < 0.5) c = lerpColor(worst, mid, (2*inter));
      if(inter == 0.5) c = mid;
      if(inter > 0.5) c = lerpColor(mid, best, (2*(inter-0.5)));
      stroke(c);
      line(x, i, x+w, i);
   }
   
   textSize(24);
   fill(0);
   text("Hong Kong Districts", 40, 40);
   textSize(12);
   text("1: Public Housing", 40, 55);
   text("2: Private Flats", 40, 70);
   text("3: Private Housing", 40, 85);
   text("4: Other Housing", 40, 100);
   text("5: Temporary Housing", 40, 115);
   text("6: Population", 40, 130);
   
   if (info == "public"){
     textSize(16);
     fill(0);
     text("Public Housing", x-30, y-5);
     textSize(10);
     text(Float.toString(pub_min), x-30, y+h);
     text(Float.toString(pub_max), x-30, y+15);
   } else if (info == "private flat"){
     textSize(16);
     fill(0);
     text("Private Flats", x-30, y-5);
     textSize(10);
     text(Float.toString(privflat_min), x-30, y+h);
     text(Float.toString(privflat_max), x-30, y+15);
   } else if (info == "private"){
     textSize(16);
     fill(0);
     text("Private Housing", x-30, y-5);
     textSize(10);
     text(Float.toString(priv_min), x-30, y+h);
     text(Float.toString(priv_max), x-30, y+15);
   } else if (info == "other"){
     textSize(16);
     fill(0);
     text("Other Housing", x-30, y-5);
     textSize(10);
     text(Float.toString(other_min), x-30, y+h);
     text(Float.toString(other_max), x-30, y+15);
   } else if (info == "temporary"){
     textSize(16);
     fill(0);
     text("Temporary", x-35, y-5);
     textSize(10);
     text(Float.toString(temp_min), x-30, y+h);
     text(Float.toString(temp_max), x-30, y+15);
   } else if (info == "population"){
     textSize(16);
     fill(0);
     text("Population", x-35, y-5);
     textSize(10);
     text(Float.toString(pop_min), x-30, y+h);
     text(Float.toString(pop_max), x-30, y+15);
   }
}
