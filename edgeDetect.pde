/*MM - EdgeDetection Sketch
For sliced .STLS from SLADLP printers.
March 19th 2015
Images load from "slices" in consecutive order going upwards.

/*---------------*/

/*float[][] kernel = {{ -1, -1, -1}, 
                    { -1,  9, -1}, 
                    { -1, -1, -1}};*/
                    
PImage img;

void setup() { 
  size(1280, 800); // 1024000 pixels
  img = loadImage("Slices/slice_1.png");
  image(img, 0, 0);
  noSmooth();
}

void draw(){
  for (int i=1; i<150; i++){
 // int i=1;  
  
  img = loadImage("Slices/slice_"+i+".png"); // Load the original image
  image(img, 0, 0);
  checkEdge();
  save("output/slice_"+i+".png");
  noLoop();
  }
exit();
}

void checkEdge() {
   // Displays the image from point (0,0) 
  img.loadPixels();
  loadPixels();
  color pink = color(255, 102, 204);
  color black =color(0,0,0);
  color white =color(255,255,255);
for (int i = width; i < (width*height)-width; i++) {
float chance= random(100);
  float pixel1 = img.pixels[i+1];
  if (img.pixels[i]== black && pixel1 != black){
      if (chance<60){
  pixels[i] = white;
     }
    }
    
    if (img.pixels[i]== black && img.pixels[i-1] != black){
      if (chance<60){
  pixels[i] = white;
     }
    }

if (img.pixels[i]== black && img.pixels[i-width] != black){
     if (chance<60){
  pixels[i] = white;
     }
    }
    
   if (img.pixels[i]== black && img.pixels[i+width] != black){
      if (chance<60){
  pixels[i] = white;
     }
    }

}
updatePixels();
}


