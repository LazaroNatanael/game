class Parede {
  private float x, y, tamanho;
  //private boolean obstaculo;
  private int classificacao;
  //0 é uma parede
  //1 é caminho
  boolean circleRect(float cx, float cy, float radius) {
    if (classificacao == 0) {
      float testX = cx, rx = x, rw = x+tamanho;
      float testY = cy, ry=y, rh = y+tamanho;

      if (cx < rx)         testX = rx;
      else if (cx > rx+rw) testX = rx+rw;
      if (cy < ry)         testY = ry;
      else if (cy > ry+rh) testY = ry+rh;

      float distX = cx-testX;
      float distY = cy-testY;
      float distance = sqrt( (distX*distX) + (distY*distY) );


      if (distance <= radius) {
        return false;
      }
    }
    return true;
  }

  Parede(float x, float y) {
    this.x = x;
    this.y = y;
    classificacao = 1;
    //obstaculo = false;
    tamanho = 30;
  }

  void getClassificacao(int c) {
    classificacao = c;
  }

  boolean setClassificacao() {
    if (classificacao==0) {
      return false;
    }
    return true;
  }

  void desenhaParede() {

    if (classificacao == 0) {
      fill(200, 100, 0);
      rect(x, y, tamanho, tamanho);
    } else {
      noStroke();
      fill(200, 200, 200);
      rect(x, y, tamanho, tamanho);
    }
  }
}
