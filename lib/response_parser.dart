import 'dart:convert';

class ResponseParser {
  static dynamic parseInfo(var httpResponse) {
    try {
      return json.decode(httpResponse.body) as Map;
    } on FormatException {
      print('Invalid Connect 4 URL.');
      print('Using default URL...');
      // httpResponse = await http.get(defaultUrl + '/info/');
      return json.decode(httpResponse.body) as Map;
    }
  }
}
