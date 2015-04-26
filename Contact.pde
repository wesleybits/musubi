class Contact {
  private int id;
  private String name;
  private ArrayList<Contact> children;
  private ArrayList<Edge> edges;
  private Contact parent;
  private PVector location;
  private PVector destination;
  private int nchild;

  public Contact(int _id, String _name) {
    id = _id;
    name = _name;
    children = null;
    edges = null;
    parent = null;
    location = new PVector(0,0,0);
    destination = new PVector(0,0,0);
    nchild = 0;
  }
  
  public Contact(int _id, String _name, Contact _parent) {
    id = _id;
    name = _name;
    children = null;
    edges = null;
    parent = _parent;
    location = new PVector(0,0,0);
    destination = new PVector(0,0,0);
    nchild = 0;
  }
  
  int id() { return id; }
  void id(int _id) { id = _id; }
  
  String name() { return name; }
  void name(String _name) { name = _name; }
  
  PVector location() { return location; }
  void location(PVector _loc) { location = _loc; }
  void location(int x, int y) { location = new PVector(x, y); }
  
  PVector destinatoin() { return destination; }
  void destination(PVector _dest) { destination = _dest; }
  void destination(int x, int y) { destination = new PVector(x, y); }
  
  Contact parent() { return parent; }
  
  ArrayList<Contact> children() {
    if ( children == null ) {
      children = new ArrayList<Contact>();
      edges = new ArrayList<Edge>();
      
      if ( db.connect() ) {
        int i = 0;
        db.query( contactsByIntroducingContact(id) );
        while ( db.next() ) {
          Contact child = new Contact(db.getInt("id"), db.getString("name"), this);
          children.add(child);
          edges.add(new Edge(i, child));
          i++;
        }
      }
      
      println("found " + children.size() + " # of folks introduced by " + name + "!");
    }
    return children;
  }
  
  void resetChildren() { 
    children = null;
    edges = null;
    nchild = 0;
  }
  
  color getColor() { return colorFromString(name); }
  
  float getWidth() {
    return max(textWidth(name) + 10.0f, (children().size() + 2) * 80);
  }
  
  float getHeight() {
    float childrenHeights = 0;
    for (Contact child : children()) {
      childrenHeights += child.getHeight();
    }
    return 145.5f + childrenHeights;
  }
  
  void draw() {
    float x = location.x;
    float y = location.y;
    float cy = y + 100;
    
    fill( getColor() );
    ellipse( x, y, 80, 80 );
    
    fill( textGrey );
    text(name, x + 55, y + 20);
  
    for (int i = 0; i < nchild; i ++) {
      float cx = (i + 1) * 80 + x;
      fill(children().get(i).getColor());
      ellipse(cx, cy, 35, 35);
    }
  }
  
  void update() {
    PVector delta = new PVector(destination.x, destination.y);
    delta.sub(location);
    if (delta.mag() <= 1) {
      location = destination;
    } else {
      delta.div(25);
      location.add(delta);
    }
    
    if (nchild < children().size()) { nchild += 1; }
  }
}
