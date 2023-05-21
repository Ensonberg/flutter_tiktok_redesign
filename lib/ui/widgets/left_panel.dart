import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquee/marquee.dart';
import 'package:ovatoyu/ui/theme/colors.dart';

class LeftPanel extends StatelessWidget {
  final String? name;
  final String? caption;
  final String? songName;
  const LeftPanel({
    Key? key,
    @required this.size,
    this.name,
    this.caption,
    this.songName,
  }) : super(key: key);

  final Size? size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Container(
        width: size!.width,
        height: size!.height * 0.2,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Container(
                  height: 48.h,
                  width: 48.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/svgs/Ellipse 1.png"))),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name!,
                      style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: 22.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.white, width: 1)),
                      child: Center(
                        child: Text(
                          "following",
                          style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.w600,
                              fontSize: 11.sp),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              caption!,
              style: TextStyle(
                  color: white, fontWeight: FontWeight.w400, fontSize: 14),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: SvgPicture.asset("assets/svgs/music.svg"),
                ),
                SizedBox(
                  height: 15,
                  width: size!.width * 0.9,
                  child: Center(
                    child: Marquee(
                      text: songName!,
                      pauseAfterRound: Duration(seconds: 2),
                      startPadding: 10.0,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: Colors.white),
                      accelerationDuration: Duration(seconds: 2),
                      accelerationCurve: Curves.linear,
                      decelerationDuration: Duration(seconds: 1),
                      decelerationCurve: Curves.easeOut,
                      scrollAxis: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      blankSpace: 20.0,
                      velocity: 100.0,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
