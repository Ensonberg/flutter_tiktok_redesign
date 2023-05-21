import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

import '../../theme/colors.dart';

class SingleLiveScreen extends StatefulWidget {
  static const routeName = "/singleLiveScreen";
  const SingleLiveScreen({Key? key}) : super(key: key);

  @override
  State<SingleLiveScreen> createState() => _SingleLiveScreenState();
}

class _SingleLiveScreenState extends State<SingleLiveScreen>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _videoController;

  bool isShowPlaying = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _videoController = VideoPlayerController.asset("assets/videos/video_1.mp4")
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
    var media = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Material(
        child: SizedBox(
            height: media.height,
            width: media.width,
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
                    height: media.height,
                    width: media.width,
                    decoration: BoxDecoration(color: black),
                    child: Stack(
                      children: <Widget>[
                        VideoPlayer(_videoController),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(),
                            child: isPlaying(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: media.height * 0.12,
                  color: Color(0xff3D000000),
                  child: SafeArea(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 6),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: SvgPicture.asset(
                              "assets/svgs/BackArrow.svg",
                              height: 11.5,
                              width: 17.5,
                              color: white.withOpacity(0.5),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: SizedBox(
                                height: 48,
                                width: 48,
                                child: CircleAvatar(
                                  child:
                                      Image.asset("assets/svgs/Ellipse 1.png"),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "avabams",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  width: 14,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Icon(
                                      Icons.visibility_outlined,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "14.k",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: "San Francisco",
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 32,
                            width: 69,
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(30)),
                            child: const Center(
                                child: Text(
                              "Follow",
                              style: TextStyle(
                                  color: white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: media.height * 0.25,
                    width: media.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor: grey,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "ensonberg",
                                            style: const TextStyle(
                                                color: grey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Text(
                                              "I think I love this!!!",
                                              style: const TextStyle(
                                                  color: white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor: grey,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "ensonberg",
                                            style: const TextStyle(
                                                color: grey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Text(
                                              "I think I love this!!!",
                                              style: const TextStyle(
                                                  color: white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: media.height * 0.07,
                            width: media.width,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(48),
                              border: Border.all(color: Colors.white, width: 2),
                              backgroundBlendMode: BlendMode.darken,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Center(
                                  child: TextField(
                                style: const TextStyle(
                                    color: white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                  hintText: "Type a message...",
                                  border: InputBorder.none,
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      "assets/svgs/act btn send.svg",
                                    ),
                                  ),
                                  hintStyle: const TextStyle(
                                      color: grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              height: 5,
                              width: 134,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
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
      ),
    );
  }
}
