import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:letgo/controller/base_controller.dart';
import 'package:letgo/utils/app_color.dart';

class CustomNavigationBar extends ConsumerStatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends ConsumerState<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final read = ref.read(baseController);
    final watch = ref.watch(baseController);
    return Hero(
      tag: "bottom_nav_bar",
      transitionOnUserGestures: true,
      child: BottomNavigationBar(
        items: read.navBarItems,
        currentIndex: watch.currentIndex,
        onTap: (index) => read.changeIndex(index),
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ).material(),
    );
  }
}
