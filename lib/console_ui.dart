// Author: Timothy P. McCrary

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

  /// Tells the user a game is being created.
  static void creatingNewGame() {
    print('Creating a new game...');
  }

  /// Displays the game board to the user, along with what slot they chose.
  static void displayBoard(List board, int slot) {
    // Displays the board itself.
    for (var row = 0; row < board.length; row++) {
      for (var col = 0; col < board[row].length; col++) {
        stdout.write(board[row][col] + '  ');
      }
      stdout.write('\n');
    }

    // Displays numbers under board.
    for (var row = 0; row < board.length + 1; row++) {
      stdout.write('${row + 1}  ');
    }

    stdout.write('\n');

    if (slot != null) {
      for (var row = 0; row < board.length; row++) {
        if (slot == row) {
          stdout.write('*');
          break;
        } else {
          stdout.write('   ');
        }
      }
      stdout.write('\n');
    }
  }

  /// Asks user to make a move and returns the slot they chose.
  static int requestMove(int width) {
    print('Select a slot (1 - ${width}):');

    int slot = int.parse(stdin.readLineSync());

    if (slot < 1 || slot > width) {
      print('Not a valid slot.');
      return requestMove(width);
    } else {
      return slot - 1;
    }
  }

  /// Tells the user who won.
  static void acknowledgeWinner(
      bool isWin, bool isCpuWin, bool isDraw, bool isCpuDraw) {
    if (isWin == true) {
      print('You won, well done!!');
    } else if (isCpuWin == true) {
      print('You lost, better luck next time!');
    } else if (isDraw == true || isCpuDraw == true) {
      print('It\'s a draw!');
    } else {
      print('????');
    }
  }
}
