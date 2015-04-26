
final String createContacts = 
  "CREATE TABLE contacts ( " +
    "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
    "name TEXT NOT NULL, " +
    "introduced_by INTEGER DEFAULT NULL " +
  ")";

final String populateContacts =
  "INSERT INTO contacts (id, name, introduced_by) " +
  "VALUES " +
    "(1, 'Jonathan Redden', NULL), " +
    "(2, 'Emily Shire', NULL), " +
    "(3, 'Julie Wormser', NULL), " +
    "(4, 'Richard Rowe',  12), " +
    "(5, 'Raul Arroyo Mendoza', NULL), " +
    "(6, 'Subin Varghese',  5), " +
    "(7, 'Justin (Breathing Room)', NULL), " +
    "(8, 'Daniel Bowe', NULL), " +
    "(9, 'Olaf Groth',  NULL), " +
    "(10,  'Stan Bronson',  NULL), " +
    "(11,  'Melissa Kaufman', 2), " +
    "(12,  'Julie Wormser', NULL), " +
    "(13,  'Maria Petrova/Maria Ivanova', NULL), " +
    "(14,  'Lucy McKenzie', 6), " +
    "(15,  'Rick Berry',  NULL), " +
    "(16,  'Nick Gertler',  7), " +
    "(17,  'Gregg Nakano',  NULL), " +
    "(18,  'Karl Kim',  NULL), " +
    "(19,  'Andrew Bates',  NULL), " +
    "(20,  'Bruce Riordan', 6), " +
    "(21,  'Stephan Crawford',  9), " +
    "(22,  'S. Wolfram',  9)";
    
final String contactsWithoutIntroduction =
  "SELECT id, name FROM contacts WHERE introduced_by IS NULL ORDER BY name DESC;";

String contactsByIntroducingContact(int id) {
  return "SELECT id, name FROM contacts WHERE introduced_by = '" + id + "' ORDER BY name DESC;";
}


