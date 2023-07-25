import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:ovatoyu/ui/widgets/column_social_icon.dart';

class RightPanel extends StatelessWidget {
  final String? likes;
  final String? comments;
  final String? shares;
  final String? profileImg;
  final String? albumImg;
  bool? isCompetition;

  RightPanel({
    Key? key,
    @required this.size,
    this.likes,
    this.comments,
    this.shares,
    this.isCompetition = false,
    this.profileImg,
    this.albumImg,
  }) : super(key: key);

  final Size? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size!.width * 0.15,
      child: Column(
        children: <Widget>[
          Container(
            height: size!.height * 0.3,
          ),
          SizedBox(
            height: size!.height * 0.32,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ChangeIcon(iconData: IconlyBold.heart, count: "236"),

                getIcons(context, "assets/svgs/comment.svg", comments, 35.0),
                const ChangeIcon(iconData: IconlyBold.more_circle, count: ""),
                const ChangeIcon(iconData: IconlyBold.send, count: ""),
                //getAlbum(albumImg, animationController!)
              ],
            ),
          )
        ],
      ),
    );
  }
}
