import codeanticode.eliza.*;
import com.sun.speech.freetts.Voice;
import com.sun.speech.freetts.VoiceManager;
import com.sun.speech.freetts.audio.JavaClipAudioPlayer;
import net.nexttext.*;
import net.nexttext.behaviour.*;
import net.nexttext.behaviour.control.*;
import net.nexttext.behaviour.dform.*;
import net.nexttext.behaviour.physics.*;
import net.nexttext.behaviour.standard.*;
import net.nexttext.property.*;

Basnik verlaine;
Eliza eliza;
Book eingabe, eingabe02;
int var = 0;
String Sei = " ";
String satz = "";
String guestbook = "";
String satzverw = "";
String[] Guestb = {
  " "};
String[] Wort = {
  " "};
String[] Verwechsler = {
  " "};
String[] satz2= {
  "","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","ü","ö","ä","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","Ü","Ö","Ä","ß"," ","."};
String[] Ausnahmen = {
  "der","die","das","ein","eines","eine"};
String leer = " ";
String alles="";
String zeichen = "";
char taste = ' ';
String taste2 = "";
String taste3 = "";
String[] Seite = {
  " "};
PFont font;
BufferedReader infile;
int k = 0;
int z = 0;
int z2 = 0;
int t = 0;
int lastMillis = 0;
int count = 0;
int xa = 150;
int xb = 550;
int ya = 30;
int yb = 500;
float randX = random(xa,xb); 
float randY = random(ya,yb);

void setup() {
  size(860,888);
  eingabe = new Book(this);
  eingabe02 = new Book(this);
  font = createFont("TimesNewRomanPSMT-48.vlw", 22);
  textFont(font);  
  textAlign(CENTER);
  rectMode(CENTER);
  verlaine = new Basnik("kevin16");
  eliza = new Eliza(this);
  eliza.readScript("Script.txt");
  //eliza.readScript("http://chayden.net/eliza/script");
  eingabe.addPage(Seite[0]);
    background(0);
   
}

void draw() {
   fill(0, 60);
  rect(-1000, -1000, width*10, height*10);
  noStroke();


  eingabe.clear();
  //rect(0,0,width,height);
  String zeichen = satz2[var];
  fill(255);
  pushMatrix();
  
  eingabe.addText(satz, width/2, height*2/3,Seite[z]);

  eingabe.stepAndDraw();
  popMatrix();
  


  if (millis() > lastMillis + 400) {
    lastMillis = millis();
    if (count <  z) {
      addTex();
    }
  }
  if(z>0){
    for (int n = 0; n < count; n++) {

    }
  }  
}

void keyPressed() {
  if (keyCode == ENTER){
  String response = eliza.processInput(satz);
  println(response);
  verlaine.mluv(response);
    int mi = minute();  // Values from 0 - 59
    int hou = hour();    // Values from 0 - 23
    int da = day();
    int mo = month();
    int yea = year();
    z+=1;
    z2+=1;
    k++;
    //c = 255;                 // Steigung der Graustufe
    satz += leer;
    alles += satz;
    Wort = splitTokens(satz);
    Verwechsler = splitTokens(alles);    
    guestbook = " / "+da+"."+mo+"."+yea+" "+hou+":"+mi;
    //satz = satz.replace( "fuck", "love " );
    /*if(k>random(10)){
      String wort1 = Wort[int(random(Wort.length))]; 
      String wort2 = Verwechsler[int(random(Seite.length))];  
      for(int a=0;a<Ausnahmen.length;a++){
        if(wort1 == Ausnahmen[a] || wort2 == Ausnahmen[a]){ 
          wort1 = Wort[int(random(Wort.length))]; 
          wort2 = Verwechsler[int(random(Seite.length))];
          satz = satz.replace(wort1,wort2);
        }
        else{
          satz = satz.replace(wort1,wort2);
        }
        k=0;  
      }
    }
    */
    //println(alles);
    randX = random(xa,xb);
    randY = random(ya,yb);
    Guestb = append(Guestb, satz+""+guestbook);
    Seite = append(Seite, satz);





    eingabe.addPage(Seite[z]);
    eingabe.clear();
    eingabe.clearPage(Seite[0]);    
    println(Seite);
    println(Seite[z]);
    //saveStrings("M:/Ausstellung sept 09/Processing/Live_Text_final/log"+names.length+".txt", Seite);
    //saveStrings("M:/Ausstellung sept 09/Processing/Live_Text_final/data/Guestbook"+names.length+".txt", Guestb);
    satz = satz.substring(0,satz.length()-satz.length());

    println("z = "+z);
    if(z>0){
     
     
      String Sei = Seite[z];
      
     
      println(Seite[z]);
      //Tex[] tex = new Tex[1000];
      //tex[n] = new Tex(Sei);
      //tex[n].display();
      //tex[n].move();     
    }



  

    println(satz);
  }
  else if(keyCode == DELETE || keyCode == BACKSPACE){
    if(satz.length()>0){
      satz = satz.substring(0,satz.length()-1);
      eingabe.clear();
      println(satz);
    }
  }
  else if(keyCode == SHIFT || keyCode == ALT || keyCode == CONTROL){
  }  
  else{


    char[]taste = {
      key    };
    taste2 = new String(taste);
    //String taste3 = concat(taste3,taste2(0));
    satz+=taste2;
    //k+=abst;
    println(satz);
  }
}


void addTex(){
  count++;
}

void mousePressed() {
  exit(); 
}

public class Basnik {
  String voiceName = "kevin16";
  VoiceManager voiceManager;
  Voice voice;  

  Basnik(String name){
    voiceName = name;      
    this.setup();  
  }

  void listAllVoices() {
    System.out.println();
    System.out.println("All voices available:");    
    VoiceManager voiceManager = VoiceManager.getInstance();
    Voice[] voices = voiceManager.getVoices();
    for (int i = 0; i < voices.length; i++) {
      System.out.println("    " + voices[i].getName()
        + " (" + voices[i].getDomain() + " domain)");
    }
  }

  void setup() {
    listAllVoices();
    System.out.println();
    System.out.println("Using voice: " + voiceName);

    voiceManager = VoiceManager.getInstance();
    voice = voiceManager.getVoice(voiceName);  

    voice.setPitch(5);
    voice.setPitchShift(8);
    voice.setPitchRange(40); //mutace
    voice.setStyle("breathy");  //"business", "casual", "robotic", "breathy"

    if (voice == null) {
      System.err.println(
      "Cannot find a voice named "
        + voiceName + ".  Please specify a different voice.");
      System.exit(1);
    }  
    voice.allocate();
  }

  void mluv(String _a){      

    if(_a==null){
      _a= "nothing";  
    }
    voice.speak(_a);

  }

  void exit(){
    voice.deallocate();  
  }
}

