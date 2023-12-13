int[][] board = new int[BOARD_SIZE][BOARD_SIZE];

void initializeBoard() {
  for (int row = 0; row < BOARD_SIZE; row++) {
    for (int col = 0; col < BOARD_SIZE; col++) {
      gameBoard[row][col] = EMPTY;
    }
  }
}

void makeMove(int row, int col, int player) {
  board[row][col] = player;
}

boolean checkWin(int player) {
  // Implement the win check logic (rows, columns, diagonals)
}

boolean isBoardFull() {
  for (int i = 0; i < BOARD_SIZE; i++) {
    for (int j = 0; j < BOARD_SIZE; j++) {
      if (board[i][j] == EMPTY) {
        return false; // There's an empty square
      }
    }
  }
  return true;
}
