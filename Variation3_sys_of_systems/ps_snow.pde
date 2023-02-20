public class snow implements PS{
  int N;
  float h = 1;
  int n=0;
  int addRate = 50;
  int lifespan = 255;
  PVector dir;
  PVector[] x, v;
  
  PVector a = new PVector(0.01,0.01,0);
  int[] age;
  float[] r;
  
  snow(int no, PVector d){
    N = no;
    dir = d;
    x = new PVector[N];
    v = new PVector[N];
    age = new int[N];
    r = new float[N];
  }
  
  void addParticles(){
    for(int i=0; i<addRate && n<N-1; i++,n++){
      x[n] = new PVector(random(width),random(height));
      v[n] = new PVector(random(-2,2),0);
      age[n] = 0;
      r[n] = random(0.5,6);
    }
  }
  
  void updateState(int i){
    
    if (x[i].x>=width || x[i].x<0 || x[i].y>=height || x[i].y<0 || age[i]>=lifespan){ 
      reborn(i);return;
    }
    x[i].add(PVector.mult(v[i],h));
    
    v[i].add(PVector.mult(a,h));
  }
  
  void drawParticles() {
    stroke(360,0,1);
    
    for (int i=0; i<n; i++) {
      strokeWeight(r[i]);
      stroke(1,0,1,0.5);
      this.updateState(i);
      point(x[i].x, x[i].y);
      age[i]++;
    }
  }
  
  void reborn(int i){
    x[i] = new PVector(random(width),random(height));
    v[i] = new PVector(random(-2,2),0);
    age[i] = 0;
  }
}
