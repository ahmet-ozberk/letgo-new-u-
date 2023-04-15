import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:letgo/view/ads/ads_view.dart';
import 'package:letgo/view/chat/chat_view.dart';
import 'package:letgo/view/home/home_view.dart';
import 'package:letgo/view/profile/profile_view.dart';

final baseController = ChangeNotifierProvider((ref) => BaseController());

class BaseController extends ChangeNotifier {
  final List<BottomNavigationBarItem> navBarItems = const [
    BottomNavigationBarItem(
      icon: FaIcon(CupertinoIcons.house, size: 24),
      label: 'Ana Sayfa',
    ),
    BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.message, size: 20),
      label: 'Sohbetler',
    ),
    BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.heart, size: 20),
      label: 'İlanlarım',
    ),
    BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.user, size: 20),
      label: 'Profil',
    ),
  ];

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return const HomeView();
      case 1:
        return const ChatView();
      case 2:
        return const AdsView();
      case 3:
        return const ProfileView();
      default:
        return Container();
    }
  }
}
