/// Class that has the info of the game board.
class GameBoard {
  /// The width of the board.
  int width;

  /// The height of the board.
  int height;

  /// The board represented as a 2D list.
  List board;

  GameBoard(width, height) {
    this.width = width;
    this.height = height;
    this._createBoard();
  }

  /// Creates a board (a 2D list filled with '.').
  void _createBoard() {
    this.board = new List.generate(this.height, (i) => List(this.width),
        growable: false);

    for (var row = 0; row < board.length; row++) {
      for (var col = 0; col < board[row].length; col++) {
        board[row][col] = '.';
      }
    }
  }

  /// Updates the board with the given moves of the player and cpu.
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

  /// Highlights the winning pieces on the board.
  void highlightWinner(var winPos) {
    for (var i = 0; i < winPos.length; i += 2) {
      // This was a little weird. winPos is a list of numbers, with index i being the row, and index i + 1 being the column of winning pieces.
      // So I go by twos getting the row and col to get which pieces won.
      int col = int.parse(winPos[i]);
      int row = winPos[i + 1];

      this.board[row][col] = 'W';
    }
  }
}
