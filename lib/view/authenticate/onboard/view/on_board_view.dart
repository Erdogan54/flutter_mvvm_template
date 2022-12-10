import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/text/auto_locale_text.dart';
import '../../../../core/extension/context_extension_pro.dart';
import '../../../_product/_widgets/avatar/on_board_circle.dart';
import '../model/on_board_model.dart';
import '../view-model/on_board_viewmodel.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewmodel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel viewModel) => scaffoldBuild(context, viewModel),
    );
  }

  Scaffold scaffoldBuild(BuildContext context, OnBoardViewModel viewModel) {
    return Scaffold(
      body: Padding(
        padding: context.paddingNormalHorizontal,
        child: Column(children: [
          const Spacer(flex: 1),
          Expanded(flex: 5, child: buildPageView(viewModel)),
          Expanded(flex: 2, child: buildRowFooter(viewModel, context)),
        ]),
      ),
    );
  }

  PageView buildPageView(OnBoardViewModel viewModel) {
    return PageView.builder(
      onPageChanged: (value) => viewModel.changeCurrentIndex(value),
      itemCount: viewModel.onBoardItems.length,
      itemBuilder: (context, index) {
        return buildColmunBody(context, viewModel.onBoardItems[index]);
      },
    );
  }

  Row buildRowFooter(OnBoardViewModel viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildListViewCircle(viewModel),
        Center(child: Observer(builder: (_) {
          return Visibility(
            visible: viewModel.isLoding,
            child: CircularProgressIndicator(color: context.colors.secondary));
        })),
        buildFloatingActionButtonScipe(context,viewModel)
      ],
    );
  }

  ListView buildListViewCircle(OnBoardViewModel viewModel) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: viewModel.onBoardItems.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Observer(builder: (context) {
          return OnBoardCircle(isSelected: viewModel.currentIndex == index);
        });
      },
    );
  }

  FloatingActionButton buildFloatingActionButtonScipe(BuildContext context,OnBoardViewModel viewModel) {
    return FloatingActionButton(
      child: Icon(
        Icons.navigate_next_rounded,
        size: 48,
        color: context.colors.primary,
      ),
      onPressed: () => viewModel.complateToOnBoard(),
    );
  }

  Column buildColmunBody(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(child: buildSvgPicture(model)),
        buildColumnDescription(context, model),
      ],
    );
  }

  Column buildColumnDescription(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        buildAutoLocaleTextTitle(model, context),
        Padding(
          padding: context.paddingMediumHorizontal,
          child: buildAutoLocaleTextDescription(model, context),
        ),
      ],
    );
  }

  AutoLocaleText buildAutoLocaleTextDescription(OnBoardModel model, BuildContext context) {
    return AutoLocaleText(
      value: model.decription,
      textAlign: TextAlign.center,
      style: context.textTheme.subtitle1?.copyWith(fontWeight: FontWeight.w100),
    );
  }

  AutoLocaleText buildAutoLocaleTextTitle(OnBoardModel model, BuildContext context) {
    return AutoLocaleText(
      value: model.title,
      style: context.textTheme.headline3?.copyWith(
        fontWeight: FontWeight.bold,
        color: context.colors.onSecondary,
      ),
    );
  }

  SvgPicture buildSvgPicture(OnBoardModel model) => SvgPicture.asset(model.imagePath);
}
