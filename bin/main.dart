import 'package:c4_app/game_board.dart';
import 'package:c4_app/game_info.dart';
import 'package:c4_app/network_handler.dart';
import 'package:c4_app/server_info.dart';
import 'package:c4_app/console_ui.dart';

Future<void> main(List<String> arguments) async {
  // Create new object to store the game/server info.
  ServerInfo serverInfo = new ServerInfo();

  // Get a URL form the user.
  serverInfo.givenUrl = ConsoleUi.requestUrl(serverInfo.defaultUrl);

  // Request info from server using given url, or if thats invalid from the default.
  serverInfo.info = await NetworkHandler.getServerInfo(
      serverInfo.givenUrl, serverInfo.defaultUrl);

  // Stores all the strategies given from the server.
  serverInfo.storeStrategies(serverInfo.info);
  serverInfo.storeBoardInfo(serverInfo.info);

  print(serverInfo.boardWidth);

  // Request which strategy user wants to use and store their option.
  String selectedStrat = ConsoleUi.requestStrategy(serverInfo.strategies);

  // Tell the user a new game is being created.
  ConsoleUi.creatingNewGame();

  // Create a new game from the server with given info.
  Map newGameInfo = await NetworkHandler.createNewGame(
      selectedStrat, serverInfo.givenUrl, serverInfo.defaultUrl);

  // Creates a new game object to store all the game info.
  GameInfo game = new GameInfo(
      selectedStrat,
      new GameBoard(serverInfo.boardWidth, serverInfo.boardHeight),
      newGameInfo['pid']);

  mainGameLoop(game, serverInfo);
}

void mainGameLoop(GameInfo game, ServerInfo serverInfo) async {
  // Flags to record if there was a win or draw.

  bool isWin = false;
  bool isCpuWin = false;
  bool isDraw = false;
  bool isCpuDraw = false;

  while (isWin == false &&
      isCpuWin == false &&
      isDraw == false &&
      isCpuDraw == false) {
    // Display the game board to the user.
    ConsoleUi.displayBoard(game.gameBoard.board, game.playerMove);

    // Request user to choose a slot to place their piece.
    game.playerMove = ConsoleUi.requestMove(game.gameBoard.width);

    // Make a play, send it to the server, and store response.
    game.playInfo = await NetworkHandler.makePlay(
        game.pid, game.playerMove, serverInfo.givenUrl, serverInfo.defaultUrl);

    // Get win or draw from server response.
    isWin = game.playInfo['ack_move']['isWin'];
    isCpuWin = game.playInfo['move']['isWin'];
    isDraw = game.playInfo['ack_move']['isDraw'];
    isCpuDraw = game.playInfo['move']['isDraw'];

    // Update game board.
    game.gameBoard.updateBoard(game.playerMove, game.playInfo['move']['slot']);
  }

  if (isWin == true) {
    game.gameBoard.highlightWinner(game.playInfo['ack_move']['row']);
  } else if (isCpuWin == true) {
    game.gameBoard.highlightWinner(game.playInfo['move']['row']);
  }

  ConsoleUi.displayBoard(game.gameBoard.board, game.playerMove);
  ConsoleUi.acknowledgeWinner(isWin, isCpuWin, isDraw, isCpuDraw);
}
