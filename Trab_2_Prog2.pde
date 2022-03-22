Cenario Mapa = new Cenario();
boolean comecar = false;
void setup() {
  size(300, 300);
  Mapa.desenha(0);
}

int qtdObstaculos = 0;
void draw() {
  if (comecar == false) {
    Mapa.desenha(1);
    if (mousePressed) {
      Mapa.mousePressed();
    }
  } else {
    Mapa.desenha(3);
    Mapa.keyPressed();
    if(Mapa.gameOver()) stop(); 
  }
  if (keyCode == ENTER && comecar == false) {
    Mapa.criaInimigo(3);
    comecar = true;
    Mapa.desenha(2);
  }
  
}
