import 'package:flutter/material.dart';
import 'package:transaction_application/ui/pages/Home/home_page.dart';
import 'package:transaction_application/ui/pages/Map/Map-Page.dart';
import 'package:transaction_application/ui/pages/Profile/Profile-Page.dart';
import 'package:transaction_application/ui/pages/Setting/Setting-page.dart';
import 'package:transaction_application/ui/pages/Transfer/Transafer-page.dart';
import 'package:transaction_application/ui/theme/color/color.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  final List<Widget> _pages = const [
    HomePage(),
    Mappage(),
    TransferPage(),
    SettingPage(),
    ProfilePage(),
  ];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 90,

        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,

            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: AppColor.Black,
            unselectedItemColor: AppColor.Black.withOpacity(0.6),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
              BottomNavigationBarItem(
                icon: Icon(Icons.swap_horiz),
                label: 'Transfer',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
