import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ovatoyu/core/controllers/add_video_controller.dart';
import 'package:ovatoyu/ui/screens/main_screen/main_screen.dart';
import 'package:ovatoyu/ui/theme/colors.dart';
import 'package:video_trimmer/video_trimmer.dart';

class ShareVideoScreen extends StatefulWidget {
  static const routeName = "/share_video_screen";
  const ShareVideoScreen({Key? key}) : super(key: key);

  @override
  State<ShareVideoScreen> createState() => _ShareVideoScreenState();
}

class _ShareVideoScreenState extends State<ShareVideoScreen> {
  AddVideoController controller = Get.find();
  final Trimmer _trimmer = Trimmer();

  bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        //textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        //textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  void didChangeDependencies() async {
    await _trimmer.loadVideo(videoFile: File(controller.trimmedVideo.path));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1.0,
        title: const Text(
          "Share",
          style: TextStyle(
              color: black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: media.height * 0.03,
          ),
          Center(
            child: SizedBox(
              height: media.height * 0.42,
              width: media.width * 0.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: VideoViewer(
                  trimmer: _trimmer,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: TextField(
              style: TextStyle(
                  color: white, fontSize: 14.sp, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                hintText: "Write a caption...",
                border: InputBorder.none,
                hintStyle: TextStyle(
                    color: grey, fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset(
              "assets/svgs/location-add.svg",
              width: 17.25.w,
              height: 20.h,
            ),
            title: Text(
              "Add Location",
              style: TextStyle(
                  color: black, fontSize: 14.sp, fontWeight: FontWeight.w400),
            ),
            trailing: SvgPicture.asset(
              "assets/svgs/next.svg",
              color: Colors.black,
              width: 7.3.w,
              height: 16.h,
            ),
          ),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset(
              "assets/svgs/Viewing.svg",
              width: 17.25.w,
              color: black,
              height: 20.h,
            ),
            title: Text(
              "Visible to everyone",
              style: TextStyle(
                  color: black, fontSize: 14.sp, fontWeight: FontWeight.w400),
            ),
            trailing: SvgPicture.asset(
              "assets/svgs/next.svg",
              color: Colors.black,
              width: 7.3.w,
              height: 16.h,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Allow Comments',
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
                Switch(
                  onChanged: toggleSwitch,
                  value: isSwitched,
                  activeColor: primary,
                  activeTrackColor: grey,
                  inactiveThumbColor: grey,
                  inactiveTrackColor: grey,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Flexible(
                child: MaterialButton(
                  onPressed: () {},
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: grey)),
                    child: Center(
                      child: Text(
                        "Save Draft",
                        style: TextStyle(
                            color: black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        MainScreen.routeName, (route) => false);
                  },
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4), color: primary),
                    child: Center(
                      child: Text(
                        "Post",
                        style: TextStyle(
                            color: white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
