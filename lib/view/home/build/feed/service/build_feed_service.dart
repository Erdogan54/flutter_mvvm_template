import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vexana/vexana.dart';

import '../../../../_product/_utilty/service_helper.dart';
import '../../../../_product/enum/network_route_enum.dart';
import '../model/house_model.dart';
import 'IBuild_feed_service.dart';

class BuildFeedService extends IBuildFeedService with ServiceHelper {
  BuildFeedService(INetworkManager manager, GlobalKey<ScaffoldMessengerState> scaffoldKey)
      : super(manager, scaffoldKey);

  @override
  Future<List<HouseModel>?> fetchUserHouseList() async {
    final response = await manager.send<HouseModel, List<HouseModel>>(NetworkRoutes.BUILD_HOME.rawValue,
        parseModel: HouseModel(), method: RequestType.GET);

    showMessage(scaffoldKey, response.error);
    return response.data;
  }
}
