import 'package:http/http.dart' as http;
import 'package:c4_app/response_parser.dart';
import 'response_parser.dart';

/// Static class that takes care of network functions.
class NetworkHandler {
  // TODO: Use these somehow later.
  static final String infoDirectory = '/info/';
  static final String newDirectory = '/new/';
  static final String playDirectory = '/play/';

  /// Get the http info from the given url. Else use the default url.
  static Future<dynamic> getServerInfo(
      String givenUrl, String defaultUrl) async {
    var httpResponse;
    // Try and get the info from the server.
    try {
      print('Getting server information...');
      httpResponse = await http.get(givenUrl + '/info/');
    } catch (e) {
      // If not use the default url.
      print('Using default URL...');
      httpResponse = await http.get(defaultUrl + '/info/');
    }

    // Parse the info from the server and get a map.
    Map jsonMap = ResponseParser.parseInfo(httpResponse);

    // If null, then the website contents was not in the right format.
    // Trys again using the defaultUrl.
    if (jsonMap == null) {
      jsonMap = await getServerInfo(defaultUrl, defaultUrl);
    }

    return jsonMap;
  }

  static Future<dynamic> createNewGame(
      String strat, String givenUrl, String defaultUrl) async {
    var httpResponse;

    // Try and connect to server/website.
    try {
      httpResponse = await http.get(givenUrl + '/new/?strategy=' + strat);
    } catch (e) {
      httpResponse = await http.get(defaultUrl + '/new/?strategy=' + strat);
    }

    Map jsonMap = ResponseParser.parseInfo(httpResponse);

    // If null, then the website contents was not in the right format.
    // Try again usng the default url.
    if (jsonMap == null) {
      jsonMap = await getServerInfo(defaultUrl, defaultUrl);
    }

    return jsonMap;
  }
}
