import 'package:c4_app/game_board.dart';

/// Class that holds all the info about the current game.
class GameInfo {
  /// The board of the game.
  GameBoard gameBoard;

  /// The strategy being used on the game.
  String selectedStrat;

  /// The pid to access the game.
  String pid;

  /// The move the player made.
  int playerMove;

  /// The info about a game play returned from server.
  Map playInfo;

  GameInfo(selectedStrat, gameBoard, pid) {
    this.selectedStrat = selectedStrat;
    this.gameBoard = gameBoard;
    this.pid = pid;
  }
}
