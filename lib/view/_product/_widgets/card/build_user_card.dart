
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../home/build/feed/model/house_model.dart';

class BuildUserCard extends StatelessWidget {
  final HouseModel? houseModel;

  final bool isLiked;
  final Function(String? id) onPressedLikeId;
  const BuildUserCard({
    Key? key,
    required this.houseModel,
    this.isLiked = false,
    required this.onPressedLikeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundImage: NetworkImage(houseModel?.user?.image ?? ""),
          ),
          title: Text(houseModel?.user?.name ?? "null"),
          subtitle: Text(houseModel?.user?.date ?? "null"),
          trailing: buildIconButton(),
        ),
        context.emptySizedHeightBoxLow,
        buildWrap(context),
      ],
    );
  }

  Widget buildWrap(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      children: [
        AutoSizeText(houseModel?.title ?? "null",
            style: context.textTheme.headline5?.copyWith(fontWeight: FontWeight.w600), maxLines: 1),
        Text(houseModel?.description ?? "")
      ],
    );
  }

  IconButton buildIconButton() {
    return IconButton(
        onPressed: () {
          onPressedLikeId(houseModel?.id);
        },
        icon: Icon(Icons.favorite, color: isLiked ? Colors.pink : Colors.grey));
  }
}
