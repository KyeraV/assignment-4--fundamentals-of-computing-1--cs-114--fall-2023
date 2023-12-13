boolean isX = true;  // Variable to alternate between X and O
char[] board = new char[9];  // Array to represent the Tic-Tac-Toe board
boolean gameOver = false;  // Flag to track if the game is over

void setup() {
  size(500, 500);
   // Computer makes the first move
  makeComputerMove();
}

void draw() {
  background (255);
  drawTicTacToeBoard();
  
  // Check for a win or a draw
  if (!gameOver) {
    if (checkForWin('X')) {
      drawResult("Computer wins!");
      gameOver = true;
    } else if (checkForWin('O')) {
      drawResult("Player wins!");
      gameOver = true;
    } else if (checkForDraw()) {
      drawResult("It's a draw!");
      gameOver = true;
   } else {
      print("The game is still in play.");
    }
  } else {
    print("The game has ended.");
  }
}

void makeComputerMove() {
  int emptySquare = -1;
  while (emptySquare == -1) {
    int randomIndex = int(random(9));
    if (board[randomIndex] == ' ') {
      emptySquare = randomIndex;
    }
  }
   // Make the computer's move (always X)
  board[emptySquare] = 'X';
  isX = false;  // Switch to the player's turn
}

void keyPressed() {
  // If the game is not over and the pressed key is a numeric key between 0 and 8, make a move
  if (!gameOver && key >= '0' && key <= '8') {
    int keyIndex = int(key - '0');
    
    // If the corresponding square is empty, make a move
    if (board[keyIndex] == ' ') {
      board[keyIndex] = 'O';
      
      // Check for a win or a draw
      if (checkForWin('O')) {
        drawResult("Player wins!");
        gameOver = true;
      } else if (checkForDraw()) {
        drawResult("It's a draw!");
        gameOver = true;
      } else {
        isX = true;  // Switch to the computer's turn
        makeComputerMove();
      }
    } else {
      print("You pressed an incorrect key. Please choose an empty square (0-8).");
    }
  } else {
    print("The game has ended.");
  }
}
  
void drawResult(String result) {
  textSize(32);
  fill(0);
  textAlign(CENTER, CENTER);
  text(result, width / 2, height / 2);
}
