
import 'package:flutter/material.dart';

import '../../../../core/components/button/title_text_button.dart';

class FaceBookButton extends StatelessWidget {
  final Function({FaceBookModel? data, String? errorMessage}) onComplate;
  const FaceBookButton({super.key, required this.onComplate});

  @override
  Widget build(BuildContext context) {
    return TitleTextButton(
        onPressed: () {
          //facebook giriş kodları buraya yazılır...
          const isLenghtSixCharacter = "kndlksnv".length == 6;
          if (isLenghtSixCharacter) {
            onComplate(data: FaceBookModel("token", "email"));
          } else {
            onComplate(errorMessage: "Facebook user not found");
          }
        },
        text: "Facebook Login");
  }
}

class FaceBookModel {
  final String token;
  final String email;

  FaceBookModel(this.token, this.email);
}
