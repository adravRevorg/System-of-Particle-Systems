class fireworks implements PS {
  
  int N;
  float h = 1;
  int n=0;
  int addRate = 100;
  float lifespan = 1000;
  PVector origin;
  
  boolean[] alive;
  float[] theta;
  float[] len, v, a;
  
  float clr;
  
  int totalDead = 0;
  
  fireworks( int n, PVector o){
    N = n;
    origin = o.copy();
    theta = new float[N];
    len = new float[N];
    v = new float[N];
    addRate = 100;
    a = new float[N];
    alive = new boolean[N];
    clr = random(360);
  }

  void addParticles() {
    for (int i=0; i<addRate && n<N-1; i++, n++) {
      theta[n] = random(TWO_PI);
      len[n] = 0;
      v[n] = random(1,4);
      a[n] = -random(0.05,0.1);
      alive[n] = true;
    }
  }
  
  void updateState(int i){
    
    if (v[i]<=0)
        {alive[i] = false; totalDead++; return;}
    len[i]+=v[i]*h;
    v[i]+=a[i]*h;
  }
  
  void drawParticles() {
    
    
    if (totalDead==N-1)
        reborn(n);
    
    for (int i=0; i<n; i++) {
      
      if (!alive[i])
        continue;
      strokeWeight(1);
      stroke(clr, 1 - v[i]/8, 1);
      float x0 = origin.x + len[i]*cos(theta[i]);;
      float y0 = origin.y + len[i]*sin(theta[i]);
      this.updateState(i);
      float x = origin.x + len[i]*cos(theta[i]);
      float y = origin.y + len[i]*sin(theta[i]);
      //point(x,y);
      line(x - 3*cos(theta[i]),y - 3*sin(theta[i]),x,y);
    }
  }
  
  void reborn(int i){
    n = 0;
    totalDead = 0;
    origin = new PVector(random(width),random(height/2));
    clr = random(360);
  }
  
  

  
  
}
