class Tex2 {

  color c2;
  String Sei2;
  int scalar2;
  int opacity2 = 0;
  float x2, y2, rot2;  
  float xnoise2 = random(0, width);
  float ynoise2 = random(0, height);
  float xinc2 = random(0.00005, 0.0005);
  float yinc2 = random(0.00005, 0.0005);
  //float angle2 = QUARTER_PI;
  float angle2 = random(-3.4,3.4);
  float speed2 = random(0.00004, 0.00005);
  

  Tex2(String Seit2, color c2, float rot2) {
    Sei2=Seit2;
    c2 = c2;
    //textAlign(CENTER,TOP);    
    //rectMode(CENTER);
    //scalar = int(random(70, 100));
    x2 = xpos2();
    y2 = ypos2();
    rot2 = rotpos2();
    }

  void display2() {
    //angle += speed;
    //float sinval = sin(angle) * 5;

    if (opacity2 < 240) {
      opacity2 += 5; 
    }
    tint(c2, opacity2);
    textAlign(CENTER,BOTTOM);
    pushMatrix();
     //rotate(rot2);
    translate(width/2, height/2);
    rotate(rot2);
        //translate(width, height/2);
    angle2-=.00005;
    fill(255,opacity2);
    text(Sei2,x2-width/2,y2-height/2,200,50);
    noFill();
    //stroke(200);
    //rect(x2,y2,1550,50);
    
    popMatrix();
  }

  void move2() {
    x2 = xpos2();
    y2 = ypos2();
    rot2 = rotpos2();
  }

  float xpos2() {
    float nx2 = lerp(-200, width+200, noise(xnoise2));
    xnoise2 += xinc2;
    return nx2;
  }

  float ypos2() {
    float ny2 = lerp(-200, height+200, noise(ynoise2));
    ynoise2 += yinc2;
    return ny2;
  }
  
  float rotpos2() {
    float ang2 = angle2;
    angle2 -= 0.001;
    return ang2;
  }
}

