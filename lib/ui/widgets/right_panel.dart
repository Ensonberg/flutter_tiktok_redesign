import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ovatoyu/ui/widgets/column_social_icon.dart';
import 'package:share_plus/share_plus.dart';

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
            height: size!.height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                isCompetition == true
                    ? const ChangeIcon(
                        asset1: "assets/svgs/VoteBlue.svg",
                        asset2: "assets/svgs/VoteWhite.svg",
                        count: "vote")
                    : getProfile(profileImg, context),
                const ChangeIcon(
                    asset1: "assets/svgs/liked_white.svg",
                    asset2: "assets/svgs/liked_red.svg",
                    count: "236"),
                getIcons(context, "assets/svgs/comment.svg", comments, 35.0),
                MaterialButton(
                    padding: EdgeInsets.zero,
                    elevation: 0,
                    onPressed: () {
                      Share.share('check out my website https://example.com');
                    },
                    child: SvgPicture.asset("assets/svgs/Share.svg"))
                //getAlbum(albumImg, animationController!)
              ],
            ),
          )
        ],
      ),
    );
  }
}
