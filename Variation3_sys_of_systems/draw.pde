void draw(){
  background(0);
  
  
  displayStuff();
  
  stroke(255);
  for (int j=0; j<no_PS; j++){
    (particleSys.get(j)).addParticles();
    (particleSys.get(j)).drawParticles();
  }
  
  if (saveFrame) 
      saveFrame("frames/####.tga");
}

void displayStuff(){
  
  stroke(1,0,1);
  text("FrameRate       : " + int(frameRate),width*0.85,30);
  text("Total Particles : " + total, width*0.85, 60);
  if (unhide)    image(keys, width*0.84, 80);
  if (imageSet)  image(img,0,0);
  
}
