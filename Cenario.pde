class Cenario {
  PacMan pac = new PacMan(0, 0);
  PacMan[] Inimigos;
  int[] aux;
  Parede[][] Paredes = new Parede[10][10];
  Fruta[][] Frutas = new Fruta[10][10];

  int qtdFrutas = 0;
  Cenario() {
  }

  void desenha(int controle) {
    for (int i = 0; i < Paredes.length; i++) {
      for (int j = 0; j < Paredes[i].length; j++) {
        if (controle == 0) {
          Paredes[i][j] = new Parede(i*30, j*30);
          Frutas[i][j] = new Fruta(i*30+15, j*30+15);
        } else if (controle == 1) {
          Paredes[i][j].desenhaParede();
        } else if (controle == 2) {
          if (Paredes[i][j].setClassificacao() == true) {
            Frutas[i][j].existeFruta(1);
            qtdFrutas++;
            Frutas[i][j].desenhaFruta();
          }
        } else {
          Paredes[i][j].desenhaParede();
          Frutas[i][j].desenhaFruta();
          pac.desenhaPacman(128);
        }
      }
    }
  }
  void getCenario(int x, int y, int c) {
    Paredes[x/30][y/30].getClassificacao(c);
  }
  void mousePressed() {
    if (mousePressed && (mouseButton == LEFT)) {
      getCenario(mouseX, mouseY, 1);
    } else if (mouseButton==RIGHT) {
      getCenario(mouseX, mouseY, 0);
    }
  }
  void keyPressed() {
    andarInimigo();
    int x=0, y=0;
    if (keyCode == UP && Paredes[pac.getX()/30][(pac.getY()-9)/30].circleRect(pac.getX(), pac.getY(), pac.getRaio())) y=-1;
    if (keyCode == DOWN && Paredes[pac.getX()/30][(pac.getY()+9)/30].circleRect(pac.getX(), pac.getY(), pac.getRaio())) y=1;
    if (keyCode == LEFT && Paredes[(pac.getX()-9)/30][pac.getY()/30].circleRect(pac.getX(), pac.getY(), pac.getRaio())) x=-1;
    if (keyCode == RIGHT && Paredes[(pac.getX()+9)/30][pac.getY()/30].circleRect(pac.getX(), pac.getY(), pac.getRaio())) x=1;

    if (pac.getX()-9+x > 0 && pac.getX()+9+x < 300 && pac.getY()-9+y > 0 && pac.getY()+9+y < 300) {
      pac.andar(x, y);
      if (Frutas[pac.getX()/30][pac.getY()/30].existe()) {
        Frutas[pac.getX()/30][pac.getY()/30].existeFruta(2);
        qtdFrutas--;
      }
    }
  }

  void criaInimigo(int qtd) {
    Inimigos = new PacMan[qtd];
    aux = new int[qtd];
    for (int i = 0; i < Inimigos.length; i++) {
      Inimigos[i] = new PacMan(((int) random(0, 270)/30)*30, ((int) random(0, 270)/30)*30);
      aux[i] = 2;
    }
  }
  void andarInimigo() {
    for (int i = 0; i < Inimigos.length; i++) {
      if (Inimigos[i].getX() <=0  )aux[i] = 2;
      if (Inimigos[i].getX() >= 300) aux[i] = -2;
      Inimigos[i].andar(aux[i], 0);
      Inimigos[i].desenhaPacman(0);
      if(circleCircle(pac.getX(),pac.getY(),pac.getRaio(),Inimigos[i].getX(),Inimigos[i].getY(),Inimigos[i].getRaio())) qtdFrutas=0;
    }
  }
  boolean gameOver() {
    if (qtdFrutas ==0) {
      return true;
    }
    return false;
  }
  boolean circleCircle(float c1x, float c1y, float c1r, float c2x, float c2y, float c2r) {
    float distX = c1x - c2x;
    float distY = c1y - c2y;
    float distance = sqrt( (distX*distX) + (distY*distY) );
    if (distance <= c1r+c2r) {
      return true;
    }
    return false;
  }
}
