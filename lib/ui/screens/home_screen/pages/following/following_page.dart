import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovatoyu/ui/screens/home_screen/pages/following/following_view_model.dart';
import 'package:ovatoyu/ui/styles/color.dart';
import 'package:stacked/stacked.dart';

import '../../../../theme/colors.dart';

class FollowingPage extends StatelessWidget {
  const FollowingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FollowingViewModel>.reactive(
        viewModelBuilder: () => FollowingViewModel(),
        builder: (context, model, child) {
          return Material(
            color: Colors.white54,
            child: Column(
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TopFollowerWidget(
                        height: 100.h,
                        width: 80.w,
                        index: 2,
                      ),
                      TopFollowerWidget(
                        height: 120.h,
                        width: 100.w,
                        index: 1,
                      ),
                      TopFollowerWidget(
                        height: 80.h,
                        width: 80.w,
                        index: 3,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    itemCount: 3,
                    itemBuilder: (ctx, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          elevation: 2.0,
                          child: SizedBox(
                              height: 78.h,
                              width: 241.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    child: Image.asset(
                                        "assets/svgs/Ellipse 1.png"),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "David Herman",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.sp,
                                            color: black),
                                      ),
                                      Text(
                                        "@davherman",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: 10.sp,
                                            color: black),
                                      ),
                                    ],
                                  ),
                                  MaterialButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {},
                                    child: Container(
                                      padding: EdgeInsets.zero,
                                      height: 30.h,
                                      width: 66.w,
                                      decoration: BoxDecoration(
                                          color: primary,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Center(
                                        child: Text(
                                          "Follow",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        )),
                  ),
                ),
                SizedBox(
                  height: 80.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    itemCount: 3,
                    itemBuilder: (ctx, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          elevation: 2.0,
                          child: SizedBox(
                              height: 78.h,
                              width: 241.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    child: Image.asset(
                                        "assets/svgs/Ellipse 1.png"),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "David Herman",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.sp,
                                            color: black),
                                      ),
                                      Text(
                                        "@davherman",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: 10.sp,
                                            color: black),
                                      ),
                                    ],
                                  ),
                                  MaterialButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {},
                                    child: Container(
                                      padding: EdgeInsets.zero,
                                      height: 30.h,
                                      width: 66.w,
                                      decoration: BoxDecoration(
                                          color: primary,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Center(
                                        child: Text(
                                          "Follow",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        )),
                  ),
                ),
                SizedBox(
                  height: 80.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    itemCount: 3,
                    itemBuilder: (ctx, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          elevation: 2.0,
                          child: SizedBox(
                              height: 78.h,
                              width: 241.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    child: Image.asset(
                                        "assets/svgs/Ellipse 1.png"),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "David Herman",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.sp,
                                            color: black),
                                      ),
                                      Text(
                                        "@davherman",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: 10.sp,
                                            color: black),
                                      ),
                                    ],
                                  ),
                                  MaterialButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {},
                                    child: Container(
                                      padding: EdgeInsets.zero,
                                      height: 30.h,
                                      width: 66.w,
                                      decoration: BoxDecoration(
                                          color: primary,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Center(
                                        child: Text(
                                          "Follow",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        )),
                  ),
                ),
                SizedBox(
                  height: 80.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    itemCount: 3,
                    itemBuilder: (ctx, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          elevation: 2.0,
                          child: SizedBox(
                              height: 78.h,
                              width: 241.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    child: Image.asset(
                                        "assets/svgs/Ellipse 1.png"),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "David Herman",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.sp,
                                            color: black),
                                      ),
                                      Text(
                                        "@davherman",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: 10.sp,
                                            color: black),
                                      ),
                                    ],
                                  ),
                                  MaterialButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {},
                                    child: Container(
                                      padding: EdgeInsets.zero,
                                      height: 30.h,
                                      width: 66.w,
                                      decoration: BoxDecoration(
                                          color: primary,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Center(
                                        child: Text(
                                          "Follow",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        )),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class TopFollowerWidget extends StatelessWidget {
  final double width;
  final double height;
  final int index;
  const TopFollowerWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 120.h,
          width: 100.w,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.zero,
                height: height * 0.9,
                width: width * 0.9,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      //begin: Alignment.topRight,
                      // end: Alignment.bottomLeft,
                      colors: [
                        Color(0xffFE2C55),
                        Color(0xff46A8D1),
                        Color(0xff9038BA),
                      ],
                    )),
                child: Center(
                    child: Container(
                  height: height * 0.8,
                  width: width * 0.85,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage('assets/svgs/Ellipse 1.png'),
                          fit: BoxFit.contain)),
                )),
              ),
              Positioned(
                bottom: 5,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.zero,
                  height: 30.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Center(
                    child: Container(
                      height: 30.h,
                      width: 25.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      child: Center(
                          child: Text(
                        "$index",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                            color: Colors.white),
                      )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Text(
          "David Herman",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
          ),
        ),
        Text(
          "David Herman",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 10.sp,
          ),
        ),
        MaterialButton(
          color: OColor.primaryColor,
          onPressed: () {},
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "following",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
