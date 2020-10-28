/// Class to hold the server info (e.g. URL, JSON info, strategies)
class C4ServerInfo {
  /// The default URL to the connect 4 server.
  final String _defaultUrl =
      'https://cssrvlab01.utep.edu/Classes/cs3360/tpmccrary/C4Service/src';

  /// The URL given from the user.
  String _givenUrl;

  /// The JSON info taken from the server as a Map.
  Map _info;

  /// A list of all the strategies available.
  List<String> _strategies = new List<String>();

  /// The strategy selected by the user, starting form index 0.
  int _selectedStrategy;

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

  /// Given an int, stores it to be used later as an index for the strategies.
  bool setSelectedStrategy(int selectedStratNum) {
    selectedStratNum--;

    if (selectedStratNum > -1 && selectedStratNum < _strategies.length) {
      _selectedStrategy = selectedStratNum;
      return true;
    } else {
      return false;
    }
  }
}
