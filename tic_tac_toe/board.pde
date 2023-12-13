// board.pde
int[][] board = new int[BOARD_SIZE][BOARD_SIZE];
boolean gameInProgress = false;

void setupBoard() {
  for (int i = 0; i < BOARD_SIZE; i++) {
    for (int j = 0; j < BOARD_SIZE; j++) {
      board[i][j] = EMPTY;
    }
  }
  gameInProgress = true;
}

boolean isSquareEmpty(int row, int col) {
  return board[row][col] == EMPTY;
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
