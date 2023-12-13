int[][] gameBoard = new int[3][3];  // 3x3 array representing the Tic Tac Toe board
boolean gameOver = false;

void setup() {
  size(500, 500);
  print("Welcome to Tic-Tac-Toe!");

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
    int row = index / 3;
    int col = index % 3;

    if (gameBoard[row][col] == 0) {
      gameBoard[row][col] = 2; // User's move (circle)
      checkGameOver();
      if (!gameOver) {
        computerMove(); // Computer's move (X)
        checkGameOver();
      }
    } else {
      print("Invalid move. The square is already taken.\n");
    }
  } else if (!gameOver) {
    print("Invalid key. Please press a numeric key (0-8).\n");
  } else {
    print("The game has ended.");
  }
}

void mousePressed() {
  if (!gameOver) {
    int row = floor(mouseX / (width / 3));
    int col = floor(mouseY / (height / 3));

    if (gameBoard[row][col] == 0) {
      // Player's move
      gameBoard[row][col] = 2; // 2 represents O (circle)
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
  for (int rowIndex = 0; rowIndex < 3; rowIndex++) {
    for (int colIndex = 0; colIndex < 3; colIndex++) {
      if (gameBoard[rowIndex][colIndex] == 0) {
        emptyCells++;
      }
    }
  }
  if (emptyCells > 0) {
    int randomIndex = int(random(emptyCells));
    emptyCells = 0;
    for (int rowIndex = 0; rowIndex < 3; rowIndex++) {
      for (int colIndex = 0; colIndex < 3; colIndex++) {
        if (gameBoard[rowIndex][colIndex] == 0) {
          if (emptyCells == randomIndex) {
            // Computer's move
            gameBoard[rowIndex][colIndex] = 1; // 1 represents X
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
  if (checkWinner(gameBoard, 1) || checkWinner(gameBoard, 2) || isBoardFull(gameBoard)) {
    gameOver = true;
    
 if (checkWinner(gameBoard, 1)) {
      print("Computer wins! The game has ended.\n");
    } else if (checkWinner(gameBoard, 2)) {
      print("Player wins! The game has ended.\n");
    } else {
      print("It's a draw! No one wins. The game has ended.\n");
    }
  }
}

boolean checkWinner(int[][] board, int player) {
  // Check rows
  for (int row = 0; row < 3; row++) {
    if (board[row][0] == player && board[row][1] == player && board[row][2] == player) {
      return true;
    }
  }

  // Check columns
  for (int col = 0; col < 3; col++) {
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
  for (int row = 0; row < 3; row++) {
    for (int col = 0; col < 3; col++) {
      if (board[row][col] == 0) {
        return false;
      }
    }
  }
  print(NO_ONE_WON_MESSAGE + " " + GAME_OVER_MESSAGE + "\n");
  return true;
}
