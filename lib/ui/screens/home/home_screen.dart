import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import '../../theme/colors.dart';
import '../../widgets/post_feed_card.dart';
import '../../widgets/status_profile_circle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: Icon(
              IconlyLight.chat,
              size: 25.w,
              color: black,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Icon(
              IconlyLight.heart,
              size: 25.w,
              color: black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
                child: ListView(
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      height: 70.h,
                      width: 80.w,
                      child: Stack(
                        children: [
                          Container(
                            height: 70.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/pexels-creation-hill-1681010.jpg"),
                                    fit: BoxFit.cover),
                                color: Colors.red.withOpacity(0.1),
                                shape: BoxShape.circle),
                          ),
                          Positioned(
                            bottom: 30.w,
                            right: 0,
                            child: Container(
                              height: 20.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  size: 12.w,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    const StatusProfileCircle(
                      imagePath:
                          "assets/images/pexels-avonne-stalling-3916455.jpg",
                      seen: true,
                      name: "Avvone",
                    ),
                    const StatusProfileCircle(
                      imagePath: "assets/images/pexels-carol-wd-3454298.jpg",
                      seen: false,
                      name: "carol",
                    ),
                    const StatusProfileCircle(
                      imagePath: "assets/images/pexels-italo-melo-2379005.jpg",
                      seen: true,
                      name: "Italo",
                    ),
                    const StatusProfileCircle(
                      imagePath:
                          "assets/images/pexels-rachel-claire-5490276.jpg",
                      seen: false,
                      name: "Rachel",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 32.w),
                      child: const PostFeedCard(),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
