import constants;
import shapes;

int[][] gameBoard;
int cellSize;

void initializeGame() {
  gameBoard = new int[3][3];
}

void drawGridLines() {
  stroke(0);
  strokeWeight(4);
  for (int i = 1; i < 3; i++) {
    float x = i * cellSize;
    line(x, 0, x, height);
    float y = i * cellSize;
    line(0, y, width, y);
  }
}

void drawGameBoard() {
  for (int row = 0; row < 3; row++) {
    for (int col = 0; col < 3; col++) {
      float centerX = col * cellSize + cellSize / 2;
      float centerY = row * cellSize + cellSize / 2;

      if (gameBoard[row][col] == PLAYER) {
        drawCircle(centerX, centerY, cellSize * 0.8);
      } else if (gameBoard[row][col] == COMPUTER) {
        drawX(centerX, centerY, cellSize);
      }
    }
  }
}

void drawCircle(float x, float y, float diameter) {
  shapes.drawCircle(x, y, diameter);
}

void drawX(float x, float y, float size) {
  shapes.drawX(x, y, size);
}
