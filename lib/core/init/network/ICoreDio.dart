import 'package:dio/dio.dart';

import '../../base/model/base_model.dart';
import '../../constants/enums/http_request_enum.dart';
import 'IResponseModel.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> myFetch<R, T extends BaseModel>(
    String path, {
    required HttpTypes type,
    required T parseModel,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    void Function(int p1, int p2)? onReceiveProgress,
  });
}
