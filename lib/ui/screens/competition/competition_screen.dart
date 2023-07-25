import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:ovatoyu/ui/screens/competition/competition_scroll_screen.dart';
import 'package:ovatoyu/ui/screens/video/start_video/start_video_screen.dart';
import 'package:ovatoyu/ui/theme/colors.dart';

import '../video/upload_video/upload_video.dart';

class CompetitionScreen extends StatelessWidget {
  static const routeName = "/competition_screen";
  const CompetitionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
      'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
      'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
      'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
      'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
    ];
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: SvgPicture.asset("assets/svgs/BackArrow.svg")),
        ),
        leadingWidth: 40.w,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            tileMode: TileMode.clamp,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.grey,
            ],
          )),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SizedBox(
                  height: 120.h,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Container(
                            height: 154.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Container(
                            height: 154.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "TOGETHERNESS",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: black,
                                      fontSize: 20.sp),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "#WEARETOGETHER",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: black,
                                          fontSize: 12.sp),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/svgs/people.svg",
                                      height: 14.h,
                                      width: 20.w,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                        "72 Participants",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: black,
                                            fontSize: 12.sp),
                                      ),
                                    ),
                                  ],
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Container(
                                      height: 32.h,
                                      width: 113.w,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: grey),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Center(
                                        child: Text(
                                          "Vote participant",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: black,
                                              fontSize: 12.sp),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 26.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/svgs/info.svg",
                      height: 24.h,
                      width: 24.w,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        height: 35.h,
                        width: 280.w,
                        child: Wrap(
                          children: [
                            Text(
                              "You can join this competition by clicking on the button below",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: black,
                                  fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 22.h,
              ),
              SizedBox(
                height: 320.h,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: imageList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(CompetitionScrollScreen.routeName);
                          },
                          child: Container(
                            padding: EdgeInsets.zero,
                            height: 300.h,
                            width: 160.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.black,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.5),
                                    BlendMode.dstATop),
                                image: NetworkImage(
                                  imageList[index],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              TextButton(
                  onPressed: () {
                    showMaterialModalBottomSheet(
                      elevation: 4.0,
                      context: context,
                      builder: (context) => Material(
                        child: Container(
                          color: Colors.white,
                          height: 150.h,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  hoverColor: Colors.red,
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(StartVideoScreen.routeName)
                                        .then((value) =>
                                            Navigator.of(context).pop());
                                  },
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: grey,
                                      child: SvgPicture.asset(
                                        "assets/svgs/uplaod_video.svg",
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                    title: const Text(
                                      "Start a video",
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  hoverColor: Colors.red,
                                  onTap: () {
                                    // Navigator.of(context)
                                    //     .pushNamed(UploadVideoScreen.routeName)
                                    //     .then((value) =>
                                    //         Navigator.of(context).pop());
                                  },
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: grey,
                                      child: SvgPicture.asset(
                                        "assets/svgs/act btn send.svg",
                                        height: 20,
                                        width: 20,
                                        color: black,
                                      ),
                                    ),
                                    title: const Text(
                                      "Upload Video",
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.zero,
                    height: 48.h,
                    width: 170.w,
                    decoration: BoxDecoration(
                        color: primary, borderRadius: BorderRadius.circular(4)),
                    child: Center(
                      child: Text(
                        "Join Competition",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: white,
                            fontSize: 13.sp),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
