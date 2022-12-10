import '../../init/network/IResponseModel.dart';

class BaseError extends IErrorModel {
  final String? message;
  BaseError(this.message);
  
  @override
  void statusCode() {
    // TODO: implement statusCode
  }
}
