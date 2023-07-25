import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:ovatoyu/ui/screens/join_a_competition/join_competition_screen.dart';
import 'package:ovatoyu/ui/screens/main_screen/main_screen_view_model.dart';
import 'package:ovatoyu/ui/screens/profile/profile_screen.dart';
import 'package:ovatoyu/ui/screens/video/start_video/start_video_screen.dart';
import 'package:ovatoyu/ui/theme/colors.dart';
import 'package:stacked/stacked.dart';

import '../home/home_screen.dart';
import '../short_screen/shorts_screen.dart';
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
            backgroundColor:
                model.pageIndex == 3 ? Colors.transparent : Colors.white,
            body: getBody(model),
            bottomNavigationBar: Footer(
              viewModel: model,
            ),
          );
        });
  }

  Widget getBody(MainScreenViewModel viewModel) {
    return IndexedStack(
      index: viewModel.pageIndex,
      children: [
        HomeScreen(),
        const Center(child: JoinCompetitionScreen()),
        const Center(),
        ShortsScreen(),
        const Center(child: ProfileScreen())
      ],
    );
  }
}

class Footer extends StatefulWidget {
  final MainScreenViewModel viewModel;
  const Footer({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  List bottomItems = [
    {"svg": FontAwesomeIcons.house, "label": "Home", "isIcon": true},
    {
      "svg": FontAwesomeIcons.magnifyingGlass,
      "label": "Search",
      "isIcon": true
    },
    {
      "svg": "assets/svgs/Add.svg",
      "label": "add",
      "isIcon": true,
    },
    {"svg": FontAwesomeIcons.circlePlay, "label": "Shorts", "isIcon": true},
    {"svg": FontAwesomeIcons.user, "label": "Profile", "isIcon": false},
  ];
  bool isAddButton = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 70.h,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(bottomItems.length, (index) {
              return TextButton(
                onPressed: () {
                  if (bottomItems[index]['label'] == "add") {
                    // if (!isAddButton) {
                    //   Navigator.maybeOf(context)!.pop();
                    // }
                    setState(() {
                      isAddButton = !isAddButton;
                    });
                    showDialog(
                      useSafeArea: true,
                      context: context,
                      barrierDismissible: true,
                      builder: (context) => SimpleDialog(
                        alignment: Alignment.bottomCenter,
                        insetPadding: EdgeInsets.zero,
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        children: [
                          SizedBox(
                            height: 350.h,
                            width: MediaQuery.maybeOf(context)!.size.width,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    height: 250.h,
                                    width: 250.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            hoverColor: Colors.red,
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushNamed(StartVideoScreen
                                                      .routeName)
                                                  .then((value) =>
                                                      Navigator.of(context)
                                                          .pop());
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
                                                    fontWeight:
                                                        FontWeight.w400),
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
                                                      JoinCompetitionScreen
                                                          .routeName)
                                                  .then((value) =>
                                                      Navigator.of(context)
                                                          .pop());
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
                                                    fontWeight:
                                                        FontWeight.w400),
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
                                                    fontWeight:
                                                        FontWeight.w400),
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
                                              //     .pushNamed(
                                              //         UploadVideoScreen.routeName)
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
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
                    widget.viewModel.selectedTab(index);
                  }
                },
                child: bottomItems[index]['label'] == "add"
                    ? Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Center(
                          child: FaIcon(
                            isAddButton
                                ? FontAwesomeIcons.xmark
                                : FontAwesomeIcons.plus,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            bottomItems[index]['svg'],
                            color: widget.viewModel.pageIndex == index
                                ? Theme.of(context).primaryColor
                                : grey,
                            size: 20.w,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            bottomItems[index]['label'],
                            style: TextStyle(
                                color: widget.viewModel.pageIndex == index
                                    ? Theme.of(context).primaryColor
                                    : grey,
                                fontSize: 10.sp),
                          ),
                        ],
                      ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
