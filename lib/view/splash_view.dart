import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:letgo/assets.dart';
import 'package:letgo/extension/svg_color_filter.dart';
import 'package:letgo/utils/app_color.dart';
import 'package:letgo/view/base_view.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(1600.milliseconds, () {
      Grock.toRemove(const BaseView(),type: NavType.fade);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: GrockScaleAnimation(
            begin: 1,
            end: 0.8,
            duration: 1.seconds,
            delay: 400.milliseconds,
            child: SizedBox(
              width: context.width * 0.51,
              child: AspectRatio(
                aspectRatio: 1.6,
                child: SvgPicture.asset(
                  Assets.images.logoSVG,
                  colorFilter: Colors.white.toSvg,
                  fit: BoxFit.fill,
                ),
              ),
            )),
      ),
    );
  }
}
