class directed implements PS{
  
  int N;
  float h = 0.1;
  int n=0;
  int addRate = 100;
  float lifespan = 5000;
  PVector dir;
  PVector[] x, v;
  int[] age;
  
  directed(int no, PVector d){
    N = no;
    dir = d;
    addRate = N/20;
    x = new PVector[N];
    v = new PVector[N];
    age = new int[N];
  }
  
  void addParticles(){
    if (frameCount%50!=0)
      return;
      
    for(int i=1; i<=addRate && n<N-1; i++,n++){
      
      float row = (i%20)*width/10 - width;
      float col = -100;//
      x[n] = new PVector(row,col);  //assuming one from center of screen
      v[n] = new PVector(1,1);
      v[n].setMag(30);
      age[n] = 0;
    }
    println(n,N);
  }
  
  void updateState(int i){
    x[i].add(PVector.mult(v[i],h));
    //if (x[i].y>height && (i+1)%addRate==0)
    //  reborn(i);
  }
  
  void drawParticles() {
    background(1,0,1);
    strokeWeight(2);
    for (int i=0; i<n; i++) {
      stroke(255);
      this.updateState(i);
      if (age[i]>lifespan)
      {

        i+=100;
        continue;
      }
      
      if (i%2==0)
        image(dog,x[i].x%width, x[i].y%height);
      else
         image(cat,x[i].x%width, x[i].y%height);
         
      line(x[i].x, x[i].y, (x[i].x-10), x[i].y-10);
      age[i]++;
    }
  }
  
  void reborn(int j){
    for(int i=j-addRate+1; i<=addRate; i++){
      
      float row = (i%20)*width/10 - width;
      float col = -100;//
      x[i] = new PVector(row,col);  //assuming one from center of screen
      v[i] = new PVector(1,1);
      v[i].setMag(30);
      age[i] = 0;
    }
  }
}
