import 'package:up_down_app/utilities/tokenizing.dart';

/// Stems tokens using the Porter Stemming Algorithm
class Stemmer {
  // Porter Stemming Algorithm
  static String stem(String token) {
    token = token.toLowerCase();
    token = step1a(token);
    token = step1b(token);
    token = step1c(token);
    token = step2(token);
    token = step3(token);
    token = step4(token);
    token = step5a(token);
    token = step5b(token);
    return token;
  }

  // Step 1a
  static String step1a(String token) {
    if (token.endsWith("sses")) {
      token = token.substring(0, token.length - 2);
    } else if (token.endsWith("ies")) {
      token = token.substring(0, token.length - 2);
    } else if (token.endsWith("ss")) {
      token = token;
    } else if (token.endsWith("s")) {
      token = token.substring(0, token.length - 1);
    }
    return token;
  }

  // Step 1b
 static String step1b(String token) {
    if (token.endsWith("eed")) {
      if (measure(token.substring(0, token.length - 3)) > 0) {
        token = token.substring(0, token.length - 1);
      }
    } else if (token.endsWith("ed")) {
      if (Tokenizing.containsVowel(token)) {
        token = token.substring(0, token.length - 2);
        token = step1bHelper(token);
      }
    } else if (token.endsWith("ing")) {
      if (Tokenizing.containsVowel(token)) {
        token = token.substring(0, token.length - 3);
        token = step1bHelper(token);
      }
    }
    return token;
  }

  // Step 1b helper
  static String step1bHelper(String token) {
    if (token.endsWith("at") ||
        token.endsWith("bl") ||
        token.endsWith("iz")) {
      token = "${token}e";
    } else if (Tokenizing.endsWithDoubleConsonant(token) &&
        !token.endsWith("l") &&
        !token.endsWith("s") &&
        !token.endsWith("z")) {
      token = token.substring(0, token.length - 1);
    } else if (measure(token) == 1 && Tokenizing.endsWithCVC(token)) {
      token = "${token}e";
    }
    return token;
  }

  // Step 1
  static String step1c(String token) {
    if (token.endsWith("y")) {
      if (Tokenizing.containsVowel(token)) {
        token = "${token.substring(0, token.length - 1)}i";
      }
    }
    return token;
  }

  // Step 2
  static String step2(String token) {
    if (token.endsWith("ational")) {
      if (measure(token.substring(0, token.length - 5)) > 0) {
        token = "${token.substring(0, token.length - 5)}e";
      }
    } else if (token.endsWith("tional")) {
      if (measure(token.substring(0, token.length - 2)) > 0) {
        token = token.substring(0, token.length - 2);
      }
    } else if (token.endsWith("enci")) {
      if (measure(token.substring(0, token.length - 2)) > 0) {
        token = "${token.substring(0, token.length - 2)}e";
      }
    } else if (token.endsWith("anci")) {
      if (measure(token.substring(0, token.length - 2)) > 0) {
        token = "${token.substring(0, token.length - 2)}e";
      }
    } else if (token.endsWith("izer")) {
      if (measure(token.substring(0, token.length - 2)) > 0) {
        token = token.substring(0, token.length - 2);
      }
    } else if (token.endsWith("abli")) {
      if (measure(token.substring(0, token.length - 2)) > 0) {
        token = "${token.substring(0, token.length - 2)}e";
      }
    } else if (token.endsWith("alli")) {
      if (measure(token.substring(0, token.length - 2)) > 0) {
        token = token.substring(0, token.length - 2);
      }
    } else if (token.endsWith("entli")) {
      if (measure(token.substring(0, token.length - 2)) > 0) {
        token = token.substring(0, token.length - 2);
      }
    } else if (token.endsWith("eli")) {
      if (measure(token.substring(0, token.length - 2)) > 0) {
        token = token.substring(0, token.length - 2);
      }
    } else if (token.endsWith("ousli")) {
      if (measure(token.substring(0, token.length - 2)) > 0) {
        token = token.substring(0, token.length - 2);
      }
    }
    return token;
  }

