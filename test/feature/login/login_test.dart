import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    if (kDebugMode) {
      print("x");
    }
  });

  test("User Login fail test", () {
    const isUserLogin = true;

    expect(isUserLogin, isTrue);
  });

  group("User Login fail test", () {
    
    //test1
    test("User Login fail test", () {
      const isUserLogin = true;

      expect(isUserLogin, isTrue);
    });

    //test2
    test("User Login fail test", () {
      const isUserLogin = true;

      expect(isUserLogin, isTrue);
    });

    //test3
    test("User Login fail test", () {
      const isUserLogin = true;

      expect(isUserLogin, isTrue);
    });
  });
}
