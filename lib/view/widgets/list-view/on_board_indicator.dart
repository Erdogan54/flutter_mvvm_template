import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/components/list-view/indicator_listview.dart';

class OnBoardIndicator extends StatelessWidget {
  final int? itemCount;
  final int currentPageIndex;
  const OnBoardIndicator({super.key, required this.itemCount, required this.currentPageIndex});

  @override
  Widget build(BuildContext context) {
    return IndicatorListView(
      currentPageIndex: currentPageIndex,
      itemCount: itemCount,
      onListItem: (index) {
        return const Card(
          child: FlutterLogo(style: FlutterLogoStyle.stacked),
        );
      },
    );
  }
}
