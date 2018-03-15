ArrayList<Quadrado> quad;

///Aperte qualquer tecla do teclado

void setup() {
  size(700, 700);
  noSmooth();
  quad = new ArrayList<Quadrado>();
  quad.add(new Quadrado(0, 0, width));
}

void draw() {
  background(255);
  for (int i = 0; i < quad.size() ; i++)
    quad.get(i).display();
}

void keyPressed() {
  ArrayList<Quadrado> att = new ArrayList<Quadrado>();
  for (int i = 0; i < quad.size(); i++)
    att.addAll(quad.get(i).generate());
  quad = att;
}