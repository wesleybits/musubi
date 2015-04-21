class Contact {
  private int id;
  private String name;
  private ArrayList<Contact> children;
  
  public Contact(int _id, String _name) {
    this.id = _id;
    this.name = _name;
  }
  
  int id() { return id; }
  void id(int _id) { id = _id; }
  
  String name() { return name; }
  void name(String _name) { name = _name; }
  
  ArrayList<Contact> children() {
    if ( children == null ) {
      children = new ArrayList<Contact>();
      if ( db.connect() ) {
        db.query(
          "SELECT id, name FROM contacts WHERE introduced_by = '" + id + "' ORDER BY name ASC;"
        );
        while ( db.next() ) {
          children.add(
            new Contact(
              db.getInt("id"),
              db.getString("name")
            )
          );
        }
      }
      println("found " + children.size() + " # of folks introduced by " + name + "!");
    }
    return children;
  }
  
  void resetChildren() { children = null; }
}
  
  
