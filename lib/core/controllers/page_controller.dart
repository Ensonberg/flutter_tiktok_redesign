import 'package:get/get.dart';

class MyPageController extends GetxController {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  selectedTab(index) {
    _pageIndex = index;
    update();
  }
}
