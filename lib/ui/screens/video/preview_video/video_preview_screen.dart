import 'dart:io';

import 'package:draggable_widget/draggable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ovatoyu/core/controllers/add_video_controller.dart';
import 'package:ovatoyu/ui/screens/video/trim_video/trim_video_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tapioca/tapioca.dart';
import 'package:text_editor/text_editor.dart';
import 'package:video_player/video_player.dart';

import '../../../theme/colors.dart';

class PreviewVideoScreen extends StatefulWidget {
  const PreviewVideoScreen({Key? key}) : super(key: key);

  @override
  _PreviewVideoScreenState createState() => _PreviewVideoScreenState();
}

class _PreviewVideoScreenState extends State<PreviewVideoScreen> {
  late VideoPlayerController _controller;
  AddVideoController _addVideoController = Get.find();
  bool isText = false;

  final dragController = DragController();
  final fonts = [
    'OpenSans',
    'Billabong',
    'GrandHotel',
    'Oswald',
    'Quicksand',
    'BeautifulPeople',
    'BeautyMountains',
    'BiteChocolate',
    'BlackberryJam',
    'BunchBlossoms',
    'CinderelaRegular',
    'Countryside',
    'Halimun',
    'LemonJelly',
    'QuiteMagicalRegular',
    'Tomatoes',
    'TropicalAsianDemoRegular',
    'VeganStyle',
  ];
  TextStyle _textStyle = TextStyle(
    fontSize: 50,
    color: Colors.white,
    fontFamily: 'Billabong',
  );
  String _text = 'Add text here';
  TextAlign _textAlign = TextAlign.center;
  void _tapHandler(text, textStyle, textAlign) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration(
        milliseconds: 400,
      ), // how long it takes to popup dialog after button click
      pageBuilder: (_, __, ___) {
        // your widget implementation
        return Container(
          color: Colors.black.withOpacity(0.4),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              // top: false,
              child: Container(
                child: TextEditor(
                  fonts: fonts,
                  text: text,
                  textStyle: textStyle,
                  textAlingment: textAlign,
                  minFontSize: 10,
                  onEditCompleted: (style, align, text) {
                    setState(() {
                      _text = text;
                      _textStyle = style;
                      _textAlign = align;
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();

    _controller =
        VideoPlayerController.file(File(_addVideoController.file.path))
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: media.width,
        color: const Color(0xff282828),
        height: media.height,
        child: Stack(
          children: [
            Container(
              width: media.width,
              height: media.height * 0.88,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
            ),
            Positioned(
                bottom: 20,
                child: SizedBox(
                  width: media.width,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final tapiocaBalls = [
                                  TapiocaBall.textOverlay(
                                      "text", 100, 10, 500, Color(0xffffc0cb)),
                                ];
                                var tempDir = await getTemporaryDirectory();
                                final path = '${tempDir.path}/result.mp4';
                                final cup = Cup(Content(path), tapiocaBalls);
                                cup.suckUp(path).then((_) {
                                  print("finish processing");
                                });
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: white, shape: BoxShape.circle),
                                    child: SvgPicture.asset(
                                      "assets/svgs/filter.svg",
                                      color: Colors.black,
                                      height: 20,
                                      fit: BoxFit.scaleDown,
                                      width: 20,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 4),
                                    child: Text(
                                      "Filters",
                                      style:
                                          TextStyle(color: white, fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isText = true;
                                });
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: white, shape: BoxShape.circle),
                                    child: SvgPicture.asset(
                                      "assets/svgs/text.svg",
                                      color: Colors.black,
                                      height: 20,
                                      fit: BoxFit.scaleDown,
                                      width: 20,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 4),
                                    child: Text(
                                      "Text",
                                      style:
                                          TextStyle(color: white, fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, TrimVideoScreen.routeName);
                                },
                                child: Container(
                                  width: 70.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: primary,
                                      borderRadius: BorderRadius.circular(80)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Next",
                                        style: TextStyle(
                                            color: white, fontSize: 14.sp),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      SvgPicture.asset("assets/svgs/next.svg")
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                )),
            Visibility(
              visible: isText,
              child: DraggableWidget(
                bottomMargin: 80,
                statusBarHeight: 10,
                topMargin: 80,
                horizontalSpace: 20,
                child: GestureDetector(
                  onDoubleTap: () {
                    _tapHandler(_text, _textStyle, _textAlign);
                  },
                  child: Container(
                    width: 300,
                    child: Text(
                      _text,
                      style: _textStyle,
                    ),
                  ),
                ),
                initialPosition: AnchoringPosition.center,
                dragController: dragController,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: CircleAvatar(
                  radius: 33,
                  backgroundColor: Colors.black38,
                  child: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                    size: 50,
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
