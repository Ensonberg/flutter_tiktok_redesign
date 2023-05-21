import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

import '../theme/colors.dart';

class SingleLiveVideoItem extends StatefulWidget {
  final String? videoUrl;
  final String? name;
  final String? caption;
  final String? songName;
  final String? profileImg;
  final String? likes;
  final String? comments;
  final String? shares;
  final String? albumImg;
  SingleLiveVideoItem(
      {Key? key,
      @required this.size,
      this.name,
      this.caption,
      this.songName,
      this.profileImg,
      this.likes,
      this.comments,
      this.shares,
      this.albumImg,
      this.videoUrl})
      : super(key: key);

  final Size? size;

  @override
  _SingleLiveVideoItemState createState() => _SingleLiveVideoItemState();
}

class _SingleLiveVideoItemState extends State<SingleLiveVideoItem>
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
        : SvgPicture.asset(
            "assets/svgs/paly.svg",
            height: 40,
            width: 50,
            color: white.withOpacity(0.5),
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
              // Positioned(
              //   bottom: 0,
              //   child: LeftPanel(
              //     size: widget.size,
              //     name: "${widget.name}",
              //     caption: "${widget.caption}",
              //     songName: "${widget.songName}",
              //   ),
              // ),
              // Positioned(
              //   right: 10,
              //   child: RightPanel(
              //     size: widget.size!,
              //     likes: "${widget.likes}",
              //     comments: "${widget.comments}",
              //     shares: "${widget.shares}",
              //     profileImg: "${widget.profileImg}",
              //     albumImg: "${widget.albumImg}",
              //     // animationController: animationController,
              //   ),
              // )
            ],
          )),
    );
  }
}
