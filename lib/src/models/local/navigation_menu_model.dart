import 'package:flutter_loyalty_point/src/views/history/history_view.dart';
import 'package:flutter_loyalty_point/src/views/home/home_view.dart';
import 'package:flutter_loyalty_point/src/views/profile/profile_view.dart';

class NavigationMenuModel {
  const NavigationMenuModel({
    required this.label,
    required this.icon,
    required this.iconActive,
    required this.routeName,
  });

  final String label;
  final String icon;
  final String iconActive;
  final String routeName;

  static const List<NavigationMenuModel> menuList = [
    NavigationMenuModel(
      label: "Homepage",
      icon: "assets/icons/icon_menu_home_outline.svg",
      iconActive: "assets/icons/icon_menu_home_solid.svg",
      routeName: HomeView.routeName,
    ),
    NavigationMenuModel(
      label: "History",
      icon: "assets/icons/icon_menu_history_outline.svg",
      iconActive: "assets/icons/icon_menu_history_solid.svg",
      routeName: HistoryView.routeName,
    ),
    NavigationMenuModel(
      label: "Profile",
      icon: "assets/icons/icon_menu_profile_outline.svg",
      iconActive: "assets/icons/icon_menu_profile_solid.svg",
      routeName: ProfileView.routeName,
    ),
  ];
}
