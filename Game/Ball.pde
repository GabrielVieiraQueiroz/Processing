class Ball extends collidable {

  boolean shoot;
  float bounce = -1;
  PVector speed;
  float gravity; 
  int style;
  float mass;
  int dmg;
  public float r,g,b;
  public Ball(float x, float y, float w, float h) {
    super(x, y, w, h);
    r=255;
    g=0;
    b=0;
    speed = new PVector();
    gravity = 0.5; 
    style = 1;
    mass = 1;
    dmg = 30;
  }

  void show() {
    x-=speed.x*mass;
    y-=speed.y*mass;
    if (shoot == true) {
      speed.y-=gravity;
    }
    if(y >= height-100)
    {
      speed.x *= 0.5;
      speed.y *= bounce;
    }
    if(style==1){
      r = 255;
      g = 0;
      b = 0;
      mass = 1;
      dmg = 30;
    }else if(style==2){
      r = 0;
      g = 255;
      b = 0;
      mass = 1.5;
      dmg = 20;
    }else{
      r = 0;
      g = 0;
      b = 255;
      mass = 0.5;
      dmg = 50;
    }
    fill(r, g, b);
    ellipseMode(CORNER);
    ellipse(x, y, w, h);
  }
  
}