import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_mvvm_template/core/base/model/base_error.dart';
import 'package:flutter_mvvm_template/core/base/model/base_model.dart';

class NetworkManager {
  static final NetworkManager _instance = NetworkManager._();
  static NetworkManager get instance => _instance;

  late Dio _dio;
  NetworkManager._() {
    final baseOptions = BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/todos/1');
    _dio = Dio(baseOptions);

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.path += "ozgur";
      },
      // onResponse: (e, handler) => e.data,
      onError: (e, handler) {
        // return BaseError(e.message);
      },
    ));
  }

  Future dioGet<T extends BaseModel>(String path, T model) async {
    final response = await _dio.get(path);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;
        if (responseBody is List) {
          return responseBody.map((e) => model.fromJson(e)).toList();
        } else if (responseBody is Map) {
          return model.fromJson(responseBody.cast<String, Object>());
        }
        return responseBody;

      default:
    }
  }
}
