class fountain implements PS{
  int N;
  float h = 1;
  int n=0;
  int addRate = 50;
  int lifespan = 255;
  PVector dir;
  PVector orig;
  PVector[] x, v;
  PVector a = new PVector(0,0.285,0);
  int[] age;
  
  fountain(int no, PVector o, PVector d){
    N = no;
    dir = d;
    orig = o;
    x = new PVector[N];
    v = new PVector[N];
    age = new int[N];
  }
  
  void addParticles(){
    for(int i=0; i<addRate && n<N-1; i++,n++){
      x[n] = orig.copy();  //assuming one from center of screen
      v[n] = new PVector(random(-2,2),random(-10,-5));//PVector.add(dir, new PVector(random(-8,8),random(-2,2)));
      age[n] = 0;
    }
  }
  
  void updateState(int i){
    //a = new PVector(0,sliderValue/10.0,0);
    if (x[i].y>orig.y || age[i]>=lifespan){  //so say if they die / they hit floor ->kill and a new particle should be born at this array index
      reborn(i);return;
    }
    x[i].add(PVector.mult(v[i],h));
    
    v[i].add(PVector.mult(a,h));
  }
  
  void drawParticles() {
      
    strokeWeight(2);
    stroke(360,0,1);
    for (int i=0; i<n; i++) {
      this.updateState(i);
      
      point(x[i].x, x[i].y);
      
      age[i]++;
    }
    
  }
  
  void reborn(int i){
    x[i] = orig.copy();  //assuming one from center of screen
    v[i] = new PVector(random(-2,2),random(-10,-5));//PVector.add(dir, new PVector(random(-8,8),random(-2,2)));
    age[i] = 0;
  }
}
  
  
