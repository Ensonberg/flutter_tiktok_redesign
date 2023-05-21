import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ovatoyu/ui/screens/interests/interest_screen.dart';
import 'package:ovatoyu/ui/theme/colors.dart';

class UserDetailsScreen extends StatefulWidget {
  static const routeName = "user_details_screen";
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  bool _value = false;
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Text(
                "Enter your details",
                style: TextStyle(
                    fontSize: 24.sp, fontWeight: FontWeight.w700, color: black),
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                "Full name",
                style: TextStyle(
                    fontSize: 16.sp, fontWeight: FontWeight.w500, color: black),
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
                    child: TextField(
                      style: TextStyle(
                          color: Color(0xff979797),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        hintText: "Enter first and last name",
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            color: grey,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Date of Birth",
                style: TextStyle(
                    fontSize: 16.sp, fontWeight: FontWeight.w500, color: black),
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
                    child: TextField(
                      style: TextStyle(
                          color: Color(0xff979797),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        hintText: "Choose date of birth",
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            color: grey,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Gender",
                style: TextStyle(
                    fontSize: 16.sp, fontWeight: FontWeight.w500, color: black),
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
                            child: ListTile(
                              title: Text("Male",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: black)),
                              leading: Radio(
                                value: 1,
                                activeColor: primary,
                                groupValue: val,
                                onChanged: (value) {
                                  setState(() {
                                    val = value as int;
                                  });
                                },
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: ListTile(
                              title: Text("Female",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: black)),
                              leading: Radio(
                                value: 2,
                                activeColor: primary,
                                groupValue: val,
                                onChanged: (value) {
                                  setState(() {
                                    val = value as int;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Country",
                style: TextStyle(
                    fontSize: 16.sp, fontWeight: FontWeight.w500, color: black),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Choose country",
                          style: TextStyle(
                              color: Color(0xff979797),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        SvgPicture.asset(
                          "assets/svgs/down.svg",
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "City",
                style: TextStyle(
                    fontSize: 16.sp, fontWeight: FontWeight.w500, color: black),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Container(
                  height: 56.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xffF2F2F2)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Choose city",
                          style: TextStyle(
                              color: Color(0xff979797),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        SvgPicture.asset(
                          "assets/svgs/down.svg",
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      InterestScreen.routeName, (route) => false);
                },
                child: Container(
                  padding: EdgeInsets.zero,
                  height: 56.h,
                  decoration: BoxDecoration(
                      color: primary, borderRadius: BorderRadius.circular(4)),
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
          ),
        ),
      ),
    );
  }
}
