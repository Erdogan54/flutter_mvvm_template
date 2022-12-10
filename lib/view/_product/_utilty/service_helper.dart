import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

abstract class ServiceHelper {
  void showMessage(GlobalKey<ScaffoldMessengerState> scaffoldKey, IErrorModel? errorModel) {
    scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text(errorModel?.description ?? "")));
  }
}
