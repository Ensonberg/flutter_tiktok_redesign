import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconly/iconly.dart';
import 'package:ovatoyu/ui/widgets/left_panel.dart';
import 'package:ovatoyu/ui/widgets/right_panel.dart';
import 'package:video_player/video_player.dart';

import '../theme/colors.dart';

class VideoPlayerItem extends StatefulWidget {
  final String? videoUrl;
  final String? name;
  final String? caption;
  final String? songName;
  final String? profileImg;
  final String? likes;
  final String? comments;
  final String? shares;
  bool? isCompetition;
  final String? albumImg;
  VideoPlayerItem(
      {Key? key,
      @required this.size,
      this.name,
      this.caption,
      this.songName,
      this.profileImg,
      this.likes,
      this.comments,
      this.isCompetition = false,
      this.shares,
      this.albumImg,
      this.videoUrl})
      : super(key: key);

  final Size? size;

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _videoController;

  bool isShowPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _videoController = VideoPlayerController.asset(widget.videoUrl!)
      ..initialize().then((value) {
        _videoController.play();
        setState(() {
          isShowPlaying = false;
        });
      });
    // animationController =
    //     AnimationController(vsync: this, duration: Duration(seconds: 8));
    // animationController.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoController.dispose();
  }

  Widget isPlaying() {
    return _videoController.value.isPlaying && !isShowPlaying
        ? Container()
        : Icon(
            IconlyBold.play,
            color: Colors.white,
            size: 50.w,
          );
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: Container(
          height: widget.size!.height,
          width: widget.size!.width,
          child: Stack(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    _videoController.value.isPlaying
                        ? _videoController.pause()
                        : _videoController.play();
                  });
                },
                child: Container(
                  height: widget.size!.height,
                  width: widget.size!.width,
                  decoration: BoxDecoration(color: black),
                  child: Stack(
                    children: <Widget>[
                      VideoPlayer(_videoController),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(),
                          child: isPlaying(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: LeftPanel(
                  size: widget.size,
                  name: "${widget.name}",
                  caption: "${widget.caption}",
                  songName: "${widget.songName}",
                ),
              ),
              Positioned(
                right: 10,
                bottom: 0,
                child: RightPanel(
                  isCompetition: widget.isCompetition,
                  size: widget.size!,
                  likes: "${widget.likes}",
                  comments: "${widget.comments}",
                  shares: "${widget.shares}",
                  profileImg: "${widget.profileImg}",
                  albumImg: "${widget.albumImg}",
                  // animationController: animationController,
                ),
              )
            ],
          )),
    );
  }
}
