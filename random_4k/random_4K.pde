
/*Bisher sind zwei verschiedene Auflösungen für das 4K2K-Format mit einem 16:9-Seitenverhältnis gebräuchlich:
4096 × 2304 Pixel – auch unter der Bezeichnung 4K (vereinzelt „Cinema 4k“) bekannt
3840 × 2160 Pixel – auch unter den Bezeichnungen 2160p/i, QFHD (Quad Full High Definition) und UHD (Ultra High Definition) bekannt. Hier werden die Seitenlängen der 1080p-Auflösung (1920 Pixel in der Breite und 1080 in der Höhe) jeweils verdoppelt, wodurch sich die Pixelzahl vervierfacht.

*/

int num=1; //Abstand zwischen den Pixeln

void setup() {
  size(4096, 2304);
  //size(displayWidth, displayHeight);
  frameRate(25);
  noStroke();
  background(0);
  //noLoop();  // Draw only one time
}

void draw() {
 background(0);
 
 //thread("drawPixels");    //Multithreading
 //num= (int)(mouseX/400);
  drawPixels();
  
  //saveFrame("screen-######.tif");
}

void drawPixels() {
 for(int i = 0; i < width; i+=num) {
    
    for(int j = 0; j < height; j+=num) {
      //color c = color(random(255),random(255),random(255));
      color c = color(random(255));
      set(i, j, c);
      
    }
    
  }
}
