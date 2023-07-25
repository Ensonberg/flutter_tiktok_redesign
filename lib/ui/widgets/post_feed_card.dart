import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../theme/colors.dart';

class PostFeedCard extends StatefulWidget {
  const PostFeedCard({
    super.key,
  });

  @override
  State<PostFeedCard> createState() => _PostFeedCardState();
}

class _PostFeedCardState extends State<PostFeedCard> {
  final PageController _pageController = PageController(initialPage: 0);
  int _activePage = 0;
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            minVerticalPadding: 0,
            minLeadingWidth: 0,
            trailing: Icon(
              IconlyLight.more_circle,
              size: 25.w,
              color: black,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "anny_willson",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  "Marketing Coordinator",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.grey),
                )
              ],
            ),
            dense: false,
            leading: Container(
              height: 40.h,
              width: 40.h,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/pexels-নাওমী-মাহজাবিন-3444087.jpg",
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 300.h,
            width: 400.w,
            child: Stack(
              children: [
                PageView(
                    controller: _pageController,
                    onPageChanged: (page) {
                      setState(() {
                        _activePage = page;
                      });
                    },
                    children: List.generate(
                      6,
                      (index) => SizedBox(
                        height: 300.h,
                        width: 400.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(32.w),
                          child: Image.asset(
                            "assets/images/pexels-নাওমী-মাহজাবিন-3444087.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )),
                Positioned(
                  child: _buildPageIndicator(),
                  bottom: 0,
                  left: 0,
                  right: 0,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: Row(
                        children: [
                          Icon(IconlyLight.heart,
                              size: 25.sp,
                              color: isFavorite
                                  ? Theme.of(context).primaryColor
                                  : black),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            "44,389",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, color: black),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Row(
                      children: [
                        Icon(
                          IconlyLight.chat,
                          size: 25.sp,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          "44,389",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Icon(
                      IconlyLight.send,
                      size: 25.sp,
                    ),
                  ],
                ),
                Icon(
                  IconlyLight.bookmark,
                  size: 25.w,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return SizedBox(
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < 6; i++)
            Dot(
              index: i,
              active: _activePage == i,
            ),
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final int index;
  final bool active;

  const Dot({
    required this.index,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: active ? Theme.of(context).primaryColor : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
