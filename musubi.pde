import android.view.MotionEvent;
import ketai.data.*;
import ketai.ui.*;

KetaiSQLite db;
KetaiGesture gesture;

int panX = 0;
int panY = 0;
color grey = color(210);
color textGrey = color(80);

Vijaylaxsmi vijay;

PFont labelFont;

void setup() {
  db = new KetaiSQLite(this);
  gesture = new KetaiGesture(this);
  if ( db.connect() ) {
    if (! db.tableExists("contacts") ) {
      db.execute(createContacts);
      db.execute(populateContacts);
    }
    
    db.query( contactsWithoutIntroduction );
  }
  
  labelFont = createFont("Meera.ttf", 110);

  smooth();
  vijay = new Vijaylaxsmi();
  vijay.location( 100, 100 );
  vijay.destination( 100, 100 );
}

void draw() {
  noStroke();
  
  fill( color(255,255,255) );
  rect(0,0,width,height);
  
  pushMatrix();
    translate(panX, panY);
    textFont(labelFont);
    textSize(80);
    
    vijay.draw();
    vijay.update();
  popMatrix();
}

void onTap(float x, float y) {
  vijay.resetChildren();
}

void mouseDragged() {
  int dX = mouseX - pmouseX;
  int dY = mouseY - pmouseY;
  
  panX += dX;
  panY += dY;
}

public boolean surfaceTouchEvent(MotionEvent event) {
  super.surfaceTouchEvent(event);
  return gesture.surfaceTouchEvent(event);
}
