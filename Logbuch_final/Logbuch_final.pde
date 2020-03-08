import java.awt.geom.Point2D;
//import seltar.motion.*;
import javax.media.opengl.*;
import processing.opengl.*;
import net.nexttext.*;
import net.nexttext.behaviour.*;
import net.nexttext.behaviour.control.*;
import net.nexttext.behaviour.dform.*;
import net.nexttext.behaviour.physics.*;
import net.nexttext.behaviour.standard.*;
import net.nexttext.property.*;
import fullscreen.*; 

FullScreen fs; 

PGraphicsOpenGL pgl;
GL gl;


Book eingabe, eingabe02;
int var = 0;
String Sei = " ";
String satz= "";
String[] Guestb = {
  " "
};
String[] Wort = {
  " "
};
String[] satz2= {
  "","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","ü","ö","ä","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","Ü","Ö","Ä","ß"," ","."
};
//static final Color IDLE_COLOR = new Color(100);
//static final float COLOR_SPEED = 10.0f;
AbstractAction follow;
Behaviour followBehaviour;
AbstractBehaviour topBehaviour;
Multiplexer offText;
Repeat repeat;
Action offTextColor;
Action swim;
Action moveTo;
String leer = " ";
String alles="";
String zeichen = "";
char taste = ' ';
String taste2 = "";
String taste3 = "";
String[] Seite = {
  " "
};
//String Seite[] = {"Zeile1","Zeile2","Zeile3","Zeile4"};
PFont font;
BufferedReader infile;
int k = 0;
//int abst = 15;
int z = 0;
int z2 = 0;
int t = 0;
int anzeige = 20;    //Anzahl der angezeigten Sätze
//float c = 255;
float ca = 255/anzeige;
int xa = 150;
int xb = 550;
int ya = 30;
int yb = 500;
float randX = random(xa,xb); 
float randY = random(ya,yb);
Kill kill;
int scalar;
int opacity = 0;
float x, y;
float xnoise = random(0, width);
float ynoise = random(0, height);
float xinc = random(0.001, 0.005);
float yinc = random(0.001, 0.005);
//float angle = 0.0;
float speed = random(0.004, 0.005);
int n = 0;
int lastMillis = 0;
int lastHour = 0;
int count = 0;
int count2 = 0;
int count3 = 0;
int vorgabeanzahl = 0;
int werbunganzahl = 0;
int[] colors = {
  0, 90, 180, 270
};
color[] texColor = new color[10000];
Tex[] tex = new Tex[10000];              // Eingabe
Tex2[] tex2 = new Tex2[500];              // Vorgabefile
Tex3[] tex3 = new Tex3[200];              // Werbungsfile
String werbung[];
String path = sketchPath;

File dataFolder = new File("E:/My Dropbox/log");
//File dataFolder = new File("log");
String[] names = dataFolder.list();
String vorgabe[];
color werbungcolor = color(204, 153, 0);
int maxcomment = 20;                      //Anzahl der maximalen Kommentare

void setup() {
  //size(screen.width-10, screen.height-10, OPENGL);
  size(1100, 800,OPENGL);
  smooth();
  noCursor();
  pgl = (PGraphicsOpenGL)g;
  gl = pgl.beginGL();
  frameRate(80);

  eingabe = new Book(this);
  eingabe02 = new Book(this);
  //font = createFont("TimesNewRomanPSMT-48.vlw", 48);
  //font = createFont("ErasITC-Demi-48.vlw",48);
  //font = loadFont("ErasITC-Demi-48.vlw");
  //font = loadFont("SansSerif.bolditalic-48.vlw");
  //font = loadFont("SansSerif.italic-48.vlw");
  font = loadFont("SansSerif.plain-48.vlw");
  fill(255);
  noStroke();
  rectMode(CENTER);

  eingabe.addPage(Seite[0]);

  background(20);
  //tex[n] = new Tex(Seite,50,50);
  //for (int n = 0; n < 15; n++) {
  //tex[n] = new Tex(Sei,texColor[n]);
  //}  

  String vorgabe[] =loadStrings("E:/My Dropbox/data/vorgabe.txt");
  String werbung[] =loadStrings("E:/My Dropbox/data/werbung.txt");
  println(vorgabe.length);

  for(int p=0; p<vorgabe.length;p++) {
    //println(vorgabe[p]);
    tex2[p] = new Tex2(vorgabe[p],texColor[p],random(-3.4,3.4));
    addTex2();
    //n++;
  }
  for(int t=0; t<werbung.length;t++) {
    //println(vorgabe[p]);
    tex3[t] = new Tex3(werbung[t],werbungcolor);
    addTex3();
    //n++;
  }
  n=0;
  k = 0;
  vorgabeanzahl=vorgabe.length;
  werbunganzahl=werbung.length;
  fs = new FullScreen(this); 
  fs.enter(); 
  //textFont(font,15);  
  //textMode(MODEL);
  textAlign(CENTER,BOTTOM);
}

