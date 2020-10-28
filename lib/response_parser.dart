import 'dart:convert';

/// Static class that parses json info.
class ResponseParser {
  static Map parseInfo(var httpResponse) {
    // Try to parse the info and return it as a map.
    try {
      return json.decode(httpResponse.body) as Map;
      // If formated correctly, return null.
    } on FormatException {
      print('Invalid Connect 4 URL.');
      print('Using default URL...');
      return null;
    }
  }
}
