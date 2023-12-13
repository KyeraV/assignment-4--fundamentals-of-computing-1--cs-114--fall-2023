void drawBoard() {
  float cellWidth = width / BOARD_SIZE;
  float cellHeight = height / BOARD_SIZE;

  // Draw the Tic Tac Toe grid
  for (int lineIndex = 1; lineIndex < BOARD_SIZE; lineIndex++) {
    // Draw horizontal lines
    line(0, lineIndex * CELL_SIZE, width, lineIndex * CELL_SIZE);
    // Draw vertical lines
    line(lineIndex * CELL_SIZE, 0, lineIndex * CELL_SIZE, height);
  }

  // Draw X and O based on the current state of the game board
  for (int row = 0; row < BOARD_SIZE; row++) {
    for (int col = 0; col < BOARD_SIZE; col++) {
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
