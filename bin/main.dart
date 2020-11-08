import 'package:c4_app/network_handler.dart';
import 'package:c4_app/server_info.dart';
import 'package:c4_app/console_ui.dart';

Future<void> main(List<String> arguments) async {
  // Create new object to store the game/server info.
  C4ServerInfo serverInfo = new C4ServerInfo();

  // Get a URL form the user.
  serverInfo.givenUrl = ConsoleUi.requestUrl(serverInfo.defaultUrl);

  // Request info from server using given url, or if thats invalid from the default.
  serverInfo.info = await NetworkHandler.getServerInfo(
      serverInfo.givenUrl, serverInfo.defaultUrl);

  // Stores all the strategies given from the server.
  serverInfo.storeStrategies(serverInfo.info);

  // Request which strategy user wants to use and store their option.
  String selectedStrat = ConsoleUi.requestStrategy(serverInfo.strategies);

  // Tell the user a new game is being created.
  ConsoleUi.creatingNewGame();

  // Create a new game from the server with given info.
  Map newGameInfo = await NetworkHandler.createNewGame(
      selectedStrat, serverInfo.givenUrl, serverInfo.defaultUrl);

  // Creates a new game object to store all the game info.
}
