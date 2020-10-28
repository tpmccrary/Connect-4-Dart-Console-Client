import 'dart:convert';
import 'package:http/http.dart' as http;

/// Static class that takes care of network functions.
class NetworkHandler {
  /// Get the http info from the given url. Else use the default url.
  static Future<dynamic> getServerInfo(
      String givenUrl, String defaultUrl) async {
    var httpResponse;
    try {
      print('Getting server information...');
      httpResponse = await http.get(givenUrl + '/info/');
    } catch (e) {
      print('Using default URL...');
      httpResponse = await http.get(defaultUrl + '/info/');
    }

    try {
      return json.decode(httpResponse.body) as Map;
    } on FormatException {
      print('Invalid Connect 4 URL.');
      print('Using default URL...');
      httpResponse = await http.get(defaultUrl + '/info/');
      return json.decode(httpResponse.body) as Map;
    }
  }
}
