import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:ovatoyu/ui/screens/home_screen/home_page.dart';
import 'package:ovatoyu/ui/screens/home_screen/pages/message/message_page.dart';
import 'package:ovatoyu/ui/screens/join_a_competition/join_competition_screen.dart';
import 'package:ovatoyu/ui/screens/main_screen/main_screen_view_model.dart';
import 'package:ovatoyu/ui/screens/profile/profile_screen.dart';
import 'package:ovatoyu/ui/screens/video/start_video/start_video_screen.dart';
import 'package:ovatoyu/ui/theme/colors.dart';
import 'package:stacked/stacked.dart';

import '../video/upload_video/upload_video.dart';

class MainScreen extends StatefulWidget {
  static const routeName = "/main_screen";
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isCompetition = true;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainScreenViewModel>.reactive(
        viewModelBuilder: () => MainScreenViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            body: getBody(model),
            bottomNavigationBar: getFooter(model),
          );
        });
  }

  Widget getBody(MainScreenViewModel viewModel) {
    return IndexedStack(
      index: viewModel.pageIndex,
      children: <Widget>[
        HomePage(),
        const Center(child: JoinCompetitionScreen()),
        const Center(),
        const Center(child: MessagePage()),
        const Center(child: ProfileScreen())
      ],
    );
  }

  Widget getFooter(MainScreenViewModel viewModel) {
    List bottomItems = [
      {"svg": "assets/svgs/Home.svg", "label": "Home", "isIcon": true},
      {"svg": "assets/svgs/video.svg", "label": "Discover", "isIcon": true},
      {
        "svg": "assets/svgs/Add.svg",
        "label": "add",
        "isIcon": true,
      },
      {"svg": "assets/svgs/Message.svg", "label": "Inbox", "isIcon": true},
      {"svg": "", "label": "", "isIcon": false},
    ];
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(color: appBgColor),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            return bottomItems[index]['isIcon']
                ? InkWell(
                    onTap: () {
                      if (bottomItems[index]['label'] == "add") {
                        showMaterialModalBottomSheet(
                          elevation: 4.0,
                          context: context,
                          builder: (context) => Material(
                            child: Container(
                              color: Colors.white,
                              height: 300,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      hoverColor: Colors.red,
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed(
                                                StartVideoScreen.routeName)
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
                                        Navigator.of(context)
                                            .pushNamed(
                                                JoinCompetitionScreen.routeName)
                                            .then((value) =>
                                                Navigator.of(context).pop());
                                      },
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          radius: 25,
                                          backgroundColor: grey,
                                          child: SvgPicture.asset(
                                            "assets/svgs/video.svg",
                                            height: 20,
                                            color: Colors.black,
                                            width: 20,
                                          ),
                                        ),
                                        title: const Text(
                                          "Join a Competition",
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
                                      onTap: () {},
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          radius: 25,
                                          backgroundColor: grey,
                                          child: SvgPicture.asset(
                                            "assets/svgs/add_competition.svg",
                                            height: 20,
                                            color: Colors.black,
                                            width: 20,
                                          ),
                                        ),
                                        title: const Text(
                                          "Start a competition",
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
                                        Navigator.of(context)
                                            .pushNamed(
                                                UploadVideoScreen.routeName)
                                            .then((value) =>
                                                Navigator.of(context).pop());
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
                        // showMaterialModalBottomSheet(
                        //   context: context,
                        //   builder: (context) => SingleChildScrollView(
                        //     controller: ModalScrollController.of(context),
                        //     child: Container(
                        //       color: Colors.red,
                        //       height: 200,
                        //     ),
                        //   ),
                        // );
                      } else {
                        viewModel.selectedTab(index);
                      }
                    },
                    child: bottomItems[index]['label'] == "add"
                        ? Material(
                            elevation: 2.0,
                            color: Colors.transparent,
                            child: Container(
                              height: 60.h,
                              width: 60.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xffFE2C55),
                                      Color(0xff46A8D1),
                                      Color(0xff9038BA),
                                    ],
                                  )),
                              child: Center(
                                child: Container(
                                  height: 54.h,
                                  width: 54.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.black, width: 2)),
                                  child: LineIcon(
                                    LineIcons.plus,
                                    size: 35,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Center(
                            child: SvgPicture.asset(
                              bottomItems[index]['svg'],
                              height: 25.h,
                              width: 25.w,
                            ),
                          ),
                  )
                : InkWell(
                    onTap: () {
                      viewModel.selectedTab(index);
                    },
                    child: Center(
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/svgs/Ellipse 1.png"))),
                      ),
                    ));
          }),
        ),
      ),
    );
  }
}
