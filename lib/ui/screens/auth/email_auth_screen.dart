import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ovatoyu/core/controllers/auth_controller.dart';
import 'package:ovatoyu/ui/screens/auth/phone_auth_screen.dart';
import 'package:ovatoyu/ui/screens/auth/user_details_screen.dart';
import 'package:ovatoyu/ui/theme/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EmailAuthScreen extends StatefulWidget {
  static const routeName = "/email_auth_screen";
  const EmailAuthScreen({Key? key}) : super(key: key);

  @override
  State<EmailAuthScreen> createState() => _EmailAuthScreenState();
}

class _EmailAuthScreenState extends State<EmailAuthScreen> {
  bool isVerify = false;
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: controller.isEmailOtp == false
              ? Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Text(
                          "Email Address",
                          style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                              color: black),
                        ),
                        Text(
                          "We will send you a confirmation code",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: black),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Text(
                          "Email Address",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: black),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Container(
                            height: 56.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Color(0xffF2F2F2)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: TextField(
                                      style: TextStyle(
                                          color: Color(0xff979797),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400),
                                      decoration: InputDecoration(
                                        hintText: "Enter your email address",
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                            color: grey,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, PhoneNumberAuthScreen.routeName);
                          },
                          child: Text(
                            "Use phone number instead",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: primary),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    MaterialButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        _authController.changeEmailOtp(true);
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
                    )
                  ],
                )
              : const VerifyWidget(),
        );
      }),
    );
  }
}

class VerifyWidget extends StatefulWidget {
  const VerifyWidget({Key? key}) : super(key: key);

  @override
  State<VerifyWidget> createState() => _VerifyWidgetState();
}

class _VerifyWidgetState extends State<VerifyWidget> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  final AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Text(
              "Enter Code Sent To Your Email Address",
              style: TextStyle(
                  fontSize: 24.sp, fontWeight: FontWeight.w700, color: black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "We sent the code to ",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: black),
                    ),
                    Text(
                      "test@gmail.com",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: black),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    _authController.changeEmailOtp(false);
                  },
                  child: Text(
                    "Edit",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.double,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: black),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            Text(
              "OTP",
              style: TextStyle(
                  fontSize: 16.sp, fontWeight: FontWeight.w500, color: black),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: PinCodeTextField(
                length: 4,
                obscureText: true,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 56.h,
                    fieldWidth: 68.62.w,
                    activeFillColor: Colors.white,
                    inactiveColor: grey,
                    selectedColor: primary,
                    selectedFillColor: primary,
                    activeColor: grey,
                    inactiveFillColor: grey),
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                errorAnimationController: errorController,
                controller: textEditingController,
                onCompleted: (v) {
                  print("Completed");
                },
                onChanged: (value) {
                  print(value);
                  setState(() {
                    //currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
                appContext: context,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Text(
                  "Resend code in",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: grey),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "01:24",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: primary),
                  ),
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        MaterialButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                UserDetailsScreen.routeName, (route) => false);
          },
          child: Container(
            padding: EdgeInsets.zero,
            height: 56.h,
            decoration: BoxDecoration(
                color: primary, borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: Text(
                "Verify OTP",
                style: TextStyle(
                    fontSize: 18.sp, fontWeight: FontWeight.w500, color: white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
