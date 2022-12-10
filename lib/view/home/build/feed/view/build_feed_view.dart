import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';
import '../../../../_product/_widgets/card/build_user_card.dart';
import '../model/house_model.dart';
import '../view-model/build_feed_viewmodel.dart';

class BuildFeedView extends StatefulWidget {
  const BuildFeedView({super.key});

  @override
  State<BuildFeedView> createState() => _BuildFeedViewState();
}

class _BuildFeedViewState extends State<BuildFeedView> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<BuildFeedViewModel>(
      viewmodel: BuildFeedViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        model.getListAll();
      },
      onPageBuilder: (BuildContext context, BuildFeedViewModel viewModel) => Scaffold(
        key: viewModel.scaffoldKey,
        appBar: buildAppBar(),
        body: Observer(builder: (_) {
          return viewModel.isLoading
              ? buildCenter()
              : (viewModel.houseModels?.isEmpty ?? true)
                  ? const Center(
                      child: Text("Not Found"),
                    )
                  : buildListViewRecommended(viewModel, context);
        }),
      ),
    );
  }

  ListView buildListViewRecommended(BuildFeedViewModel viewModel, BuildContext context) {
    return ListView(
      padding: context.paddingNormal,
      children: [
        buildTabbar(viewModel),
        buildSizedBoxLatestPageView(context, viewModel),
        context.emptySizedHeightBoxLow,
        Text(
          LocaleKeys.home_subtitle.tr(),
          style: context.textTheme.headline5?.copyWith(fontWeight: FontWeight.w600),
        ),
        context.emptySizedHeightBoxLow,
        buildListBottom(viewModel)
      ],
    );
  }

  ListView buildListBottom(BuildFeedViewModel viewModel) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return SizedBox(
          height: context.dynamicHeight(0.17),
          child: Card(
            child: Row(
              children: [
                Expanded(flex: 3, child: Image.network(viewModel.houseModels?[index].image ?? "")),
                Expanded(
                  flex: 9,
                  child: buildObserverUserCard(viewModel, index),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Observer buildObserverUserCard(BuildFeedViewModel viewModel, int index) {
    return Observer(builder: (_) {
                  return BuildUserCard(
                      houseModel: viewModel.houseModels?[index],
                      isLiked: viewModel.likedItems.contains(viewModel.houseModels?[index].id),
                      onPressedLikeId: (id) => viewModel.onLikeItemPressed(id));
                });
  }

  SizedBox buildSizedBoxLatestPageView(BuildContext context, BuildFeedViewModel viewModel) {
    return SizedBox(
      height: context.dynamicHeight(0.36),
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return buildStakFloaty(context, viewModel.sliderHouse, viewModel);
        },
      ),
    );
  }

  TabBar buildTabbar(BuildFeedViewModel viewModel) {
    return TabBar(
        controller: _tabController,

        //automaticIndicatorColorAdjustment: false,
        indicatorSize: TabBarIndicatorSize.label,
        isScrollable: true,
        indicator: viewModel.helper.circleDecoration,
        tabs: [
          Tab(child: Text(LocaleKeys.home_build_tabbar_tab1.tr(), maxLines: 1)),
          Tab(child: Text(LocaleKeys.home_build_tabbar_tab2.tr(), maxLines: 1)),
          Tab(child: Text(LocaleKeys.home_build_tabbar_tab3.tr(), maxLines: 1)),
          Tab(child: Text(LocaleKeys.home_build_tabbar_tab4.tr(), maxLines: 1))
        ]);
  }

  Center buildCenter() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(onPressed: () {}, icon: const Icon(Icons.format_align_left)),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
    );
  }

  Stack buildStakFloaty(BuildContext context, HouseModel? houseModel, BuildFeedViewModel viewModel) {
    return Stack(children: [
      Positioned.fill(
          left: 10,
          right: 10,
          bottom: 75,
          child: SizedBox(
            height: 100,
            child: Image.network(
              houseModel?.image ?? "",
              fit: BoxFit.cover,
            ),
          )),
      Positioned(
          top: 150,
          left: 20,
          right: 20,
          child: buildCardFloaty(context, houseModel, viewModel)),
    ]);
  }

  Card buildCardFloaty(BuildContext context, HouseModel? houseModel, BuildFeedViewModel viewModel) {
    return Card(
            child: Padding(
          padding: context.paddingLow,
          child: Observer(builder: (_) {
            return BuildUserCard(
              houseModel: houseModel,
              isLiked: viewModel.likedItems.contains(houseModel?.id),
              onPressedLikeId: (id) => viewModel.onLikeItemPressed(id),
            );
          }),
        ));
  }
}
