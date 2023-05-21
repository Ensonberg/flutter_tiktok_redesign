import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovatoyu/ui/screens/interests/interest_view_model.dart';
import 'package:ovatoyu/ui/screens/main_screen/main_screen.dart';
import 'package:stacked/stacked.dart';

import '../../theme/colors.dart';

class InterestScreen extends StatelessWidget {
  static const routeName = "/interest_screen";
  const InterestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InterestViewModel>.reactive(
        viewModelBuilder: () => InterestViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              extendBodyBehindAppBar: true,
              backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Select your favorite categories",
                        style: TextStyle(
                            fontSize: 35.sp,
                            fontFamily: "San Francisco",
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "What would you like to see?",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: "San Francisco",
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ),
                    Expanded(
                        child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 24,
                        // width / height: fixed for *all* items
                        childAspectRatio: 2,
                      ),
                      // return a custom ItemCard
                      itemBuilder: (context, index) => InterestItem(
                        text: model.elements[index],
                        model: model,
                      ),
                      itemCount: model.elements.length,
                    )),
                    MaterialButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            MainScreen.routeName, (route) => false);
                      },
                      child: Container(
                        padding: EdgeInsets.zero,
                        height: 56.h,
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(4)),
                        child: Center(
                          child: Text(
                            "Continue",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              MainScreen.routeName, (route) => false);
                        },
                        child: Container(
                          padding: EdgeInsets.zero,
                          height: 56.h,
                          decoration: BoxDecoration(
                              color: white,
                              border: Border.all(color: primary, width: 1.5),
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: primary),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ));
        });
  }
}

class InterestItem extends StatefulWidget {
  final InterestViewModel model;
  final String text;

  const InterestItem({
    Key? key,
    required this.model,
    required this.text,
  }) : super(key: key);

  @override
  State<InterestItem> createState() => _InterestItemState();
}

class _InterestItemState extends State<InterestItem>
    with AutomaticKeepAliveClientMixin {
  bool isSelected = false;
  Color color = Colors.black;
  Color containerColor = const Color(0xffF8F8F8);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        setState(() {
          isSelected = !isSelected;
          if (isSelected) {
            color = white;
            containerColor = primary;
            if (widget.model.selectedList.contains(widget.text)) {
            } else {
              widget.model.selectedList.add(widget.text);
            }
          } else {
            color = black;
            containerColor = Color(0xffF8F8F8);
            if (widget.model.selectedList.contains(widget.text)) {
              widget.model.selectedList.remove(widget.text);
            } else {}
          }
        });
      },
      padding: EdgeInsets.zero,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0), color: containerColor),
          child: Center(
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    widget.text,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: color),
                  )))),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
