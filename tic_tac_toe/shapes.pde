// shapes.pde
void drawX(float x, float y) {
  line(x, y, x + CELL_SIZE, y + CELL_SIZE);
  line(x, y + CELL_SIZE, x + CELL_SIZE, y);
}

void drawO(float x, float y) {
  ellipse(x + CELL_SIZE / 2, y + CELL_SIZE / 2, CELL_SIZE * 0.8, CELL_SIZE * 0.8);
}
