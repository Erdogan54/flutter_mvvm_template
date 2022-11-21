import 'package:flutter_mvvm_template/core/extension/string_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test('Email ,Regexp', () {
    String email = "JOEDOE@GMAIL.COM";
    expect(email.isValidEmail, null);
  });
}
