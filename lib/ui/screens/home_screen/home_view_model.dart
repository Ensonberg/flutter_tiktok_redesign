import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

class HomePageViewModel extends BaseViewModel {
  int _pageIndex = 1;

  int get pageIndex => _pageIndex;

  selectedTab(index) {
    _pageIndex = index;
    notifyListeners();
  }

  void setActualScreen(index) {
    _pageIndex = index;
    if (index == 0) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }
    notifyListeners();
  }
}
