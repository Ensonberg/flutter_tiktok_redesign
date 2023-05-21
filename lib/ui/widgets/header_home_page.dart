import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/home_screen/home_view_model.dart';

class HeaderHomePage extends StatelessWidget {
  final HomePageViewModel viewModel;
  const HeaderHomePage({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SvgPicture.asset(
          "assets/svgs/Search.svg",
          color: getColor(viewModel.pageIndex),
        ),
        Text("Following", style: getStyle(viewModel.pageIndex, 0)),
        Text("Discover", style: getStyle(viewModel.pageIndex, 1)),
        Text("Live", style: getStyle(viewModel.pageIndex, 2)),
        SvgPicture.asset(
          "assets/svgs/Notification.svg",
          color: getColor(viewModel.pageIndex),
        ),
      ],
    );
  }

  Color getColor(int index) {
    if (index == 0) {
      return Colors.black;
    } else if (index == 1) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  TextStyle getStyle(int index, int ind) {
    if (index == 0) {
      return TextStyle(
        fontSize: ind == viewModel.pageIndex ? 16 : 14,
        color: index == 0 ? Colors.black : Colors.black,
        fontWeight:
            ind == viewModel.pageIndex ? FontWeight.w700 : FontWeight.w500,
      );
    } else if (index == 1) {
      return TextStyle(
          fontSize: ind == viewModel.pageIndex ? 16 : 14,
          color: index == 1 ? Colors.white : Colors.black,
          fontWeight:
              ind == viewModel.pageIndex ? FontWeight.w700 : FontWeight.w500);
    } else {
      return TextStyle(
          fontSize: ind == viewModel.pageIndex ? 16 : 14,
          color: index == 2 ? Colors.black : Colors.white,
          fontWeight:
              ind == viewModel.pageIndex ? FontWeight.w700 : FontWeight.w500);
    }
  }
}
