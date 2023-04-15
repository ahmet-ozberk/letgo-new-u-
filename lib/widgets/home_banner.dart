import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

import '../assets.dart';
import '../utils/app_color.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2560 / 780,
      child: Container(
        width: context.width,
        decoration:
            BoxDecoration(image: DecorationImage(image: AssetImage(Assets.images.imBannerPNG))),
        child: Row(
          children: [
            Expanded(
                child: GrockContainer(
              height: double.infinity,
              padding: 8.paddingOnlyBottom,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.3),
                ], begin: Alignment.centerRight, end: Alignment.centerLeft),
              ),
              alignment: Alignment.bottomCenter,
              child: Text(
                "Araba Al",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )),
            const VerticalDivider(width: 0, color: AppColor.primaryColor),
            Expanded(
                child: GrockContainer(
              height: double.infinity,
              padding: 8.paddingOnlyBottom,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.3),
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
              ),
              alignment: Alignment.bottomCenter,
              child: Text(
                "Araba Sat",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
