void drawLegend(){
   int x = width-100;
   int y = height-340;
   float w = 60;
   float h = 300;
   
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
   text("Hong Kong Districts", width/3, 20);
   
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
     text("Temporary Housing", x-35, y-5);
     textSize(10);
     text(Float.toString(temp_min), x-30, y+h);
     text(Float.toString(temp_max), x-30, y+15);
   }
}
