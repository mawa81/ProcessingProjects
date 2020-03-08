class Tex {

  color c;
  String Sei;
  int scalar;
  int opacity = 0;
  float x, y;
  float xnoise = random(0, width);
  float ynoise = random(0, height);
  float xinc = random(0.0009, 0.00005);
  float yinc = random(0.0009, 0.00005);
  float angle1 = random(0,TWO_PI);
  float speed = random(0.00004, 0.00005);
  

  Tex(String Seit, color cl) {
    Sei=Seit;
    c = cl;
    //textAlign(CENTER);    
    //rectMode(CENTER);
    //scalar = int(random(70, 100));
    x = xpos();
    y = ypos();
  }

  void display() {
    //angle += speed;
    //float sinval = sin(angle) * 5;

    if (opacity < 240) {
      opacity += 5; 
    }
    textAlign(CENTER,BOTTOM);
    tint(c, opacity);    
    pushMatrix();
    translate(width/2, height/2);
    rotate(angle1);
    angle1+=.00001;
    fill(255,opacity);
    
    text(Sei,x-width/2,y-height/2,280,200);
    popMatrix();
    }

  void move() {
    x = xpos();
    y = ypos();
    
  }

  float xpos() {
    float nx = lerp(-200, width+200, noise(xnoise));
    xnoise += xinc;
    return nx;
  }

  float ypos() {
    float ny = lerp(-200, height+200, noise(ynoise));
    ynoise += yinc;
    return ny;
  }
}




