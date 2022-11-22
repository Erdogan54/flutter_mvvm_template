// import 'package:dio/dio.dart';
// import 'package:flutter_mvvm_template/core/constants/enums/http_request_enum.dart';
// import 'package:flutter_mvvm_template/core/init/network/core_dio.dart';
// import 'package:flutter_mvvm_template/core/init/network/network_manager.dart';
// import 'package:flutter_mvvm_template/view/authenticate/onboard/model/on_board_model.dart';
// import 'package:flutter_mvvm_template/core/init/network/ICoreDio.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_mvvm_template/view/authenticate/onboard/view-model/on_board_view-model.dart';
// import 'package:mobx/src/core.dart';

// import '../../core/network/dio_mock_model.dart';

// class OnBoardMockViewModel implements OnBoardViewModel {
//   @override
//   late BuildContext contextMy;

//   @override
//   ICoreDio? coreDio;

//   @override
//   int currentPageIndex = 0;

//   @override
//   List<OnBoardModel>? onBoardModels;

//   @override
//   ReactiveContext get context => throw UnimplementedError();

//   bool isLoading = false;

//   IStringHelper? stringHelper;

//   @override
//   void setContext(BuildContext context) {
//     contextMy = context;
//   }

//   @override
//   void init() {
//     coreDio = CoreDio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"));
//     stringHelper = MockStringHelper();
//   }

//   @override
//   onPageChanged(int value) {
//     currentPageIndex = value;
//   }

//   Future<void> onBoardGetModels() async {
//     // coreDio.myFetch("path", type: HttpTypes.GET, parseModel: "parseModel");
//     final response =
//         await coreDio?.myFetch<List<PostModel>, PostModel>("/posts", type: HttpTypes.GET, parseModel: PostModel());

//     if (response?.data is List) {
//       onBoardModels = response!.data!.map((e) => OnBoardModel(stringHelper?.toUpper(e.title))).toList();
//     }

//   }

//   Future<void> getServiceRequest() async {
//     isLoading = true;
//     await onBoardGetModels();
//     isLoading = false;
//   }
// }

// abstract class IStringHelper {
//   String? toUpper(String? data);
// }

// class MockStringHelper extends IStringHelper {
//   @override
//   String? toUpper(String? data) {
//     return data?.toUpperCase();
//   }
// }
