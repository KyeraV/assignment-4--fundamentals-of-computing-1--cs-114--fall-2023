boolean isX = true;  // Variable to alternate between X and O
char[] board = new char[9];  // Array to represent the Tic-Tac-Toe board

void setup() {
  size(500, 500);
   // Computer makes the first move
  makeComputerMove();
}

void draw() {
  background (255);
  drawTicTacToeBoard();
}

void makeComputerMove() {
  int emptySquare = -1;
  while (emptySquare == -1) {
    int randomIndex = int(random(9));
    if (board[randomIndex] == ' ') {
      emptySquare = randomIndex;
    }
  }

void keyPressed() {
  // Check if the pressed key is a numeric key between 0 and 8
  int keyIndex = -1;
  if (key >= '0' && key <= '8') {
    keyIndex = int(key - '0');
  }
  
  // If a valid numeric key is pressed and the corresponding square is empty, make a move
  if (keyIndex != -1 && board[keyIndex] == 0) {
    if (isX) {
      board[keyIndex] = 'X';
    } else {
      board[keyIndex] = 'O';
    }
    isX = !isX;  // Switch to the other player's turn
  }
}
