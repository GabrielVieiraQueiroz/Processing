class collidable {

  public float x;
  public float y;
  public float w;
  public float h;

  public collidable(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;  
    this.w = w;
    this.h = h;
  }

  public boolean collide(collidable c) {
    if (this.x >= c.x-this.w&&this.x<=c.x+c.w+this.w)
      if(this.y>=c.y-this.h&&this.y<=c.y+c.h+this.h)
        return true;
      else
        return false;
    else
    return false;
  }
}