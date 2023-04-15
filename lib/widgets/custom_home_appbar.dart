import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grock/grock.dart';
import 'package:letgo/widgets/custom_location_view.dart';

import '../assets.dart';

class CustomHomeAppbar extends ConsumerWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomHomeAppbar({Key? key})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: SizedBox(
          height: (AppBarTheme.of(context).toolbarHeight ?? kToolbarHeight) - 16,
          child: SvgPicture.asset(Assets.images.logoSVG)),
      centerTitle: false,
      actions: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: context.width * 0.8,
          ),
          child: CupertinoButton(
            onPressed: () {
              Grock.fullScreenModal(
                openDuration: 300.milliseconds,
                builder: (_, p1, p2) => const CustomLocationView(),
              );
            },
            child: Row(
              children: [
                const Text(
                  '21016. Sk. 62/1, 46300 Petaling Jaya, Selangor',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                ).expanded(),
                2.width,
                const FaIcon(
                  CupertinoIcons.location_solid,
                  size: 22,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