void draw() {
  //background(0);
  //textAlign(CENTER,CENTER);
  noStroke();
  fill(0, 100);
  rect(0, 0, width, height);    
  eingabe.clear();
  //rect(0,0,width,height);
  String zeichen = satz2[var];
  pushMatrix();
  rotate(-QUARTER_PI);
  fill(255);
  textFont(font,20);
  textAlign(RIGHT,CENTER);
  eingabe.addText(satz, width/3, height*5/6,Seite[z]);
  eingabe.stepAndDraw();
  popMatrix();

  pgl.beginGL();  
  gl.glEnable(GL.GL_DEPTH_TEST);
  gl.glEnable(GL.GL_BLEND);
  gl.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_ONE);
  pgl.endGL();

  if(hour() > lastHour) {
    lastHour =hour();  
    String werbung[] =loadStrings("E:/My Dropbox/data/werbung.txt");
    for(int t=0; t<werbung.length;t++) {
      //println(vorgabe[p]);
      tex3[t] = new Tex3(werbung[t],werbungcolor);
      addTex3();
      //n++;
    }
  }

  if (millis() > lastMillis ) {
    lastMillis = millis();

    if(k>=maxcomment) {

      k=0;
    }

    if (count <  z) {
      addTex();
    }
  }
  if(z>=0) {
    if(z<maxcomment) {
      for (int n = 0; n < count; n++) {
        //pushMatrix();
        tex[n].display();
        tex[n].move();
        //popMatrix();
      }
    } 
    else {
      for (int n = 0; n < maxcomment; n++) {

        tex[n].display();

        tex[n].move();
      }
    }
    //println(vorgabe.length);
    for (int q = 0; q < vorgabeanzahl; q++) {

      tex2[q].display2();
      tex2[q].move2();
    }
    for (int r = 0; r < werbunganzahl; r++) {

      tex3[r].display3();
      tex3[r].move3();
    }
  }
}

void keyPressed() {
  if (keyCode == ENTER) {

    z+=1;
    z2+=1;
    //c = 255;                 // Steigung der Graustufe
    satz += leer;
    alles += satz;
    //satz = satz.replace( "room", "space" );
    //println(alles);
    randX = random(xa,xb);
    randY = random(ya,yb);

    Seite = append(Seite, satz);
    eingabe.addPage(Seite[z]);
    eingabe.clear();
    eingabe.clearPage(Seite[0]);    
    //println(Seite);
    //println(Seite[z]);

    saveStrings("E:/My Dropbox/log/log"+(names.length+1)+".txt", Seite);

    satz = satz.substring(0,satz.length()-satz.length());
    //println("z = "+z);




    if(z>0) {
      int pickColor = colors[int(random(colors.length))];
      texColor[n] = color(pickColor + random(90), random(70) + 30, random(70) + 30);
      String Sei = Seite[z];



      tex[k] = new Tex(Sei,texColor[k]);
      //println("n= "+n);
      //println(Seite[z]);
      //Tex[] tex = new Tex[1000];
      //tex[n] = new Tex(Sei);
      //tex[n].display();
      //tex[n].move();
    }

    k++;
    n++;
    //k=0;
    //println("k = "+k);
    //println("n = "+n);
    //println("count = "+count);
  }
  else if(keyCode == DELETE || keyCode == BACKSPACE) {
    if(satz.length()>0) {
      satz = satz.substring(0,satz.length()-1);
      eingabe.clear();
      //println(satz);
    }
  }
  else if(keyCode == SHIFT || keyCode == ALT || keyCode == CONTROL) {
  }  
  else {


    char[]taste = {
      key
    };
    if(satz.length()<250) {
      taste2 = new String(taste);
      //String taste3 = concat(taste3,taste2(0));
      satz+=taste2;
      //k+=abst;
      //println(satz);
    }
  }
}


void addTex() {
  count++;
}

void addTex2() {
  count2++;
}

void addTex3() {
  count3++;
}

void mousePressed() {
  exit();
}



