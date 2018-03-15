class Body {
 

  PVector pos;
  PVector vel;
  PVector forces;
  float mass;

  Body(float m, float x , float y) {
    mass = m;
    pos = new PVector(x,y);
    vel = new PVector(0,0);
    forces = new PVector(0,0);
  }
  
  void applyForce(PVector force) {
    forces.add(force);
  }
  
  void integrate(float deltaTime) {
    PVector acceleration = PVector.div(forces,mass);
    vel.add(PVector.mult(acceleration,deltaTime));
    pos.add(PVector.mult(vel,deltaTime));
    forces.mult(0);
  }
  
  void update(float deltaTime){
    integrate(deltaTime);
  }
  
  
  

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(0,127);
    ellipse(pos.x,pos.y,mass*16,mass*16);
  }

  void checkEdges() {

    if (pos.x > width) {
      pos.x = width;
      vel.x *= -1;
    } else if (pos.x < 0) {
      vel.x *= -1;
      pos.x = 0;
    }

    if (pos.y > height) {
      vel.y *= -1;
      pos.y = height;
    }

  }

}