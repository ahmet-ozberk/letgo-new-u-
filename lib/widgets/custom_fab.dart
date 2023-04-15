import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:letgo/utils/app_color.dart';

import 'material_two.dart';

class CustomFab extends ConsumerWidget {
  const CustomFab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialTwo(
      child: FloatingActionButton(
        heroTag: "custom_fab",
        onPressed: () {},
        backgroundColor: AppColor.primaryColor,
        child: const FaIcon(FontAwesomeIcons.camera, color: Colors.white),
      ),
    );
  }
}
