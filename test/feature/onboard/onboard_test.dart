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

  test("OnBord Get Service Request", () async {
    expect(mockViewModel!.isLoading, false);
    mockViewModel!.getServiceRequest();
    expect(mockViewModel!.isLoading, true);
  });

  test("OnBord On Page Changed", () async {
    mockViewModel!.onPageChanged(5);
    expect(mockViewModel!.currentPageIndex, 5);
  });

  group("Test All", () {
    int? index = 0;

    test("OnBord Get Model", () async {
      await mockViewModel!.onBoardGetModels();
      index = mockViewModel?.onBoardModels?.length;
      expect(mockViewModel!.onBoardModels, isList);
    });
    test("OnBord On Page Changed", () async {
      mockViewModel!.onPageChanged(index ?? 0);
      expect(index, mockViewModel?.currentPageIndex);
    });
  });
}
