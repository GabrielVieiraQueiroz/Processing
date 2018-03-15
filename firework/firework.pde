ArrayList systems;

void setup() {
   frameRate(24);
   size(600,600);
   background(0);
   systems = new ArrayList();
}

void mouseClicked() {
  int size = round(random(100,1000));
  systems.add( new ParticleSystem(size,random(.004*size,.006*size),mouseX,mouseY) ); 
}

void draw() {
 fill(0,80);
 rect(0,0,width,height);
 for(int i = systems.size() -1 ; i >= 0 ; i--) {
   ParticleSystem ps = (ParticleSystem)systems.get(i);
   if(ps.done())
      systems.remove(i); 
   else
     ps.draw();
 }
 
}

class Particle {
  int t;
  PVector p;
  PVector v;
  float r = 3.0;
  float g = 0.05;
  color c;
  
  Particle(float max_v, color inC) {
    p = new PVector(0,0);
    float a = random(0,TWO_PI);
    float vel = random(0,max_v);
    v = new PVector(vel*cos(a),vel*sin(a));
    c = inC;
  }
  
  void draw() {
    update();
    noStroke();
    fill(c);
    ellipse(p.x,p.y,r,r);
  }
  
  void update() {
    t++;
    v.add(new PVector(0,g));
    p.add(v); 
  }
  
  boolean done() {
    if(t > 50)
       return true; 
    return false;
  }

  
}

class ParticleSystem {
  ArrayList particles;
  PVector p;
  color c;
  int r = 200;
  int g = 100;
  int b = 100;
  
  ParticleSystem(int size, float spread, float x, float y) {
    p = new PVector(x,y);
    particles = new ArrayList();
    c = color(170,0,0);
    for(int i = 0; i < size; i++)
       particles.add(new Particle(spread,c)); 
  }
  
  void draw() {
    pushMatrix();
    translate(p.x,p.y);
    for(int i=particles.size()-1; i >= 0 ; i--) {
      Particle p = (Particle)particles.get(i);
      if( p.done() )
         particles.remove(i);
      else
         p.draw();
    }
    popMatrix();
  }
  
  boolean done() {
    if(particles.size() == 0 )
       return true; 
    return false;
  }
  
}