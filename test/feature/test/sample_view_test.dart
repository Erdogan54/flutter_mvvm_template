import 'package:flutter_mvvm_template/core/init/network/ICoreDio.dart';
import 'package:flutter_mvvm_template/core/init/network/network_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ICoreDio coreDio;
  setUp(() {
    coreDio = NetworkManager.instance.coreDio;
  });
  test(
    "Sample",
    () {},
  );
}
