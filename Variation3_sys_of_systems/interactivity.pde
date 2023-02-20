void keyPressed(){
  if (key == 'o'){
    particleSys.add(new omni(1000,new PVector(mouseX,mouseY)));
    no_PS++; total+=1000;
  }
  else if (key =='r'){
    particleSys.add(new directed(450,new PVector(mouseX,mouseY)));
    no_PS++; total+=450;
  }
  else if (key == 'w'){
    particleSys.add(new fireworks(2000,new PVector(mouseX,mouseY)));
    no_PS++; total+=2000;
  }
  else if (key == 'f'){
    PVector d = new PVector(0,-1,0);
    d.setMag(mouseY/7);
    particleSys.add(new fountain(1000, new PVector(mouseX,mouseY), d));
    no_PS++;total+=1000;
  }
  else if (key== 'c'){
    particleSys.add(new confetti(500,new PVector(mouseX,mouseY)));
    no_PS++;  total+=500;
  }
  else if(key == 's'){
    particleSys.add(new snow(1000,new PVector(mouseX,mouseY)));
    no_PS++;  total+=1000;
  }
  else if(key == 'g'){
    particleSys.add(new firefly(150,new PVector(mouseX,mouseY)));
    no_PS++;  total+=150;
  }
  else if(key=='h'){
    unhide = !unhide;
  }
  else if(key=='i'){
    selectInput("", "displayImage"); 
  }
  else if(key=='u'){
    no_PS--;
    if (no_PS>=0)
      particleSys.remove(no_PS);
  }
  else if(key=='x'){
    imageSet = false;
  }
  else if(key=='p'){
    looping = !looping;
    if (looping)  loop();
    else noLoop();
  }
  else if(key=='y'){
    saveFrame = !saveFrame;
  }
}
