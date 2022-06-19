class Parser {
  final statementValidator = RegExp(r'[^+\-*\/0-9()]|[+\-*\/][+\/*]|\)[^+\-*\/\(\)]|\(\)');
  final bracketMultiplication = RegExp(r'(\d+)\(');
  final bracketOpen = RegExp(r'\(');
  final bracketClosed = RegExp(r'\)');

  String parse(String input) {
    if (input.startsWith(RegExp(r'[\*\)\/]')) || statementValidator.hasMatch(input)) {
      throw Exception('syntax error');
    }

    var newBracketsOpen = bracketOpen.allMatches(input).toList();
    var newBracketsClosed = bracketClosed.allMatches(input).toList();
    if (newBracketsClosed.length != newBracketsOpen.length) {
      throw Exception('brackets count mismatch');
    }
    for (var i = 0; i < newBracketsOpen.length; i++) {
      if (newBracketsClosed[i].start - newBracketsOpen[i].start < 1) {
        throw Exception('brackets are not closed');
      }
    }

    return fillMultiplication(input);
  }

  String fillMultiplication(String input) {
    input = input.replaceAllMapped(bracketMultiplication, (Match m) => '${m.group(1)}*(');
    input = input.replaceAll(')(', ')*(');

    return input;
  }
}
