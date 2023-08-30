/// A static class that provides methods for tokenizing strings.
class Tokenizing {
  static bool endsWithCVC(String token) {
    if (token.length < 3) {
      return false;
    }
    if (!isVowel(token, token.length - 1) &&
        token[token.length - 1] != "w" &&
        token[token.length - 1] != "x" &&
        token[token.length - 1] != "y" &&
        isVowel(token, token.length - 2) &&
        !isVowel(token, token.length - 3)) {
      return true;
    }
    return false;
  }

  static bool containsVowel(String token) {
    for (int i = 0; i < token.length; i++) {
      if (isVowel(token, i)) {
        return true;
      }
    }
    return false;
  }

  static bool endsWithDoubleConsonant(String token) {
    if (token.length >= 2 &&
        token[token.length - 1] == token[token.length - 2] &&
        !isVowel(token, token.length - 1)) {
      return true;
    }
    return false;
  }

  static bool isVowel(String token, int index) {
    if (index < 0 || index >= token.length) {
      return false;
    }

    switch (token[index]) {
      case 'a':
      case 'e':
      case 'i':
      case 'o':
      case 'u':
      case 'A':
      case 'E':
      case 'I':
      case 'O':
      case 'U':
          return true;
    }

    return false;
  }
}