import ketai.data.*;

KetaiSQLite db;

int panX = 0;
int panY = 0;
color grey = color(210);
color textGrey = color(80);

ArrayList<Contact> contacts = new ArrayList<Contact>();

PFont labelFont;

void setup() {
  db = new KetaiSQLite(this);
  if ( db.connect() ) {
    if (! db.tableExists("contacts") ) {
      db.execute(createContacts);
      db.execute(populateContacts);
    }
    
    db.query( contactsWithoutIntroduction );
    
    while ( db.next() ) {
      contacts.add(new Contact(db.getInt("id"), db.getString("name")));
    }
  }
  
  labelFont = createFont("Meera.ttf", 110);

  smooth();
}

void draw() {
  String name = "Vijaylaxsmi";
  color vijay = colorFromString(name);
  
  noStroke();
  
  fill( color(255,255,255) );
  rect(0,0,width,height);
  
  pushMatrix();
    translate(panX, panY);
    textFont(labelFont);
    textSize(80);
    
    fill( grey );
    rect( width / 2 - 55, height / 2 - 55, 165 + textWidth(name), 110);
    
    fill( vijay );
    ellipse( width / 2, height / 2, 80, 80 );
    
    fill( textGrey );
    text(namet / 2 + 20);
  popMatrix();
}

void mouseDragged() {
  int dX = mouseX - pmouseX;
  int dY = mouseY - pmouseY;
  
  panX += dX;
  panY += dY;
}
