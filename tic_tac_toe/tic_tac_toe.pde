boolean userTurn = true;

void setup() {
  size(500, 500);
  setupBoard();
  makeComputerMove(); // Computer goes first
  drawBoard();
}

void draw() {
  background (255);
}

void makeComputerMove() {
  int computerMove = int(random(BOARD_SIZE * BOARD_SIZE));
  while (!isSquareEmpty(computerMove / BOARD_SIZE, computerMove % BOARD_SIZE)) {
    computerMove = int(random(BOARD_SIZE * BOARD_SIZE));
  }
  makeMove(computerMove / BOARD_SIZE, computerMove % BOARD_SIZE, PLAYER_X);
  userTurn = true; // After computer's move, it's user's turn
}

void keyPressed() {
  if (gameInProgress && userTurn) {
    int index = key - '0';
    if (index >= 0 && index < BOARD_SIZE * BOARD_SIZE && isSquareEmpty(index / BOARD_SIZE, index % BOARD_SIZE)) {
      makeMove(index / BOARD_SIZE, index % BOARD_SIZE, PLAYER_O);
      drawBoard();

      if (checkWin(PLAYER_O) || isBoardFull()) {
        println(PLAYER_O_WON_MESSAGE);
        gameInProgress = false;
      } else {
        userTurn = false; // Computer's turn
        makeComputerMove();
        drawBoard();

        if (checkWin(PLAYER_X) || isBoardFull()) {
          println(PLAYER_X_WON_MESSAGE);
          gameInProgress = false;
        }
      }
    } else {
      println(INVALID_KEY_MESSAGE);
    }
  } else {
    println(GAME_OVER_MESSAGE);
  }
}

void drawBoard() {
  background(255);
  // Draw the tic-tac-toe grid
  for (int i = 1; i < BOARD_SIZE; i++) {
    float x = i * width / BOARD_SIZE;
    line(x, 0, x, height);
    line(0, i * height / BOARD_SIZE, width, i * height / BOARD_SIZE);
  }

  // Draw the X and O on the board based on the game state
  for (int i = 0; i < BOARD_SIZE; i++) {
    for (int j = 0; j < BOARD_SIZE; j++) {
      float x = j * width / BOARD_SIZE;
      float y = i * height / BOARD_SIZE;

      if (board[i][j] == PLAYER_X) {
        drawX(x, y);
      } else if (board[i][j] == PLAYER_O) {
        drawO(x, y);
      }
    }
  }
}
