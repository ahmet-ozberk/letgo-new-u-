import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:letgo/view/product_result_view.dart';

import '../../widgets/custom_fab.dart';
import '../../widgets/custom_navigation_bar.dart';
import '../../widgets/custom_textfield.dart';

class CategoriesDetailView extends ConsumerStatefulWidget {
  final String title;
  const CategoriesDetailView({
    super.key,
    required this.title,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoriesDetailViewState();
}

class _CategoriesDetailViewState extends ConsumerState<CategoriesDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: Theme.of(context).textTheme.bodyLarge),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(42),
          child: Hero(
            tag: "categories_search",
            transitionOnUserGestures: true,
            child: const CustomTextField(
              hintText: "Ara",
              fillColor: Colors.transparent,
              isFilled: true,
              borderRadius: 0,
              leading: Icon(Icons.search),
            ).material(),
          ),
        ),
      ),
         bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const CustomFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: ListView.separated(
          itemCount: 12,
          separatorBuilder: (context, index) => const Divider(height: 0),
          itemBuilder: (context, index) => ListTile(
            title: Text('Üst Giyim $index',style: Theme.of(context).textTheme.bodyMedium),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Grock.to(const ProductResultView()),
          ),
        ),
      ),
    );
  }
}
