int[][] board = new int[3][3];  // 3x3 array representing the Tic Tac Toe board
int currentPlayer = PLAYER_X;  // Player X starts

void setup() {
  size(500, 500);
  // Computer makes the first move
  makeComputerMove();
}

void draw() {
  background(255);
  drawTicTacToeBoard();
   displayBoard();
}

void keyPressed() {
  if (key >= '0' && key <= '8') {
    int cell = int(key) - '0';
    int row = cell / BOARD_SIZE;
    int col = cell % BOARD_SIZE;
    
    if (board[row][col] == EMPTY) {
      makeMove(row, col, currentPlayer);
      switchPlayer();
      checkGameStatus();
    } else {
      println("Cell already occupied. Try again.");
    }
  } else {
    println(INVALID_KEY_MESSAGE);
  }
}

void drawTicTacToeBoard() {
  // Draw vertical lines
  line(CELL_SIZE, 0, CELL_SIZE, height);
  line(2 * CELL_SIZE, 0, 2 * CELL_SIZE, height);
  
  // Draw horizontal lines
  line(0, CELL_SIZE, width, CELL_SIZE);
  line(0, 2 * CELL_SIZE, width, 2 * CELL_SIZE);
}

void displayBoard() {
  for (int i = 0; i < BOARD_SIZE; i++) {
    for (int j = 0; j < BOARD_SIZE; j++) {
      float x = j * CELL_SIZE;
      float y = i * CELL_SIZE;

      if (board[i][j] == PLAYER_X) {
        drawX(x, y, CELL_SIZE);
      } else if (board[i][j] == PLAYER_O) {
        drawEllipse(x, y, CELL_SIZE);
      }
    }
  }
}

void makeMove(int row, int col, int player) {
  board[row][col] = player;
}

void switchPlayer() {
  currentPlayer = (currentPlayer == PLAYER_X) ? PLAYER_O : PLAYER_X;
}

void checkGameStatus() {
  // Check for a win
  if (checkWin(PLAYER_X)) {
    print(PLAYER_X_WON_MESSAGE);
    gameOver();
  } else if (checkWin(PLAYER_O)) {
    print(PLAYER_O_WON_MESSAGE);
    gameOver();
  } else if (isBoardFull()) {
    // Check for a draw
    print(NO_ONE_WON_MESSAGE);
    gameOver();
  } else {
    // Game is still in progress
    print(GAME_IN_PROGRESS_MESSAGE);
  }
  println();  // Move to the next line for clarity
}

void gameOver() {
  // Additional game-over logic can be added here if needed
  println(GAME_OVER_MESSAGE);
  noLoop();  // Stop the game loop
}

boolean isBoardFull() {
  // Check if the board is full (a draw)
  for (int i = 0; i < BOARD_SIZE; i++) {
    for (int j = 0; j < BOARD_SIZE; j++) {
      if (board[i][j] == EMPTY) {
        return false;  // There's an empty cell
      }
    }
  }
  return true;  // The board is full
}
