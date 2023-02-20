class omni implements PS {

  int N;
  float h = 0.1;
  int n=0;
  int addRate = 100;
  float lifespan = 5000;
  PVector origin;
  PVector[] x, v;
  int[] age;

  omni(int no, PVector o) {
    N = no;
    origin = o;
    x = new PVector[N];
    v = new PVector[N];
    age = new int[N];
  }

  void addParticles() {
    for (int i=0; i<addRate && n<N-1; i++, n++) {
      x[n] = origin.copy();  //assuming one from center of screen
      v[n] = new PVector(random(-50, 50), random(-50, 50), random(-50, 50));
      age[n] = 0;
    }
  }

  void updateState(int i) {
    x[i].add(PVector.mult(v[i], h));
  }

  void drawParticles() {
    strokeWeight(2);
    for (int i=0; i<n; i++) {
      stroke(255);
      this.updateState(i);
      if (age[i]>lifespan)
      {

        i+=100;
        continue;
      }
      point(x[i].x, x[i].y);
      age[i]++;
    }
  }
  
  void reborn(int i){
  }
}
