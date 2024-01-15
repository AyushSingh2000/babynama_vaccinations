import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  late String previousPage;

  void setPreviousPage(String page) {
    previousPage = page;
    notifyListeners();
  }
}
