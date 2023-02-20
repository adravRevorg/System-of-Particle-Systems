class firefly extends snow {
  
  
  int[] rad;
  
  
  firefly(int no, PVector d){
    super(no,d);
    addRate = 20;
    a = new PVector(random(-0.001,0.001),random(-0.001,0.001),0);
    rad = new int[N];
  }
  
  void addParticles(){
    for(int i=0; i<addRate && n<N-1; i++,n++){
      x[n] = new PVector(random(width),random(height));
      v[n] = new PVector(random(-0.5,0.5),random(-0.5,0.5));
      age[n] = 0;
      rad[n] = (int)(random(2,15));
    }
  }
  
  void drawParticles() {
    
    noStroke();
    
    for (int i=0; i<n; i++) {
      
      
      this.updateState(i);
      
      fill(83,0.5,1,0.5);
      circle(x[i].x,x[i].y,random(6,12)+rad[i]);
      fill(83,1,1);
      circle(x[i].x,x[i].y,rad[i]);
      age[i]++;
    }
    
  }
  void updateState(int i){
    
    if (x[i].x>=width || x[i].x<0 || x[i].y>=height || x[i].y<0){ 
      reborn(i);return;
    }
    x[i].add(PVector.mult(v[i],h));
    
    v[i].add(PVector.mult(a,h));
  }
    
}
