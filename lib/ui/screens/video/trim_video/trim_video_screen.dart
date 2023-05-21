import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovatoyu/core/controllers/add_video_controller.dart';
import 'package:ovatoyu/ui/screens/video/share/share_video_screen.dart';
import 'package:ovatoyu/ui/theme/colors.dart';
import 'package:video_player/video_player.dart';
import 'package:video_trimmer/video_trimmer.dart';

class TrimVideoScreen extends StatefulWidget {
  static const routeName = "/trim_video_screen";
  const TrimVideoScreen({Key? key}) : super(key: key);

  @override
  State<TrimVideoScreen> createState() => _TrimVideoScreenState();
}

class _TrimVideoScreenState extends State<TrimVideoScreen> {
  late VideoPlayerController _controller;
  AddVideoController controller = Get.find();
  final Trimmer _trimmer = Trimmer();
  bool _isPlaying = false;
  bool _progressVisibility = false;

  double _startValue = 0.0;
  String path = "";
  double _endValue = 0.0;

  @override
  void didChangeDependencies() async {
    await _trimmer.loadVideo(videoFile: File(controller.file.path));
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    _trimmer.dispose();
    super.dispose();
  }

  Future<String?> _saveVideo() async {
    setState(() {
      _progressVisibility = true;
    });

    String? _value;

    await _trimmer
        .saveTrimmedVideo(
            startValue: _startValue,
            endValue: _endValue,
            onSave: (String? outputPath) {
              setState(() {
                path = outputPath!;
                _progressVisibility = false;
              });
              controller.addTrimmedVideo(File(outputPath!));
              print('OUTPUT PATH: $outputPath');

              Navigator.of(context).pushNamed(ShareVideoScreen.routeName);
              print("then.. $path");
            })
        .then((value) {
      setState(() {
        //_value = value;
      });
    });

    return path;
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox(
        width: media.width,
        height: media.height,
        child: Stack(
          children: [
            Container(
              width: media.width,
              color: const Color(0xff282828),
              height: media.height,
              child: Stack(
                children: [
                  VideoViewer(
                    trimmer: _trimmer,
                  ),
                  Center(
                    child: TextButton(
                      child: _isPlaying
                          ? Icon(
                              Icons.pause,
                              size: 80.0,
                              color: Colors.white,
                            )
                          : Icon(
                              Icons.play_arrow,
                              size: 80.0,
                              color: Colors.white,
                            ),
                      onPressed: () async {
                        bool playbackState = await _trimmer.videPlaybackControl(
                          startValue: _startValue,
                          endValue: _endValue,
                        );
                        setState(() {
                          _isPlaying = playbackState;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              child: Row(
                children: [
                  TrimEditor(
                    trimmer: _trimmer,
                    borderPaintColor: Colors.pink,
                    borderWidth: 6,
                    scrubberWidth: 5,
                    circlePaintColor: primary,
                    viewerHeight: media.height * 0.15,
                    maxVideoLength: Duration(minutes: 3),
                    onChangeStart: (value) {
                      _startValue = value;
                    },
                    onChangeEnd: (value) {
                      _endValue = value;
                    },
                    onChangePlaybackState: (value) {
                      setState(() {
                        //_isPlaying = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _progressVisibility,
              child: const Align(
                alignment: Alignment.center,
                child: SafeArea(
                    child: CircularProgressIndicator(
                  color: primary,
                )),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: SafeArea(
                child: InkWell(
                  onTap: () {
                    _saveVideo();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Done",
                      style: TextStyle(
                          color: white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
