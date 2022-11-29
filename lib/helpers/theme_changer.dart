import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ThemeChange extends ChangeNotifier {
  final box = GetStorage();
  bool isDark =  GetStorage().read("isDark") ?? true;

  getCurrentThemeMode() {
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  toggleCurrentThemeMode() {
    isDark = !isDark;

    box.write("isDark", isDark);

    notifyListeners();
  }
}
