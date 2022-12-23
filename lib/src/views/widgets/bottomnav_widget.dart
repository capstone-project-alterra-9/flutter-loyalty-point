import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/models/local/navigation_menu_model.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key, required this.routeName});

  final String routeName;

  final List<NavigationMenuModel> menuList = NavigationMenuModel.menuList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Material(
        color: Colors.white,
        elevation: 6,
        borderRadius: BorderRadius.circular(15),
        child: Row(
          children: List.generate(
            menuList.length,
            (index) => Expanded(
              child: GestureDetector(
                onTap: () => Navigator.popAndPushNamed(
                  context,
                  menuList[index].routeName,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      menuList[index].routeName == routeName
                          ? SvgPicture.asset(menuList[index].iconActive)
                          : SvgPicture.asset(menuList[index].icon),
                      Text(menuList[index].label),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
