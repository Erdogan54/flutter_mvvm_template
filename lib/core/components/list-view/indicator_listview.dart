import 'package:flutter/material.dart';

import '../../extension/context_extension_pro.dart';

class IndicatorListView extends StatelessWidget {
  final int? itemCount;
  final int currentPageIndex;
  final Widget Function(int index) onListItem;
  const IndicatorListView(
      {super.key, required this.itemCount, required this.currentPageIndex, required this.onListItem});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return buildPadding(context, index);
        });
  }

  Padding buildPadding(BuildContext context, int index) {
    return Padding(
      padding: context.paddingLow,
      child: buildCircleAvatar(index, context),
    );
  }

  CircleAvatar buildCircleAvatar(int index, BuildContext context) {
    return CircleAvatar(
      backgroundColor: colorValue(index),
      radius: radiusValue(index, context),
      child: AnimatedOpacity(
        opacity: opacityValue(index),
        duration: context.durationMedium,
        child: onListItem(index),
      ),
    );
  }

  Color colorValue(int index) => isCurrentIndex(index) ? Colors.white : Colors.blue;

  double radiusValue(int index, BuildContext context) =>
      isCurrentIndex(index) ? context.width * 0.05 : context.width * 0.01;

  double opacityValue(int index) => isCurrentIndex(index) ? 1 : 0;

  bool isCurrentIndex(int index) => currentPageIndex == index;
}
