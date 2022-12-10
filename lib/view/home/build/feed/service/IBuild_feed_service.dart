import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vexana/vexana.dart';

import '../model/house_model.dart';

abstract class IBuildFeedService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldMessengerState> scaffoldKey;
  IBuildFeedService(this.manager,this.scaffoldKey);

  Future<List<HouseModel>?> fetchUserHouseList();
}
