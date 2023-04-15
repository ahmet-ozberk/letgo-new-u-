import 'package:flutter/material.dart';
import 'package:letgo/utils/app_color.dart';

class MaterialTwo extends StatelessWidget {
  final Widget child;
  const MaterialTwo({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(useMaterial3: false, primaryColor: AppColor.primaryColor),
      child: child,
    );
  }
}