import 'package:c4_app/game_board.dart';

class GameInfo {
  GameBoard gameBoard;

  String selectedStrat;

  String pid;

  int playerMove;

  Map playInfo;

  GameInfo(selectedStrat, gameBoard, pid) {
    this.selectedStrat = selectedStrat;
    this.gameBoard = gameBoard;
    this.pid = pid;
  }
}
