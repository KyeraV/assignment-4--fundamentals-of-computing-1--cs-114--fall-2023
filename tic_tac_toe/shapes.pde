void drawCircle(float x, float y, float diameter) {
  ellipse(x, y, diameter, diameter);
}

void drawX(float x, float y, float size) {
  float offset = size * 0.4;
  line(x - offset, y - offset, x + offset, y + offset);
  line(x - offset, y + offset, x + offset, y - offset);
}
