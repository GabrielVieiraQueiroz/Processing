class Quadrado {
  PVector posicao;
  float r;
  int quadrant = 3;
  
  Quadrado(float x, float y, float r) {
    posicao = new PVector(x, y);
    this.r = r;
  }
  
  void display() {
    noStroke();
    fill(0,0,0);
    rect(posicao.x, posicao.y, r, r);
  }
  
  ArrayList<Quadrado> generate() {
    ArrayList<Quadrado> rects = new ArrayList<Quadrado>();
    float tempR = r/quadrant;
    for (int i=0; i<quadrant; i++)
      for (int j=0; j<quadrant; j++)
        if (!(i==1 && j==1))
        {
          Quadrado newQ = new Quadrado(posicao.x+i*tempR, posicao.y+j*tempR, tempR);
          rects.add(newQ);
        }
    return rects;
  }
}