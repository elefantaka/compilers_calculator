import 'package:calculator/parser.dart';

class Calculator {
  final Parser parser = Parser();
  final tokensAndOperators = RegExp(r'[*/]?[-+]?\d+');

  String calculateResult(String input) {
    var parsedInput = parser.parse(input);
    print('ParsedInput: $parsedInput');
    var extractedInput = extractBrackets(parsedInput);
    return evaluate(extractedInput);
  }

  String extractBrackets(String input) {
    for (var start = input.lastIndexOf('('); start != -1; start = input.lastIndexOf('(')) {
      var end = input.indexOf(')', start);
      input = input.replaceRange(start, end + 1, evaluate(input.substring(start, end + 1)));
      input = input.replaceAll('--', '+');
      input = input.replaceAll('+-', '-');
      print('transformed: $input');
    }
    return input;
  }

  String evaluate(String input) {
    print('Evaluating: $input');
    var values = <int>[];
    tokensAndOperators.allMatches(input).forEach((element) {
      var s = input.substring(element.start, element.end);
      switch (s[0]) {
        case '*':
          var r = int.parse(s.substring(1));
          values[values.length - 1] = values.last * r;
          break;
        case '/':
          var r = int.parse(s.substring(1));
          if (r == 0) {
            throw Exception('cannot divide by 0!');
          }
          values[values.length - 1] = (values.last / r).round();
          break;
        default:
          values.add(int.parse(s));
      }
    });

    return values.reduce((value, element) => value + element).toString();
  }
}
