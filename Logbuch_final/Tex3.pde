class Tex3 {

  color c3;
  String Sei3;
  int scalar3;
  int opacity3 = 0;
  float x3, y3;
  float xnoise3 = random(0, width);
  float ynoise3 = random(0, height);
  float xinc3 = random(0.0005, 0.00005);
  float yinc3 = random(0.0005, 0.00005);
  float angle3 = random(0,TWO_PI);
  float speed3 = random(0.00004, 0.00005);
  

  Tex3(String Seit3, color c3) {
    Sei3=Seit3;
    c3 = c3;
    //textAlign(CENTER);    
    //rectMode(CENTER);
    //scalar = int(random(70, 100));
    x3 = xpos3();
    y3 = ypos3();
  }

  void display3() {
    //angle += speed;
    //float sinval = sin(angle) * 5;

    if (opacity3 < 240) {
      opacity3 += 5; 
    }
    textAlign(CENTER,BOTTOM);
    tint(c3, opacity3);
    pushMatrix();
    translate(width/2, height/2);
    rotate(angle3);
    angle3+=.00001;
    fill(255,opacity3);
    text(Sei3,x3-width/2,y3-height/2,150,50);
    popMatrix();
  }

  void move3() {
    x3 = xpos3();
    y3 = ypos3();
  }

  float xpos3() {
    float nx3 = lerp(-200, width+200, noise(xnoise3));
    xnoise3 += xinc3;
    return nx3;
  }

  float ypos3() {
    float ny3 = lerp(-200, height+200, noise(ynoise3));
    ynoise3 += yinc3;
    return ny3;
  }
}


