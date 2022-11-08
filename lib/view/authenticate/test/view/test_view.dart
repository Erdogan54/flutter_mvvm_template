import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mvvm_template/core/base/state/base_state.dart';
import 'package:flutter_mvvm_template/core/base/view/base_view.dart';
import 'package:flutter_mvvm_template/view/authenticate/test/viewmodel/test_viewmodel.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  late TestViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewmodel: TestViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        viewModel = model;
      },
      onPageBuilder: (BuildContext context, TestViewModel viewModel) => scaffolBuild,
    );
  }

  Scaffold get scaffolBuild {
    return Scaffold(
      floatingActionButton: floatingActionButtonNumberIncrement,
      body: textNumber,
    );
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
