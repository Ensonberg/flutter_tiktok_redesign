import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ovatoyu/core/controllers/auth_controller.dart';
import 'package:ovatoyu/ui/screens/auth/phone_auth_screen.dart';
import 'package:ovatoyu/ui/theme/colors.dart';

class GettingStartedScreen extends StatefulWidget {
  static const routeName = "/auth_screen";
  const GettingStartedScreen({Key? key}) : super(key: key);

  @override
  State<GettingStartedScreen> createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: SizedBox(
        height: media.height,
        width: media.width,
        child: Stack(
          children: [
            Image.asset(
              "assets/svgs/Rectangle 161.png",
              fit: BoxFit.cover,
            ),
            Container(
              height: media.height,
              width: media.width,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 100),
                child: Column(
                  children: [
                    BackdropFilter(
                      filter: ui.ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                      child: Text(
                        "Find your hypebeast and share your style",
                        style: TextStyle(
                            fontSize: 56.sp,
                            fontWeight: FontWeight.w700,
                            color: white),
                      ),
                    ),
                    SizedBox(
                      height: 96.h,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .pushReplacementNamed(
                                      PhoneNumberAuthScreen.routeName),
                              child: Container(
                                height: 61.h,
                                decoration: BoxDecoration(
                                    color: black,
                                    borderRadius: BorderRadius.circular(40)),
                                child: Center(
                                  child: Text(
                                    "Sign up with Phone or Email",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: white),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 61.h,
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(40)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/svgs/google.png"),
                                  SizedBox(
                                    width: 23.w,
                                  ),
                                  // SvgPicture.string("assets/svgs/icons8-google-48 1.svg"),
                                  Text(
                                    "Sign up with Google",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: black),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 61.h,
                              decoration: BoxDecoration(
                                  color: Color(0xff3B5998),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/svgs/Vector.svg"),
                                  SizedBox(
                                    width: 23.w,
                                  ),
                                  Text(
                                    "Sign up with Facebook",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: white),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "Already have an account? Log in",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: white),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
