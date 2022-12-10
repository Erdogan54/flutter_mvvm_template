import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/base_view_model.dart';
import '../../../../_product/_utilty/circle_decoration.dart';
import '../model/house_model.dart';
import '../service/IBuild_feed_service.dart';
import '../service/build_feed_service.dart';

part 'build_feed_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class BuildFeedViewModel = _FeedViewModelBase with _$BuildFeedViewModel;

abstract class _FeedViewModelBase with Store, BaseViewModel {
  late BuildContext baseContext;
  @override
  void setContext(BuildContext context) => baseContext = context;

  late DecorationHelper helper;
  late IBuildFeedService feedService;
  GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey();

  @observable
  int tabIndex = 0;

  @observable
  bool isLoading = false;

  @observable
  List<HouseModel>? houseModels = [];

  @computed
  HouseModel? get sliderHouse => houseModels?.first;

  @observable
  List<String> likedItems = [];

  @action
  void onLikeItemPressed(String? id) {
    if (id != null) {
      if (likedItems.contains(id)) {
        likedItems.remove(id);
      } else {
        likedItems.add(id);
      }
      likedItems = likedItems;
    }
  }

  @override
  void init() {
    helper = DecorationHelper(context: baseContext);
    feedService = BuildFeedService(vexanaManager.networkManager, scaffoldKey);
  }

  @action
  tab2Change(int index) {
    tabIndex = index;
  }

  _changeLoading() {
    isLoading = !isLoading;
  }

  @action
  getListAll() async {
    _changeLoading();
    // houseModels = await feedService.fetchUserHouseList();
    await Future.delayed(const Duration(seconds: 2));
    houseModels = demoDataList;

    _changeLoading();
  }

  final List<HouseModel> demoDataList = [
    HouseModel(
      id: "1",
      title: "Özgür ERDOĞAN",
      description: "description",
      image: "https://picsum.photos/200",
      iV: 1,
      user: UserModel(id: "1", date: "20.01.1993", image: "https://picsum.photos/200", name: "user1"),
    ),
    HouseModel(
      id: "2",
      title: "Ahmet ERDOĞAN",
      description: "description",
      image: "https://picsum.photos/200",
      iV: 1,
      user: UserModel(id: "1", date: "20.01.1993", image: "https://picsum.photos/200", name: "user2"),
    ),
    HouseModel(
      id: "3",
      title: "Mehmet ERDOĞAN",
      description: "description",
      image: "https://picsum.photos/200",
      iV: 1,
      user: UserModel(id: "1", date: "20.01.1993", image: "https://picsum.photos/200", name: "user3"),
    ),
  ];
}