  // Step 3
  static String step3(String token) {
    if (token.endsWith("ization")) {
      if (measure(token.substring(0, token.length - 5)) > 0) {
        token = "${token.substring(0, token.length - 5)}e";
      }
    } else if (token.endsWith("ation")) {
      if (measure(token.substring(0, token.length - 3)) > 0) {
        token = "${token.substring(0, token.length - 3)}e";
      }
    } else if (token.endsWith("ator")) {
      if (measure(token.substring(0, token.length - 2)) > 0) {
        token = "${token.substring(0, token.length - 2)}e";
      }
    } else if (token.endsWith("alism")) {
      if (measure(token.substring(0, token.length - 3)) > 0) {
        token = token.substring(0, token.length - 3);
      }
    } else if (token.endsWith("iveness")) {
      if (measure(token.substring(0, token.length - 4)) > 0) {
        token = token.substring(0, token.length - 4);
      }
    } else if (token.endsWith("fulness")) {
      if (measure(token.substring(0, token.length - 4)) > 0) {
        token = token.substring(0, token.length - 4);
      }
    } else if (token.endsWith("ousness")) {
      if (measure(token.substring(0, token.length - 4)) > 0) {
        token = token.substring(0, token.length - 4);
      }
    } else if (token.endsWith("aliti")) {
      if (measure(token.substring(0, token.length - 3)) > 0) {
        token = token.substring(0, token.length - 3);
      }
    } else if (token.endsWith("iviti")) {
      if (measure(token.substring(0, token.length - 3)) > 0) {
        token = "${token.substring(0, token.length - 3)}e";
      }
    } else if (token.endsWith("biliti")) {
      if (measure(token.substring(0, token.length - 5)) > 0) {
        token = "${token.substring(0, token.length - 5)}le";
      }
    }
    return token;
  }

  // Step 4
  static String step4(String token) {
    if (token.endsWith("icate")) {
      if (measure(token.substring(0, token.length - 3)) > 0) {
        token = token.substring(0, token.length - 3);
      }
    } else if (token.endsWith("ative")) {
      if (measure(token.substring(0, token.length - 5)) > 0) {
        token = token.substring(0, token.length - 5);
      }
    } else if (token.endsWith("alize")) {
      if (measure(token.substring(0, token.length - 3)) > 0) {
        token = token.substring(0, token.length - 3);
      }
    } else if (token.endsWith("iciti")) {
      if (measure(token.substring(0, token.length - 3)) > 0) {
        token = token.substring(0, token.length - 3);
      }
    } else if (token.endsWith("ical")) {
      if (measure(token.substring(0, token.length - 2)) > 0) {
        token = token.substring(0, token.length - 2);
      }
    } else if (token.endsWith("ful")) {
      if (measure(token.substring(0, token.length - 3)) > 0) {
        token = token.substring(0, token.length - 3);
      }
    } else if (token.endsWith("ness")) {
      if (measure(token.substring(0, token.length - 4)) > 0) {
        token = token.substring(0, token.length - 4);
      }
    }
    return token;
  }

  // Step 5a
  static String step5a(String token) {
    if (token.endsWith("e")) {
      if (measure(token.substring(0, token.length - 1)) > 1) {
        token = token.substring(0, token.length - 1);
      } else if (measure(token.substring(0, token.length - 1)) == 1 &&
          !Tokenizing.endsWithCVC(token)) {
        token = token.substring(0, token.length - 1);
      }
    }
    return token;
  }

  // Step 5b
  static String step5b(String token) {
    if (measure(token) > 1 && Tokenizing.endsWithDoubleConsonant(token) &&
        token.endsWith("l")) {
      token = token.substring(0, token.length - 1);
    }
    return token;
  }

  // Measure
  static int measure(String token) {
    int count = 0;
    bool vowel = false;
    for (int i = 0; i < token.length; i++) {
      if (Tokenizing.isVowel(token, i)) {
        vowel = true;
      } else if (vowel) {
        count++;
        vowel = false;
      }
    }
    return count;
  }
}