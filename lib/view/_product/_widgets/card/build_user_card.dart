// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kartal/kartal.dart';

import 'package:flutter_mvvm_template/view/home/build/feed/model/house_model.dart';
import 'package:flutter_mvvm_template/view/home/build/feed/view-model/build_feed_viewmodel.dart';

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
            trailing: Builder(builder: (context) {
              print("build usr card : isLiked:$isLiked");
              return IconButton(
                  onPressed: () {
                    onPressedLikeId(houseModel?.id);
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: isLiked ? Colors.pink : Colors.grey,
                  ));
            })),
        Text(
          houseModel?.title ?? "null",
          style: context.textTheme.headline5?.copyWith(fontWeight: FontWeight.w600),
        ),
        Text(houseModel?.description ?? "null")
      ],
    );
  }
}
