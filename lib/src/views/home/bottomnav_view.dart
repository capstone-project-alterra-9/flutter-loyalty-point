import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/views/home/home_view.dart';
import 'package:flutter_loyalty_point/src/views/profile/profile_view.dart';
import 'package:flutter_loyalty_point/src/views/qr/qr_view.dart';

class BottomNavView extends StatefulWidget {
  static const routeName = "/bottomNav";
  const BottomNavView({super.key});

  @override
  State<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green[900],
        child: Image.asset(
          "assets/images/qr_icon.png",
          width: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profiles")
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueGrey,
        onTap: _onItemTapped,
      ),
    );
  }
}
