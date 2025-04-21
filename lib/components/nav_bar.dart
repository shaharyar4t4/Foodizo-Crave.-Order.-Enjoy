import 'package:flutter/material.dart';
import 'package:shopstore/screen/view_order.dart';

import '../screen/view_dashbored.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  // List of widgets to display for each tab
  static final List<Widget> _pages = <Widget>[
    ViewDashbored(),
    Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
    OrderDetailsPage(),
    Center(child: Text('Chat Page', style: TextStyle(fontSize: 24))),
  ];

  late AnimationController _animationController;
  late Animation<double> _animation; // Removed 'late' to ensure initialization

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _animationController.reset();
      _animationController.forward(); // Trigger animation when switching tabs
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0.0, 0.1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.pink[300],
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(color: Colors.pink[300]),
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
            _buildNavItem(Icons.home, 'Home'),
            _buildNavItem(Icons.person, 'Profile'),
            _buildNavItem(Icons.shopping_cart, 'Cart'),
            _buildNavItem(Icons.chat_bubble, 'Chat'),
          ],
          selectedIconTheme: IconThemeData(color: Colors.pink[300], size: 28),
          unselectedIconTheme: IconThemeData(color: Colors.grey, size: 24),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: ScaleTransition(
        scale: _animation, // Ensure _animation is properly initialized
        child: Icon(icon, size: 24),
      ),
      label: label,
      backgroundColor: Colors.pink[100],
    );
  }
}
