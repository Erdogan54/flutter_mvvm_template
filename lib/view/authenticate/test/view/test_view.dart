import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../viewmodel/test_viewmodel.dart';

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
      onModelReady: (vwModel) {
        vwModel.setContext(context);
        viewModel = vwModel;
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
