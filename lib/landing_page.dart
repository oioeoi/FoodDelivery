import 'package:app1_flutter_training/nav_bar/cart.dart';
import 'package:app1_flutter_training/nav_bar/home.dart';
import 'package:app1_flutter_training/nav_bar/menu.dart';
import 'package:app1_flutter_training/nav_bar/profile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List _barPage = [UserHome(), UserMenu(), UserCart(), UserProfile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _barPage[selectedIndex],
      bottomNavigationBar: Material(
        elevation: 50,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Nav_bar(),
        ),
      ),
    );
  }

  Padding Nav_bar() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 15.0, bottom: 25, left: 20, right: 20),
      child: GNav(
          selectedIndex: selectedIndex,
          onTabChange: _navigateBottomBar,
          haptic: true, // haptic feedback
          tabBorderRadius: 30,
          gap: 10, // the tab button gap between icon and text
          color: Colors.green.shade300, // unselected icon color
          activeColor: Colors.green[500], // selected icon and text color
          iconSize: 24, // tab button icon size
          tabBackgroundColor:
              Colors.green.withOpacity(0.18), // selected tab background color
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          tabs: [
            GButton(
              icon: Icons.home_rounded,
              text: 'Home',
            ),
            GButton(
              icon: Icons.restaurant_menu,
              text: 'Menu',
            ),
            GButton(
              icon: Icons.shopping_bag_rounded,
              text: 'Cart',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ]),
    );
  }
}
