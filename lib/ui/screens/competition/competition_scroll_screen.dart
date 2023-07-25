import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:ovatoyu/ui/theme/colors.dart';

import '../../../core/constant/data_json.dart';
import '../../widgets/video_player_widget.dart';
import '../video/start_video/start_video_screen.dart';
import '../video/upload_video/upload_video.dart';

class CompetitionScrollScreen extends StatefulWidget {
  static const routeName = "/competition_scroll_screen";
  const CompetitionScrollScreen({Key? key}) : super(key: key);

  @override
  State<CompetitionScrollScreen> createState() =>
      _CompetitionScrollScreenState();
}

class _CompetitionScrollScreenState extends State<CompetitionScrollScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: items.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
            onTap: () {
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
                      ));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SvgPicture.asset(
                "assets/svgs/Camera.svg",
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: RotatedBox(
        quarterTurns: 1,
        child: TabBarView(
          controller: _tabController,
          children: List.generate(items.length, (index) {
            return VideoPlayerItem(
              isCompetition: true,
              videoUrl: items[index]['videoUrl'],
              size: size,
              name: items[index]['name'],
              caption: items[index]['caption'],
              songName: items[index]['songName'],
              profileImg: items[index]['profileImg'],
              likes: items[index]['likes'],
              comments: items[index]['comments'],
              shares: items[index]['shares'],
              albumImg: items[index]['albumImg'],
            );
          }),
        ),
      ),
    );
  }
}
