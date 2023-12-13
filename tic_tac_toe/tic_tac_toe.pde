void setup() {
  size(500, 500);
  setupBoard();
  makeComputerMove(); // Computer goes first
}

void draw() {
  background (255);
  drawTicTacToeBoard();
}

void keyPressed() {
}
