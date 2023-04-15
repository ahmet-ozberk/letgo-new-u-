import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/custom_fab.dart';
import '../widgets/custom_navigation_bar.dart';

class ProductResultView extends ConsumerStatefulWidget {
  const ProductResultView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductResultViewState();
}

class _ProductResultViewState extends ConsumerState<ProductResultView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const CustomFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Center(
        child: Text('ProductResultView'),
      ),
    );
  }
}
