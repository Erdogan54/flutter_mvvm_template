import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_mvvm_template/core/base/model/base_error.dart';
import 'package:flutter_mvvm_template/core/constants/enums/http_request_enum.dart';
import 'package:flutter_mvvm_template/core/base/model/base_model.dart';
import 'package:flutter_mvvm_template/core/extension/network_extension.dart';
import 'package:flutter_mvvm_template/core/init/network/IResponseModel.dart';
import 'package:flutter_test/flutter_test.dart';

import 'dio_mock_model.dart';

part 'core_dio_mock.dart';

void main() {
  ICoreDioFull? service;
  setUp(() {
    service = _CoreDioMock(baseOptions: BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"));
  });

  test('CoreDioTest List', () async {
    final data =
        await service?.myFetch<List<PostModel>, PostModel>("/posts", type: HttpTypes.GET, parseModel: PostModel());

    expect(data?.data, isList);
  });
  test('CoreDioTest List No Network', () async {
    final data = await service?.fetchNoNetwork<List<PostModel>, PostModel>("/posts",
        type: HttpTypes.GET, parseModel: PostModel());

    expect(data?.data, isList);
  });

  test('CoreDioTest Primitive', () async {
    final data =
        await service?.myFetch<List<PostModel>, PostModel>("/posts", type: HttpTypes.GET, parseModel: PostModel());

    expect(data?.data, isList);
  });
  test('CoreDioTest Error', () async {
    final data =
        await service?.myFetch<List<PostModel>, PostModel>("/posts", type: HttpTypes.GET, parseModel: PostModel());

    expect(data?.data, isList);
  });
}

abstract class ICoreDio {
  Future<IResponseModel<R>> myFetch<R, T extends BaseModel>(
    String path, {
    required HttpTypes type,
    required T parseModel,
    dynamic data,
    Map<String, Object>? queryParameters,
    Options? options,
    void Function(int p1, int p2)? onReceiveProgress,
  });
}

abstract class ICoreDioFull extends ICoreDio {
  Future<IResponseModel<R>> fetchNoNetwork<R, T extends BaseModel>(
    String path, {
    required HttpTypes type,
    required T parseModel,
    dynamic data,
    Map<String, Object>? queryParameters,
    Options? options,
    void Function(int p1, int p2)? onReceiveProgress,
  });
}
