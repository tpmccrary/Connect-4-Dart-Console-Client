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
}
