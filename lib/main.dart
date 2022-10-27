import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/view/authenticate/test/view/test_view2.dart';
import 'package:flutter_mvvm_template/view/authenticate/test/view/test_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: TestView2(),
    );
  }
}
