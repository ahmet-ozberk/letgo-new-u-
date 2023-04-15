import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:letgo/utils/app_color.dart';

class CustomProductCard extends ConsumerWidget {
  final int index;
  CustomProductCard({super.key, this.index = 0});
  final ValueNotifier<bool> isLiked = ValueNotifier(false);
  final ValueNotifier<int> imageIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: 12.borderRadius,
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: 12.borderRadiusOnlyTop,
                  child: PageView.builder(
                    itemCount: 3,
                    onPageChanged: (value) {
                      imageIndex.value = value;
                    },
                    itemBuilder: (context, i) {
                      return CachedNetworkImage(
                        imageUrl: index.randomImage(),
                        fit: BoxFit.contain,
                        height: double.infinity,
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: ValueListenableBuilder(
                    valueListenable: isLiked,
                    builder: (context, value, child) => IconButton(
                      icon: Icon(Icons.favorite, color: value ? AppColor.primaryColor : null),
                      onPressed: () {
                        isLiked.value = !isLiked.value;
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ValueListenableBuilder(
                    valueListenable: imageIndex,
                    builder: (context, value, child) => Row(
                      children: List.generate(
                          3,
                          (index) => Container(
                                width: 12,
                                height: 4,
                                margin: 2.padding,
                                decoration: BoxDecoration(
                                  color: value == index ? AppColor.primaryColor : Colors.grey,
                                ),
                              )),
                    ),
                  ),
                ),
              ],
            ).colored(color: Colors.grey.shade200),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "14.000 ₺",
                style: Theme.of(context).textTheme.titleMedium,
              ).paddingHorizontal(4),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              160.lorem(),
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ).paddingHorizontal(4),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                const Icon(
                  CupertinoIcons.location_solid,
                  color: AppColor.primaryColor,
                  size: 14,
                ),
                Text(
                  "Elbistan",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
                ).paddingHorizontal(4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
