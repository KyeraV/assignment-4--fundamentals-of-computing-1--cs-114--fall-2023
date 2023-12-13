void drawBoard() {
  float cellWidth = width / 3;
  float cellHeight = height / 3;

  // Draw the Tic Tac Toe grid
  stroke(0);
  strokeWeight(2);
  for (int i = 1; i < 3; i++) {
    // Draw horizontal lines
    line(0, i * cellHeight, width, i * cellHeight);
    // Draw vertical lines
    line(i * cellWidth, 0, i * cellWidth, height);
  }

  // Draw X and O based on the current state of the game board
  for (int row = 0; row < 3; row++) {
    for (int col = 0; col < 3; col++) {
      if (gameBoard[row][col] == 1) {
        // Draw X for computer
        drawX(col * cellWidth, row * cellHeight, cellWidth, cellHeight);
      } else if (gameBoard[row][col] == 2) {
        // Draw O for player
        drawO(col * cellWidth, row * cellHeight, cellWidth, cellHeight);
      }
    }
  }
}
