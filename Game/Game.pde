Ball shootBall;
int clickX;
int clickY;
float maxSpeed,w;
int speed;
int player;
int screen = 1;
int lf1, lf2;
PVector wind;
float ang;
float mx, my;
boolean draw;

void setup() {
  smooth();
  fullScreen();
  player = 1;
  background(0, 200, 230);
  shootBall = new Ball( 200, height-230, 30, 30);
  maxSpeed = width/9;
  wind = new PVector(random(-10, 10), 0);
  w = wind.x;
  lf1=100;
  lf2=100;
  draw = false;
}

void draw() { 
  if (screen == 0) {
    // menu
    background(0, 200, 230);
    textAlign(CENTER);
    textSize(100);
    fill(0, 100, 0);
    text("Joguinho", width/2, height/2);
    textSize(20);
    fill(0);
    text("Play: Clique na tela e aperte Enter", width/2, height/2+140 );
    text("Botão esquerdo do mouse: atira", width/2, height/2-200 );
    text("Botão direito do mouse: troca projetil", width/2, height/2-150 );
  } else if (screen == 1) {
    background(0, 100, 150);
    checkBallBoundary();
    shootBall.show();
    hitSomething();
    if (draw == true)
      drawLine();
    //Chão
    fill(0, 100, 0);
    rect(0, height-100, width , 100);
    //Estilingue
    fill(200,200,0);
    rect(190, height-200, 50 , 100);
    //Estilingue 2
    fill(0,200,200);
    rect(width-210, height-200, 50 , 100);
    fill(255);
    textAlign(LEFT);
    textSize(30);
    text("Vez: P"+player, width/2-300, 60);
    text("Vento: "+nf(w,0,2), width/2, 60);
    text("Vida P1: "+lf1, 100, 60);
    text("Vida P2: "+lf2, width-300, 60);
  } else if (screen == 2) {
    // game over
    background(0, 200, 230);
    textAlign(CENTER);
    textSize(100);
    fill(0, 100, 0);
    if(player==1)
      text("Ganhador: P2", width/2, height/2);
    else
      text("Ganhador: P1", width/2, height/2);
    textSize(20);
    fill(0);
    text("Aperte Enter para jogar novamente!", width/2, height/2+140 );
  }
}

void hitSomething() {
    collidable p1 = new collidable(190, height-200, 50 , 100);
    collidable p2 = new collidable(width-210, height-200, 50 , 100);
    if(player==1){
      if (shootBall.collide(p2)== true) {
        lf2-=shootBall.dmg;
        shootBall = new Ball( width-200, height-230, 30, 30);
        wind = new PVector(random(-10, 10), 0);
        w = wind.x;
        if(lf2<=0)
          screen=2;
        player = 2;
         shootBall.shoot = false;
      }
    }else{
      if (shootBall.collide(p1)== true) {
        lf1-=shootBall.dmg;
        shootBall = new Ball(200, height-230, 30, 30);
        wind = new PVector(random(-10, 10), 0);
        w = wind.x;
        if(lf1<=0)
          screen=2;
        player = 1;
         shootBall.shoot = false;
      }
    }
}

void checkBallBoundary() {
  if (shootBall.x>=width || shootBall.x<=0 || abs(shootBall.speed.x) <= maxSpeed/200 && abs(shootBall.speed.x) > 0){  
   if(player==1)
     player = 2;
   else
     player = 1;
    
   if(player==1)
     shootBall = new Ball(200, height-230, 30, 30);
   else
     shootBall = new Ball( width-200, height-230, 30, 30);
   wind = new PVector(random(-10, 10), 0);
   w = wind.x;
   shootBall.shoot = false;
  }
}

void drawLine() {
  stroke(0);
  strokeWeight(2);
  line(shootBall.x+shootBall.w/2, shootBall.y+shootBall.h/2, mouseX, mouseY);
}

void keyPressed() {
  if (keyCode == ENTER) {
    setup();
    screen = 1;
  }
}

void mouseClicked() {
  if (mouseButton == RIGHT){
    shootBall.style++;
    if(shootBall.style == 4)
      shootBall.style=1;
    shootBall.show();
  }
}

void mousePressed() {
  if (mouseButton == LEFT)
    draw = true;
}
void mouseReleased() {
  if (mouseButton == LEFT) {
    draw = false;
    if (shootBall.shoot == false) {
      ang = atan2(mouseY-shootBall.y, mouseX-shootBall.x);
      float distance = dist (mouseX, mouseY, shootBall.x, shootBall.y);
      distance=distance/1.3;
      mx = distance*cos(ang);
      my = distance*sin(ang);
      shootBall.shoot = true;
      shootBall.speed = new PVector(mx, my);
      if (shootBall.speed.mag()>=maxSpeed)
        shootBall.speed.setMag(maxSpeed);
      shootBall.speed.div(10);
      if(player==1)
       shootBall.speed.add(wind.mult(-1));
      else
       shootBall.speed.add(wind);
    }
  }
}