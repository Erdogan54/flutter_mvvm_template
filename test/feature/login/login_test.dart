import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    print("x");
  });

  test("User Login fail test", () {
    final isUserLogin = true;

    expect(isUserLogin, isTrue);
  });

  group("User Login fail test", () {
    
    //test1
    test("User Login fail test", () {
      final isUserLogin = true;

      expect(isUserLogin, isTrue);
    });

    //test2
    test("User Login fail test", () {
      final isUserLogin = true;

      expect(isUserLogin, isTrue);
    });

    //test3
    test("User Login fail test", () {
      final isUserLogin = true;

      expect(isUserLogin, isTrue);
    });
  });
}
