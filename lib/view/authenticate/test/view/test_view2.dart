import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../viewmodel/test_viewmodel.dart';

class TestView2 extends StatefulWidget {
  const TestView2({super.key});

  @override
  State<TestView2> createState() => _TestView2State();
}

class _TestView2State extends State<TestView2> {
  TestViewModel viewModel = TestViewModel();
  @override
  Widget build(BuildContext context) {
    return scaffolBuild;
  }

  Scaffold get scaffolBuild {
    return Scaffold(
      appBar: appBar,
      floatingActionButton: floatingActionButtonNumberIncrement,
      body: textNumber,
    );
  }

  AppBar get appBar {
    return AppBar(title: Observer(builder: (_) {
      return Text(viewModel.isEven.toString());
    }));
  }

  Widget get textNumber {
    return Center(
      child: Observer(builder: (_) {
        return Text(viewModel.number.toString());
      }),
    );
  }

  FloatingActionButton get floatingActionButtonNumberIncrement =>
      FloatingActionButton(onPressed: () => viewModel.incrementNumber());
}
