// Author: Timothy P. McCrary

import 'package:http/http.dart' as http;
import 'package:c4_app/response_parser.dart';
import 'response_parser.dart';

/// Static class that takes care of network functions.
class NetworkHandler {
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

  /// Creates a new game from the server and returns the game info.
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

  /// Makes a play and returns the play info.
  static Future<Map> makePlay(
      String pid, int move, String givenUrl, String defaultUrl) async {
    var httpResponse;
    // Try and get the info from the server.
    try {
      httpResponse = await http
          .get(givenUrl + '/play/?pid=' + pid + '&move=' + move.toString());
    } catch (e) {
      // If not use the default url.
      httpResponse = await http
          .get(defaultUrl + '/play/?pid=' + pid + '&move=' + move.toString());
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
}
