/// Class to hold the server info.
class C4ServerInfo {
  final String _defaultUrl =
      'https://cssrvlab01.utep.edu/Classes/cs3360/tpmccrary/C4Service/src';

  String _givenUrl;

  Map _info;

  List<String> _strategies = new List<String>();

  int _selectedStrategy;

  // START Setters and Getters

  String get defaultUrl {
    return _defaultUrl;
  }

  String get givenUrl {
    return _givenUrl;
  }

  void set givenUrl(String givenUrl) {
    this._givenUrl = givenUrl;
  }

  Map get info {
    return _info;
  }

  void set info(Map info) {
    this._info = info;
  }

  List<String> get strategies {
    return _strategies;
  }

  void set strategies(List<String> strategies) {
    this._strategies = strategies;
  }

  // END Setters and Getters

  void setStrategies(Map info) {
    List strategiesList = info['strategies'] as List;

    for (var i = 0; i < strategiesList.length; i++) {
      String strategy = strategiesList[i];

      _strategies.add(strategy);
    }
  }

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
