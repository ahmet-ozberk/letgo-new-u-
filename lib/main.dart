import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:letgo/utils/app_color.dart';
import 'package:letgo/view/splash_view.dart';

void main() => runApp(const ProviderScope(child: LetGo()));

class LetGo extends StatelessWidget {
  const LetGo({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: 'letgo',
        debugShowCheckedModeBanner: false,
        navigatorKey: Grock.navigationKey,
        scaffoldMessengerKey: Grock.scaffoldMessengerKey,
        theme: ThemeData(primaryColor: AppColor.primaryColor, useMaterial3: true),
        home: const SplashView(),
      ),
    );
  }
}
