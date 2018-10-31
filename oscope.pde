
import processing.serial.*; // add the serial library
Serial myPort; // define a serial port object to monitor

// Define initial "time" coordinates of cursor location 
int x = 0;

// Data table and filename specifications
Table table;
String title = month()+"."+day()+"-"+hour()+"h"+minute()+"m-"+second()+"s"+".csv";

void setup() {
  size(1200, 612); // set the window size
  println(Serial.list()); // list all available serial ports
  myPort = new Serial(this, Serial.list()[0], 9600); // define input port
  myPort.clear(); // clear the port of any initial junk
 
 table = new Table(); // Create a table to save data as a csv file
  
 table.addColumn("id");
 table.addColumn("R");
 table.addColumn("C");
}

void draw () {
  
while (myPort.available () > 0) { // make sure port is open
  String inString = myPort.readStringUntil('\n'); // read input string
  
if (inString != null) { // ignore null strings
inString = trim(inString); // trim off any whitespace
String[] xyzaRaw = splitTokens(inString, "\t"); // extract x & y into an array
// proceed only if correct # of values extracted from the string:

if (xyzaRaw.length == 2) {
  
  int a1 = int(xyzaRaw[0]);
  int a2 = int(xyzaRaw[1]);
  
    a1 = int((float)a1*(512.0/1024.0)); // note the type conversions
    a2 = int((float)a2*(512.0/1024.0));

 TableRow newRow = table.addRow();
 newRow.setInt("id", table.lastRowIndex());
 newRow.setFloat("R", a1);
 newRow.setFloat("C", a2);
    
  fill(255, 0, 0);    
  ellipse(x, 550-a1, 10, 10); 
  println(a1);
  
  fill(0, 255, 0);      
  ellipse(x, 550-a2, 10, 10); 
  println(a2);

  x = x + 2;
 
  // Set the bounds inside with the cursor can translate
  // This prevents the cursor from moving off the screen
  if(x > 1200){
    background(225, 225, 225); // pick the fill color (r,g,b). Feel free to change this.
    x = 0;
  }
  
}
}
}

 // Save data to data.csv file on local computer
 //saveTable(table, "data.csv");
 
 // Save file to .csv file containing month, day, hour, minute, and second
 saveTable(table, title);

}
