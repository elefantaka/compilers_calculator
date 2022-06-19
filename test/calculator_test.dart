import 'package:calculator/calculator.dart';
import 'package:test/test.dart';

void main() {
  test('Result 1', () {
    expect(Calculator().calculateResult('(2+1-8/2*(6-0)*(1-3))'), '51');
  });

  test('Result 2', () {
    expect(Calculator().calculateResult('(6-0)(1-3)'), '-12');
  });

  test('Result 3', () {
    expect(Calculator().calculateResult('-3'), '-3');
  });

  test('Result 4', () {
    expect(Calculator().calculateResult('(6-0)'), '6');
  });

  test('Result 5', () {
    expect(Calculator().calculateResult('3(6-0)'), '18');
  });

  test('Result 6', () {
    expect(Calculator().calculateResult('5-2'), '3');
  });

  test('Result 7', () {
    expect(Calculator().calculateResult('(6-0)/(6-0)'), '1');
  });

  test('Result 8', () {
    expect(Calculator().calculateResult('14(12-2)(2-1)+5-2+12/6'), '145');
  });

  test('Result 9', () {
    expect(Calculator().calculateResult('10-2-3-5'), '0');
  });

  test('Result 10', () {
    expect(Calculator().calculateResult('-4*5'), '-20');
  });
}
