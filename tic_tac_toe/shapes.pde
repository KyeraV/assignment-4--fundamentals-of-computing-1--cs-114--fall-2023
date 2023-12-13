void drawX(float x, float y, float width, float height) {
  line(x, y, x + width, y + height);
  line(x, y + height, x + width, y);
}

void drawO(float x, float y, float width, float height) {
  ellipse(x + width / 2, y + height / 2, width, height);
}
