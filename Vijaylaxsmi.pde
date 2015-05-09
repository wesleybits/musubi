class Vijaylaxsmi extends Contact {
  private ArrayList<Contact> children;
  
  public Vijaylaxsmi() {
    super(0, "Vijaylaxsmi Kesavan");
    children = null;
  }
  
  public ArrayList<Contact> children() {
    if (children == null) {
      children = new ArrayList<Contact>();
      if (db.connect()) {
        db.query(contactsWithoutIntroduction);
        while (db.next()) {
          Contact child = new Contact(db.getInt("id"), db.getString("name"), this);
          children.add(child);
        }
      }
    }
    return children;
  }
  
  public void resetChildren() { children = null; }
}
