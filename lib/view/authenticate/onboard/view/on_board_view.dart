import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mvvm_template/core/components/list-view/indicator_listview.dart';
import 'package:flutter_mvvm_template/view/widgets/list-view/on_board_indicator.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/colum/form_colum.dart';
import '../../../../core/extension/context_extension.dart';
import '../view-model/on_board_view-model.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  late OnBoardViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewmodel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel viewModel) => Scaffold(
        body: buildColumnBody(),
      ),
    );
  }

  Column buildColumnBody() {
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: buildPageView(),
        ),
        Expanded(flex: 1, child: buildObserverIndicator())
      ],
    );
  }

  PageView buildPageView() {
    return PageView.builder(
      onPageChanged: (value) {
        viewModel.onPageChanged(value);
      },
      itemCount: viewModel.onBoardModels?.length,
      itemBuilder: (context, index) {
        return Container(
          color: context.randomColor,
          child: FormColumn(
            children: [const Placeholder(), Text("${viewModel.onBoardModels?[index].text}")],
          ),
        );
      },
    );
  }

  Observer buildObserverIndicator() {
    return Observer(builder: (_) {
      return OnBoardIndicator(
        itemCount: viewModel.onBoardModels?.length,
        currentPageIndex: viewModel.currentPageIndex,
      );
    });
  }
}
