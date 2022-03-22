class Fruta {
  int x, y, raio;
  boolean existe;
  Fruta(int x, int y) {
    this.x = x;
    this.y = y;
    raio = 10;
    existe = false;
  }
  void existeFruta(int i) {
    if (i==1)existe=true;
    else {
      existe=false;
    }
  }
  boolean existe() {
    return existe;
  }

  void desenhaFruta() {
    if (existe!=false) {
      fill(0, 128, 0);
      noStroke();
      ellipse(x, y, raio, raio);
    }
  }
}
