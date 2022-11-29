import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart' as provider;
import 'package:sasa_play/screens/main_screens/splash_screen.dart';
import 'package:sasa_play/utils/custom_themes_colors.dart';

import 'helpers/theme_changer.dart';


void main()async {
  await GetStorage.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return provider.MultiProvider(providers: [
      provider.ChangeNotifierProvider(
        create: ((context) => ThemeChange()),
      ),
    
    ], child: const MyMaterialApp());
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'County services app',
        themeMode: provider.Provider.of<ThemeChange>(context, listen: true)
            .getCurrentThemeMode(),
        darkTheme: CustomThemeBlue().darkTheme,
        theme: CustomThemeBlue().lightTheme,
        home: const MysplashScreen());
  }
}

