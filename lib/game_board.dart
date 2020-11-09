class GameBoard {
  int width;

  int height;

  List board;

  GameBoard(width, height) {
    this.width = width;
    this.height = height;
    this._createBoard();
  }

  void _createBoard() {
    this.board = new List.generate(this.height, (i) => List(this.width),
        growable: false);

    for (var row = 0; row < board.length; row++) {
      for (var col = 0; col < board[row].length; col++) {
        board[row][col] = '.';
      }
    }
  }

  void updateBoard(int playerSlot, int cpuSlot) {
    bool placedPiece = false;
    bool placedCpuPiece = false;

    for (var i = this.height - 1; i > 0; i--) {
      if (this.board[i][playerSlot] == '.' && placedPiece == false) {
        this.board[i][playerSlot] = 'X';
        placedPiece = true;
      }
      if (this.board[i][cpuSlot] == '.' && placedCpuPiece == false) {
        this.board[i][cpuSlot] = 'O';
        placedCpuPiece = true;
      }

      if (placedPiece == true && placedCpuPiece == true) {
        return;
      }
    }
  }

  void highlightWinner(var winPos) {
    for (var i = 0; i < winPos.length; i += 2) {
      int col = int.parse(winPos[i]);
      int row = winPos[i + 1];

      this.board[row][col] = 'W';
    }
  }
}
