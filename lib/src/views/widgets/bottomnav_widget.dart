import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/views/history/history_view.dart';
import 'package:flutter_loyalty_point/src/views/home/home_view.dart';
import 'package:flutter_loyalty_point/src/views/profile/profile_view.dart';
import 'package:flutter_loyalty_point/src/views/qr/qr_view.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key, required this.routeName});

  final String routeName;

  final List<BottomNavigationBarItem> _navList = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profiles")
  ];

  final List<String> _routeList = const [
    HomeView.routeName,
    HistoryView.routeName,
    ProfileView.routeName,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _navList,
      currentIndex: _routeList.indexOf(routeName),
      onTap: (value) => Navigator.pushNamed(context, _routeList[value]),
    );
  }
}
