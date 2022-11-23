import 'package:flutter_mvvm_template/view/authenticate/login/model/login_response_model.dart';
import 'package:flutter_mvvm_template/view/authenticate/login/model/login_model.dart';
import 'package:flutter_mvvm_template/view/authenticate/login/service/ILoginService.dart';
import 'package:vexana/src/interface/INetworkService.dart';
import 'package:vexana/vexana.dart';

import '../../../_product/enum/network_route_enum.dart';

class LoginService extends ILoginService {
  LoginService(super.manager);

  @override
  Future<LoginResponseModel?> fetchUserControl(LoginModel model) async {
    final response = await manager.send<LoginResponseModel, LoginResponseModel>(NetworkRoutes.LOGIN.rawValue,
        parseModel: LoginResponseModel(), method: RequestType.POST, data: model);

    if (response.data is LoginResponseModel) {
      return response.data;
    } else {
      return null;
    }
  }
}