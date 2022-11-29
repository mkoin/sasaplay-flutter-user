import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import 'show_snackbar.dart';


enum NavigationItem { Home,Settings }

class ServiceTypeNavigationProvider extends ChangeNotifier {
  int itemIndex = box.read("NavigationItemindex")??0;
  NavigationItem _navigationItem =
      NavigationItem.values.elementAt(box.read("NavigationItemindex") ?? 0);

  NavigationItem get navTypeItem => _navigationItem;

  void setNavigationItem(NavigationItem navigationItem) async {
    box.write("NavigationItemindex", NavigationItem.values.indexOf(navigationItem));
    _navigationItem = navigationItem;
    notifyListeners();
  }
}
