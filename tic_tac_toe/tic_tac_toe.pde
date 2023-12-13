int[][] gameBoard;
boolean gameOver = false;

void setup() {
  size(500, 500);
  print("Welcome to Tic-Tac-Toe!");
  
 gameBoard = new int[BOARD_SIZE][BOARD_SIZE];  //Representing the Tic Tac Toe board

  // Computer moves first (playing 'X')
  computerMove();
  checkGameOver();
  
  print("Press a numeric key (0-8) to make your move.");
}

void draw() {
  background(255);
  drawBoard();
}

void keyPressed() {
  if (!gameOver && key >= '0' && key <= '8') {
    int index = key - '0';
    int row = index / BOARD_SIZE;
    int col = index % BOARD_SIZE;

    if (gameBoard[row][col] == EMPTY) {
      gameBoard[row][col] = PLAYER_O; // User's move (circle)
      checkGameOver();
      if (!gameOver) {
        computerMove(); // Computer's move (X)
        checkGameOver();
      }
    } else {
      print("Invalid move. The square is already taken.\n");
    }
  } else if (!gameOver) {
    print(INVALID_KEY_MESSAGE + "\n");
  } else {
    print(GAME_OVER_MESSAGE + "\n");
  }
}

void mousePressed() {
  if (!gameOver) {
    int row = floor(mouseX / CELL_SIZE);
    int col = floor(mouseY / CELL_SIZE);

    if (gameBoard[row][col] == EMPTY) {
      // Player's move
      gameBoard[row][col] = PLAYER_O; 
      checkGameOver();
      if (!gameOver) {
        computerMove(); // Computer's move (X)
        checkGameOver();
      }
    }
  }
}

void computerMove() {
  int emptyCells = 0;
  for (int rowIndex = 0; rowIndex < BOARD_SIZE; rowIndex++) {
    for (int colIndex = 0; colIndex < BOARD_SIZE; colIndex++) {
      if (gameBoard[rowIndex][colIndex] == EMPTY) {
        emptyCells++;
      }
    }
  }
  if (emptyCells > 0) {
    int randomIndex = int(random(emptyCells));
    emptyCells = 0;
    for (int rowIndex = 0; rowIndex < BOARD_SIZE; rowIndex++) {
      for (int colIndex = 0; colIndex < BOARD_SIZE; colIndex++) {
        if (gameBoard[rowIndex][colIndex] == EMPTY) {
          if (emptyCells == randomIndex) {
            // Computer's move
            gameBoard[rowIndex][colIndex] = PLAYER_X;
            return;
          }
          emptyCells++;
        }
      }
    }
  }
}

void checkGameOver() {
  // Check if the game is over (win or tie)
  if (checkWinner(gameBoard, PLAYER_X) || checkWinner(gameBoard, PLAYER_O) || isBoardFull(gameBoard)) {
    gameOver = true;
    
 if (checkWinner(gameBoard, PLAYER_X)) {
     print(PLAYER_X_WON_MESSAGE + " " + GAME_OVER_MESSAGE + "\n");
    } else if (checkWinner(gameBoard, PLAYER_O)) {
      print(PLAYER_O_WON_MESSAGE + " " + GAME_OVER_MESSAGE + "\n");
    } else {
      print(NO_ONE_WON_MESSAGE + " " + GAME_OVER_MESSAGE + "\n");
    }
  }
}

boolean checkWinner(int[][] board, int player) {
  // Check rows
  for (int row = 0; row < BOARD_SIZE; row++) {
    if (board[row][0] == player && board[row][1] == player && board[row][2] == player) {
      return true;
    }
  }

  // Check columns
  for (int col = 0; col < BOARD_SIZE; col++) {
    if (board[0][col] == player && board[1][col] == player && board[2][col] == player) {
      return true;
    }
  }

  // Check diagonals
  if (board[0][0] == player && board[1][1] == player && board[2][2] == player) {
    return true;
  }

  if (board[0][2] == player && board[1][1] == player && board[2][0] == player) {
    return true;
  }

  return false;
}

boolean isBoardFull(int[][] board) {
  // Check for a draw
  for (int row = 0; row < BOARD_SIZE; row++) {
    for (int col = 0; col < BOARD_SIZE; col++) {
      if (board[row][col] == EMPTY) {
        return false;
      }
    }
  }
  print(NO_ONE_WON_MESSAGE + " " + GAME_OVER_MESSAGE + "\n");
  return true;
}
