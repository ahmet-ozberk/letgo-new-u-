import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:letgo/controller/base_controller.dart';
import 'package:letgo/widgets/custom_fab.dart';
import 'package:letgo/widgets/custom_navigation_bar.dart';

class BaseView extends ConsumerWidget {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const CustomFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ref.watch(baseController).body(),
    );
  }
}
