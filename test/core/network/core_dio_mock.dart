part of "core_dio_test.dart";

class _CoreDioMock with DioMixin implements Dio, ICoreDioFull {
  BaseOptions? baseOptions;

  _CoreDioMock({required BaseOptions baseOptions}) {
    options = baseOptions;
    interceptors.add(InterceptorsWrapper());
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  @override
  Future<IResponseModel<R>> myFetch<R, T extends BaseModel>(
    String path, {
    required HttpTypes type,
    required T parseModel,
    data,
    Map<String, Object>? queryParameters,
    Options? options,
    void Function(int p1, int p2)? onReceiveProgress,
  }) async {
    final response = await request(path, data: data, options: Options(method: type.rawValue));

    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = response.data;
        final model = _responseParser<R, T>(parseModel, data);
        return ResponseModel<R>(data: model);
      default:
        return ResponseModel(error: BaseError("message"));
    }
  }

  @override
  Future<IResponseModel<R>> fetchNoNetwork<R, T extends BaseModel>(
    String path, {
    required HttpTypes type,
    required T parseModel,
    data,
    Map<String, Object>? queryParameters,
    Options? options,
    void Function(int p1, int p2)? onReceiveProgress,
  }) async {
    // ignore: prefer_const_declarations
    final dummyJson = """    
[{
"userId": 1,
"id": 1,
"title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
"body": "quia et suscipit suscipit recusandae consequuntur expedita et cumreprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto"
},
{
"userId": 1,
"id": 2,
"title": "qui est esse",
"body": "est rerum tempore vitae sequi sint nihil reprehenderit dolor beatae ea dolores neque fugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis qui aperiam non debitis possimus qui neque nisi nulla"
}]""";

    final response = jsonDecode(dummyJson);
    final model = _responseParser<R, T>(parseModel, response);
    return ResponseModel<R>(data: model);
  }

  R _responseParser<R, T>(BaseModel model, dynamic data) {
    if (data is List) {
      return data.map((e) => model.fromJson(e)).cast<T>().toList() as R;
    } else if (data is Map) {
      return model.fromJson(data.cast<String, Object>()) as R;
    }
    return data as R;
  }
}
