void drawX(float x, float y, float size) {
  line(x, y, x + size, y + size);
  line(x + size, y, x, y + size);
}

// Function to draw ellipse at given position (x, y)
void drawEllipse(float x, float y, float size) {
  ellipse(x + size / 2, y + size / 2, size, size);
}
