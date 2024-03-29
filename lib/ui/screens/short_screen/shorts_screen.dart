import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ovatoyu/core/constant/data_json.dart';
import 'package:ovatoyu/core/controllers/add_video_controller.dart';

import 'package:ovatoyu/ui/widgets/header_home_page.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/video_player_widget.dart';
import 'pages/discover/discover_page.dart';
import 'pages/following/following_page.dart';
import 'pages/live/live_page.dart';
import 'shorts_view_model.dart';

class ShortsScreen extends StatefulWidget {
  static const routeName = "/homeScreen";
  @override
  _ShortsScreenState createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: items.length, vsync: this);
    _pageController = PageController(
      initialPage: 1,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AddVideoController controller = Get.put(AddVideoController());
    return ViewModelBuilder<ShortsViewModel>.reactive(
        viewModelBuilder: () => ShortsViewModel(),
        builder: (context, model, child) {
          _pageController.addListener(() {
            model.selectedTab(_pageController.page!.toInt());
          });
          return DiscoverPage();
        });
  }

  Widget profileView() {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Container(
              color: Colors.white,
              child: Column(children: [
                Container(
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black12))),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back_ios),
                      Text(
                        "Charlotte Stone",
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.more_horiz)
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://www.andersonsobelcosmetic.com/wp-content/uploads/2018/09/chin-implant-vs-fillers-best-for-improving-profile-bellevue-washington-chin-surgery.jpg",
                            height: 100.0.h,
                            width: 100.0.w,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "@Charlotte21",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "232",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Following",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        Container(
                          color: Colors.black54,
                          width: 1,
                          height: 15,
                          margin: EdgeInsets.symmetric(horizontal: 15),
                        ),
                        Column(
                          children: [
                            Text(
                              "1.3k",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Followers",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        Container(
                          color: Colors.black54,
                          width: 1,
                          height: 15,
                          margin: EdgeInsets.symmetric(horizontal: 15),
                        ),
                        Column(
                          children: [
                            Text(
                              "12k",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Likes",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 140,
                          height: 47,
                          decoration: BoxDecoration(
                            color: Colors.pink[500],
                          ),
                          child: Center(
                            child: Text(
                              "Follow",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 45,
                          height: 47,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12)),
                          child: Center(child: Icon(Icons.camera_alt)),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 35,
                          height: 47,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12)),
                          child: Center(child: Icon(Icons.arrow_drop_down)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.menu),
                              SizedBox(
                                height: 7,
                              ),
                              Container(
                                color: Colors.black,
                                height: 2,
                                width: 55,
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.favorite_border,
                                color: Colors.black26,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Container(
                                color: Colors.transparent,
                                height: 2,
                                width: 55,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 160,
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                border: Border.all(
                                    color: Colors.white70, width: .5)),
                            child: FittedBox(
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl:
                                    "https://media.giphy.com/media/tOueglJrk5rS8/giphy.gif",
                                placeholder: (context, url) => Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 160,
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                border: Border.all(
                                    color: Colors.white70, width: .5)),
                            child: FittedBox(
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl:
                                    "https://media.giphy.com/media/665IPY24jyWFa/giphy.gif",
                                placeholder: (context, url) => Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 160,
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                border: Border.all(
                                    color: Colors.white70, width: .5)),
                            child: FittedBox(
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl:
                                    "https://media.giphy.com/media/chjX2ypYJKkr6/giphy.gif",
                                placeholder: (context, url) => Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 160,
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                border: Border.all(
                                    color: Colors.white70, width: .5)),
                            child: FittedBox(
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl:
                                    "https://media.giphy.com/media/sC60eX0OVIH7O/giphy.gif",
                                placeholder: (context, url) => Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 160,
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                border: Border.all(
                                    color: Colors.white70, width: .5)),
                            child: FittedBox(
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl:
                                    "https://media.giphy.com/media/NsXhybxnMKsh2/giphy.gif",
                                placeholder: (context, url) => Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 160,
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                border: Border.all(
                                    color: Colors.white70, width: .5)),
                            child: FittedBox(
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl:
                                    "https://media.giphy.com/media/HE6hyf47yAX1S/giphy.gif",
                                placeholder: (context, url) => Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ]))),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return RotatedBox(
      quarterTurns: 1,
      child: TabBarView(
        controller: _tabController,
        children: List.generate(items.length, (index) {
          return VideoPlayerItem(
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
    );
  }
}
