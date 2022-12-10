import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../../base/model/base_error.dart';
import '../../base/model/base_model.dart';
import '../../constants/enums/http_request_enum.dart';
import '../../extension/network_extension.dart';
import 'ICoreDio.dart';
import 'IResponseModel.dart';

part "../network/network_core/core_operations.dart";

class CoreDio with DioMixin implements Dio, ICoreDio {
  final BaseOptions baseOptions;

  CoreDio(this.baseOptions) {
    options = baseOptions;
    httpClientAdapter = DefaultHttpClientAdapter();
    interceptors.add(InterceptorsWrapper());
  }

  @override
  Future<IResponseModel<R>> myFetch<R, T extends BaseModel>(
    String path, {
    required HttpTypes type,
    required T parseModel,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    void Function(int p1, int p2)? onReceiveProgress,
  }) async {
    
    final response = await request(path, data: data, options: Options(method: type.rawValue));
    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = response.data;
        final model = _responseParser<R,T>(parseModel, data);
        return ResponseModel<R>(data: model);
      default:
        return ResponseModel(error: BaseError("message"));
    }
  }
}
