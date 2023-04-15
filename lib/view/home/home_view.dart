import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grock/grock.dart';
import 'package:letgo/assets.dart';
import 'package:letgo/utils/app_color.dart';
import 'package:letgo/view/home/all_categories_view.dart';
import 'package:letgo/widgets/custom_home_appbar.dart';
import 'package:letgo/widgets/custom_home_categories.dart';
import 'package:letgo/widgets/custom_product_card.dart';
import 'package:letgo/widgets/custom_search_view.dart';
import 'package:letgo/widgets/custom_textfield.dart';

import '../../widgets/home_banner.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHomeAppbar(),
      body: ListView(
        children: [
          const CustomTextField(
                  hintText: "Araba, telefon, bisiklet ve daha fazlası...",
                  leading: Icon(
                    CupertinoIcons.search,
                    size: 18,
                  ))
              .disabled(true)
              .onTap(() => Grock.fullScreenModal(
                    openDuration: 300.milliseconds,
                    builder: (_, p1, p2) => const CustomSearchView(),
                  ))
              .padding(bottom: 16, left: 16, right: 16),
          const HomeBanner(),
          8.height,
          Row(
            children: [
              Text(
                "Kategorilere Göz At",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
              TextButton(
                onPressed: () => Grock.to(const AllCategoriesView()),
                style: TextButton.styleFrom(
                    foregroundColor: AppColor.primaryColor,
                    textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColor.primaryColor)),
                child: const Text("Tümünü Gör"),
              ),
            ],
          ).padding(left: 16, right: 4),
          SizedBox(
            height: context.height * 0.12 + 16,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              separatorBuilder: (context, index) => 32.width,
              itemBuilder: (context, index) => const CustomHomeCategories(),
            ),
          ),
          Text(
            "Güncel İlanlar",
            style: Theme.of(context).textTheme.titleMedium,
          ).padding(top: 12, left: 16, bottom: 12),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 7,
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
            itemBuilder: (context, index) => CustomProductCard(index: index),
          ),
        ],
      ),
    );
  }
}
