import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:sasa_play/helpers/theme_changer.dart';
import 'package:sasa_play/screens/widgets/custom_buttons.dart';

import '../../utils/size_config.dart';

class SettingsMainPage extends StatefulWidget {
  const SettingsMainPage({Key? key}) : super(key: key);

  @override
  State<SettingsMainPage> createState() => _SettingsMainPageState();
}

class _SettingsMainPageState extends State<SettingsMainPage> {
  var phoneHeight = SizeConfig.screenHeight;
  var phoneWidth = SizeConfig.screenWidth;
  var themeProvider = Provider.of<ThemeChange>;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: Container(
        height: phoneHeight,
        width: phoneWidth,
        padding: EdgeInsets.symmetric(
            horizontal: getProportionalScreenWidth(20),
            vertical: getProportionalScreenHeight(5)),
        child: ListView(
          children: [
            FollowUnfollowButton(
              height: getProportionalScreenHeight(29),
              width: getProportionalScreenWidth(80),
              // fontSize: getProportionalScreenWidth(18),
              onPressed: () {},
              isfollow: false,
            ),
            FollowUnfollowButton(
              height: getProportionalScreenHeight(29),
              width: getProportionalScreenWidth(80),
              // fontSize: getProportionalScreenWidth(18),
              onPressed: () {},
              isfollow: true,
            ),
            ListTile(
              title: const Text("Change theme"),
              subtitle: const Text("Toggle between dark and light theme"),
              trailing: IconButton(
                onPressed: (() async {
                  themeProvider(context, listen: false)
                      .toggleCurrentThemeMode();
                  log("isDark ${themeProvider(context, listen: false).isDark}");
                }),
                icon: themeProvider(context, listen: true).isDark
                    ? const Icon(Icons.dark_mode)
                    : const Icon(Icons.light_mode),
              ),
              onTap: () {
                themeProvider(context, listen: false).toggleCurrentThemeMode();
              },
            ),
          ],
        ),
      ),
    );
  }
}
