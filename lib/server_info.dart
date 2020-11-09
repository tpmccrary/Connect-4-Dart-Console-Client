// Author: Timothy P. McCrary

/// Class to hold the server info (e.g. URL, JSON info, strategies)
class ServerInfo {
  /// The default URL to the connect 4 server.
  final String _defaultUrl =
      'https://cssrvlab01.utep.edu/Classes/cs3360/tpmccrary/C4Service/src';

  /// The URL given from the user.
  String _givenUrl;

  /// The JSON info taken from the server as a Map.
  Map _info;

  /// A list of all the strategies available.
  List<String> _strategies = new List<String>();

  int boardWidth;
  int boardHeight;

  // START Setters and Getters

  /// The default URL that the app will try to connect to.
  String get defaultUrl {
    return _defaultUrl;
  }

  /// The URL given from the user.
  String get givenUrl {
    return _givenUrl;
  }

  /// The URL given from the user.
  void set givenUrl(String givenUrl) {
    this._givenUrl = givenUrl;
  }

  /// The JSON info taken from the server as a Map.
  Map get info {
    return _info;
  }

  /// The JSON info taken from the server as a Map.
  void set info(Map info) {
    this._info = info;
  }

  /// A list of all the strategies available.
  List<String> get strategies {
    return _strategies;
  }

  /// A list of all the strategies available.
  void set strategies(List<String> strategies) {
    this._strategies = strategies;
  }

  // END Setters and Getters

  /// Given the JSON info as a Map, grab the the available strategis and store them.
  void storeStrategies(Map info) {
    List strategiesList = info['strategies'] as List;

    for (var i = 0; i < strategiesList.length; i++) {
      String strategy = strategiesList[i];

      _strategies.add(strategy);
    }
  }

  /// Stores the info about the game board.
  void storeBoardInfo(Map info) {
    this.boardWidth = info['width'];
    this.boardHeight = info['height'];
  }
}
