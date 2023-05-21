import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/colors.dart';

class EditProfileScreen extends StatelessWidget {
  static const routeName = "edit_profile_screen";

  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset("assets/svgs/BackArrow.svg"),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Edit Profile",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                child: Image.asset(
                  "assets/svgs/Ellipse 1.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Change profile photo",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: Colors.black),
            ),
            Text(
              "Full Name",
              style: TextStyle(
                  fontSize: 16.sp, fontWeight: FontWeight.w500, color: black),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Container(
                height: 56.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xffF2F2F2)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        color: black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      hintText: "Full name",
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
              height: 17.h,
            ),
            Text(
              "username",
              style: TextStyle(
                  fontSize: 16.sp, fontWeight: FontWeight.w500, color: black),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Container(
                height: 56.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xffF2F2F2)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        color: black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      hintText: "Full name",
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
          ],
        ),
      ),
    );
  }
}
