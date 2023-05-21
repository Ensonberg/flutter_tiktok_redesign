import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:ovatoyu/ui/dialogs/comment_dialog.dart';
import 'package:ovatoyu/ui/screens/competition/competition_screen.dart';
import 'package:ovatoyu/ui/theme/colors.dart';

// Widget getAlbum(albumImg, AnimationController _animationController) {
//   return AnimatedBuilder(
//     builder: (BuildContext? context, Widget? child) {
//       return Transform.rotate(
//           angle: _animationController.value * 6.3, child: child);
//     },
//     animation: _animationController,
//     child: Container(
//       height: 50,
//       width: 50,
//       padding: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//           color: Colors.black45,
//           borderRadius: BorderRadius.all(Radius.circular(50))),
//       child: Container(
//         height: 30,
//         width: 30,
//         decoration: BoxDecoration(
//           image:
//               DecorationImage(image: NetworkImage(albumImg), fit: BoxFit.cover),
//           color: Colors.green,
//           borderRadius: BorderRadius.all(Radius.circular(50)),
//         ),
//       ),
//     ),
//   );
// }
class ChangeIcon extends StatefulWidget {
  final String asset1, count, asset2;
  const ChangeIcon(
      {Key? key,
      required this.asset1,
      required this.asset2,
      required this.count})
      : super(key: key);

  @override
  State<ChangeIcon> createState() => _ChangeIconState();
}

class _ChangeIconState extends State<ChangeIcon> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      padding: EdgeInsets.zero,
      onPressed: () {
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Column(
        children: <Widget>[
          SvgPicture.asset(
            isClicked ? widget.asset2 : widget.asset1,
            height: 32,
            width: 32,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.count,
            style: TextStyle(
                color: white, fontSize: 12, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
    ;
  }
}

Widget getIcons(
  BuildContext context,
  String asset,
  count,
  size,
) {
  return MaterialButton(
    padding: EdgeInsets.zero,
    elevation: 0,
    onPressed: () {
      showCupertinoModalBottomSheet(
          context: context, builder: (_) => const CommentDialog());
    },
    child: Column(
      children: <Widget>[
        SvgPicture.asset(asset),
        SizedBox(
          height: 5,
        ),
        Text(
          count,
          style: TextStyle(
              color: white, fontSize: 12, fontWeight: FontWeight.w700),
        )
      ],
    ),
  );
}

Widget getProfile(img, BuildContext context) {
  return SizedBox(
    width: 100.w,
    height: 100.h,
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(CompetitionScreen.routeName);
      },
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 20.0,
            child: Container(
              width: 60.w,
              height: 70.h,
              decoration: BoxDecoration(
                  border: Border.all(color: white),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(img), fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: 60.w,
              height: 70.h,
              decoration: BoxDecoration(
                  border: Border.all(color: white),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(img), fit: BoxFit.cover)),
            ),
          ),
          Positioned(
              bottom: 3,
              left: 18,
              child: Container(
                width: 20.w,
                height: 20.h,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: primary),
                child: Center(
                    child: Text(
                  "4",
                  style: TextStyle(
                      color: white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600),
                )),
              ))
        ],
      ),
    ),
  );
}
