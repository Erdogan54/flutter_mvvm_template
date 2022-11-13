import 'package:flutter_test/flutter_test.dart';

import 'onboard_mock_view_model.dart';

void main() {
  OnBoardMockViewModel? mockViewModel;
  IStringHelper? stringHelper;
  setUp(() {
    mockViewModel = OnBoardMockViewModel();
    stringHelper = MockStringHelper();
    mockViewModel?.init();
  });

  test('String Helper Upper Case', () {
    String? text = " Hello";
    text = stringHelper?.toUpper(text);

    expect(text?.contains(RegExp("[A-Z]+")), true);
  });

  test("OnBord Get Model", () async {
    await mockViewModel!.onBoardGetModels();
    expect(mockViewModel!.onBoardModels, isList);
  });

  test("OnBord isLoading", () async {
    expect(mockViewModel!.isLoading, false);
    // await mockViewModel!.onBoardGetModels().;
    expect(mockViewModel!.isLoading, false);
  });
}
