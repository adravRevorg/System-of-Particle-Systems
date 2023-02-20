/*Submitted by VARDA GROVER, for HW2

- I have tried to implment system of particle systems
- This is a tiny, creative tool
- where you can upload a picture and add 
some particle systems to add half a dimension to it and
add some liveliness to it
- Currently this has around 6 particle systems
- There is undo option available
- Key mappings for PS
- Saveframe option to later have a quicker video
*/

int no_PS = 0;  //variable to store current number of particles
int total = 0;
//Arraylist enables us to contain objects of varied types
ArrayList<PS> particleSys = new ArrayList<PS>();


//Image
PImage img, keys;
String address;



PImage dog, cat;

//Interactivity related
boolean unhide = true;

boolean imageSet = false;
boolean looping = true;
boolean saveFrame = false;
