class confetti extends snow {
  
  int[] type;
  
  confetti(int no, PVector d){
    super(no,d);
    addRate = 100;
    
    assignType();
  }
  
  void drawParticles() {
    
    noStroke();
    
    for (int i=0; i<n; i++) {
      fill(i%360,1,1);
      
      a.y = random(0.03,0.04);
      a.x = random(-0.15,0.15);
      this.updateState(i);
      if (type[i]==0)      rect(x[i].x, x[i].y, 3,6);
      else                 circle(x[i].x,x[i].y,6);
      age[i]++;
    }
    
  }
  
  void assignType(){
    
    type = new int[N];
    
    for (int i=0; i<N; i++){
      type[i] = (int)(random(2));
    }    
  }
    
}
