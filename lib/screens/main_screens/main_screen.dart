import 'dart:developer';
import 'dart:ui';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sasa_play/screens/homepage/homepage.dart';
import 'package:sasa_play/screens/profile/main_user_profile.dart';
import 'package:sasa_play/screens/settings/main_settings.dart';
import 'package:sasa_play/utils/app_constants.dart';
import 'package:sasa_play/utils/auth_manager.dart';
import 'package:sasa_play/utils/size_config.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentPage = 0;
  final AuthenticationManager _authenticationManager = AuthenticationManager();
  bool isLoggedIn = false;

  final List<Widget> _pages = [
    const HomePage(),
    const MyProfileMainPage(),
    const SettingsMainPage()
  ];

  var totalCoins = 0;

  @override
  void initState() {
    _authenticationManager.checkLoginStatus();
    isLoggedIn = _authenticationManager.isLogged.value;
    log("log in status: $isLoggedIn");

    super.initState();
  }

  onNavTapped(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Theme.of(context).primaryColor,
        style: TabStyle.flip,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.people, title: 'Profile'),
          TabItem(icon: Icons.settings, title: 'Settings'),
        ],
        onTap: (int i) => onNavTapped(i),
      ),
      body: _pages[_currentPage],
    );
  }
}
