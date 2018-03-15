
Body[] bodies = new Body[10];

void setup() {
  size(800, 300);
  for (int i = 0; i < bodies.length; i++) {
    bodies[i] = new Body(random(1, 4), 0, 0);
  }
}

float timeSinceLastFrame = 0;

void draw() {
  background(255);
  
  float deltaTime = 0.001 * (millis()-timeSinceLastFrame) ;
  
  timeSinceLastFrame = millis();

  for (int i = 0; i < bodies.length; i++) {

    PVector wind = new PVector(10, 0);
    PVector gravity = new PVector(0, 100*bodies[i].mass);

    bodies[i].applyForce(wind);
    bodies[i].applyForce(gravity);

    bodies[i].update(deltaTime);
    bodies[i].display();
    bodies[i].checkEdges();
  }
}