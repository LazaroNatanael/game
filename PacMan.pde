class PacMan {
  int x, y, raio = 20;

  PacMan(int x, int y) {
    this.x = x + 15;
    this.y = y + 15;
  }
  
  void andar(int x, int y) {
    this.x += x;
    this.y += y;
  }
  
  void desenhaPacman(int cor){
    fill(cor,0,0);
    ellipse(x,y,raio,raio);  
  }
  
  int getX() {
    return x;
  }
  
  int getY() {
    return y;
  }
  int getRaio() {
    return raio/2;
  }
}
