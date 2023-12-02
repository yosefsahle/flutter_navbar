import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:spirit_life/screens/home.dart';
import 'package:spirit_life/screens/AddUser.dart';
import 'package:spirit_life/screens/Setting.dart';
import 'package:spirit_life/screens/info.dart';
import 'package:spirit_life/screens/user.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List Screens = [AddUser(), User(), Home(), Setting(), Info()];
  int _selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.orange,
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        backgroundColor: Colors.orange,
        color: Colors.white,
        animationDuration: Duration(milliseconds: 300),
        items: [
          Icon(
            Icons.add,
            color: Colors.orange,
          ),
          Icon(
            Icons.people,
            color: Colors.orange,
          ),
          Icon(
            Icons.home,
            color: Colors.orange,
          ),
          Icon(
            Icons.settings,
            color: Colors.orange,
          ),
          Icon(
            Icons.info,
            color: Colors.orange,
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: Screens[_selectedIndex],
    );
  }
}
