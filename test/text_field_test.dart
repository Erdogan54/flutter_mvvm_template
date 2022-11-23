import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test('text field validater email', () {
    var email = "tonys@tarkindustries.com";
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    expect(emailValid, true);
  });

}
