import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

import 'custom_textfield.dart';

class CustomSearchView extends ConsumerStatefulWidget {
  const CustomSearchView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomSearchViewState();
}

class _CustomSearchViewState extends ConsumerState<CustomSearchView> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextField(
          controller: searchController,
          hintText: "Araba, telefon, bisiklet ve daha fazlası...",
          leading: const Icon(
            CupertinoIcons.search,
            size: 18,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.clear),
          tooltip: "Kapat",
        ),
      ),
      body: SingleChildScrollView(
        padding: 16.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Son aramalar", style: Theme.of(context).textTheme.bodySmall),
            8.height,
            const Divider(height: 0),
            ListView.separated(
              itemCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) => const Divider(height: 0),
              itemBuilder: (context, index) => GrockContainer(
                onTap: () => searchController.text = "masa",
                child: Row(
                  children: [
                    8.width,
                    const Icon(Icons.history),
                    4.width,
                    const Text("masa"),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.close),
                      tooltip: "Sil",
                    ),
                  ],
                ),
              ),
            ),
            16.height,
            Text("Popüler Kategoriler", style: Theme.of(context).textTheme.bodySmall),
            8.height,
            const Divider(height: 0),
            ListView.separated(
              itemCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const Divider(height: 0),
              itemBuilder: (context, index) => GrockContainer(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: [
                    8.width,
                    const Text("Araba"),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right_outlined),
                      tooltip: "Seç",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
