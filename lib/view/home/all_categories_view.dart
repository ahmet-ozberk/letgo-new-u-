import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:letgo/view/home/categories_detail_view.dart';
import 'package:letgo/widgets/custom_textfield.dart';

import '../../widgets/custom_fab.dart';
import '../../widgets/custom_navigation_bar.dart';

class AllCategoriesView extends ConsumerWidget {
  const AllCategoriesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori Seç', style: Theme.of(context).textTheme.bodyLarge),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(42),
          child: Hero(
            tag: "categories_search",
            transitionOnUserGestures: true,
            child: const CustomTextField(
              hintText: "Kategori ara",
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
            title: Text('Kategori $index', style: Theme.of(context).textTheme.bodyMedium),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: CachedNetworkImage(
                imageUrl: index.randomImg(),
                width: 28,
                height: 28,
                fit: BoxFit.cover,
              ),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Grock.to(CategoriesDetailView(title: "Kategori $index")),
          ),
        ),
      ),
    );
  }
}
