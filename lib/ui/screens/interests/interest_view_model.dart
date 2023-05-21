import 'package:stacked/stacked.dart';

class InterestViewModel extends BaseViewModel {
  final List<String> _selectedList = [];

  List<String> get selectedList => _selectedList;
  final List<String> elements = [
    "Automobile",
    "Music",
    "Dancing",
    "Automobile",
    "Music",
    "Dancing",
    "Automobile",
    "Music",
    "Dancing",
    "Automobile",
    "Music",
    "Dancing",
    "Automobile",
    "Music",
    "Dancing",
    "Automobile",
    "Music",
    "Dancing",
  ];

  void addInterest(String interest) {
    if (_selectedList.contains(interest)) {
    } else {
      _selectedList.add(interest);
      notifyListeners();
    }
  }

  void removeInterest(String interest) {
    if (_selectedList.contains(interest)) {
      _selectedList.remove(interest);
      notifyListeners();
    } else {}
  }
}
