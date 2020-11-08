import 'dart:io';

/// Static class responsible for communicating and recieving info from the user.
class ConsoleUi {
  /// Asks users for a URL.
  static String requestUrl(String defaultUrl) {
    print(
        'Enter the server URL [default: ${defaultUrl}] (enter nothing for default):');

    return stdin.readLineSync();
  }

  /// Asks users to select strategy.
  static String requestStrategy(List<String> strategies) {
    print('Enter number for desired strategy (default: 1):');

    for (var i = 0; i < strategies.length; i++) {
      String strategy = strategies[i];

      print(' ${i + 1}. $strategy');
    }

    try {
      // Get input as int.
      int choice = int.parse(stdin.readLineSync());
      // If choice is not in the bounds of our options, prompt the user to enter agian.
      if (choice > 0 && choice <= strategies.length) {
        print('Selected strategy: ${strategies[choice - 1]}');
        return strategies[choice - 1];
      } else {
        print('Not an available choice.');
        return requestStrategy(strategies);
      }
      // If they enter nothing or non-numbers, use the default strategy.
    } on FormatException {
      print('Using defualt strategy: ${strategies[0]}');
      return strategies[0];
    }
  }

  static void creatingNewGame() {
    print('Creating a new game...');
  }
}
