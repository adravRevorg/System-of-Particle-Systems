void setup(){
  size(1800,900, P3D);
  surface.setLocation(10,10);
  
  keys = loadImage("keys.png");
  
  colorMode(HSB,360,1,1,1);
  
  
  
  dog = loadImage("dog.png");
  cat = loadImage("cat1.png");
  textSize(20);
}

void displayImage(File selection){
  println(selection.getAbsolutePath());
 img = loadImage(selection.getAbsolutePath());
 img.resize(0,height);
 imageSet = true;
}
