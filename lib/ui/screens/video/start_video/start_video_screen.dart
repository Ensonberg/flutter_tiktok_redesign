// import 'dart:async';
// import 'dart:io';
//
// import 'package:camera/camera.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:video_player/video_player.dart';
//
// import '../../../main.dart';
// import '../../theme/colors.dart';
//
// class StartVideoScreen extends StatefulWidget {
//   static const routeName = "/start_video";
//   const StartVideoScreen({Key? key}) : super(key: key);
//
//   @override
//   State<StartVideoScreen> createState() => _StartVideoScreenState();
// }
//
// class _StartVideoScreenState extends State<StartVideoScreen>
//     with WidgetsBindingObserver {
//   CameraController? controller;
//   bool _isCameraInitialized = false;
//   bool _isRearCameraSelected = true;
//   bool _isRecordingInProgress = false;
//   Timer? countdownTimer;
//   bool timerEnded = false;
//   Duration myDuration = Duration(seconds: 5);
//   int second = 0;
//
//   late VideoPlayerController videoController;
//
//   late File _videoFile;
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     final CameraController? cameraController = controller;
//
//     // App state changed before we got the chance to initialize.
//     if (cameraController == null || !cameraController.value.isInitialized) {
//       return;
//     }
//
//     if (state == AppLifecycleState.inactive) {
//       // Free up memory when camera not active
//       cameraController.dispose();
//     } else if (state == AppLifecycleState.resumed) {
//       // Reinitialize the camera with same properties
//       onNewCameraSelected(cameraController.description);
//     }
//   }
//
//   @override
//   void initState() {
//     onNewCameraSelected(cameras[0]);
//
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     controller!.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.of(context).size;
//     String strDigits(int n) => n.toString();
//     final seconds = strDigits(myDuration.inSeconds.remainder(60));
//
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       extendBody: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: SizedBox(
//         height: media.height,
//         width: media.width,
//         child: controller!.value.isInitialized
//             ? CameraPreview(
//                 controller!,
//                 child: Stack(
//                   children: [
//                     if (countdownTimer != null)
//                       Visibility(
//                         visible: timerEnded,
//                         child: Align(
//                           alignment: Alignment.center,
//                           child: Text(
//                             seconds,
//                             style: TextStyle(
//                                 color: white,
//                                 fontSize: 240.sp,
//                                 fontWeight: FontWeight.w700),
//                           ),
//                         ),
//                       ),
//                     Positioned(
//                       right: 0,
//                       top: media.height * 0.1,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: SizedBox(
//                           height: media.height * 0.3,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               SvgPicture.asset("assets/svgs/sound.svg"),
//                               SvgPicture.asset("assets/svgs/speed.svg"),
//                               SvgPicture.asset("assets/svgs/duration.svg"),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       child: SizedBox(
//                         width: media.width,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 if (countdownTimer != null &&
//                                     countdownTimer!.isActive) {
//                                   countdownTimer!.cancel();
//                                 } else {
//                                   startTimer(second);
//                                 }
//                               },
//                               child: Container(
//                                 height: 50,
//                                 width: 50,
//                                 decoration: BoxDecoration(
//                                     color: grey, shape: BoxShape.circle),
//                               ),
//                             ),
//
//                             InkWell(
//                               onTap: () async {
//                                 if (_isRecordingInProgress) {
//                                   XFile? rawVideo = await stopVideoRecording();
//                                   File videoFile = File(rawVideo!.path);
//
//                                   int currentUnix =
//                                       DateTime.now().millisecondsSinceEpoch;
//
//                                   final directory =
//                                       await getApplicationDocumentsDirectory();
//                                   String fileFormat =
//                                       videoFile.path.split('.').last;
//
//                                   _videoFile = await videoFile.copy(
//                                     '${directory.path}/$currentUnix.$fileFormat',
//                                   );
//
//                                   //startVideoPlayer();
//                                 } else {
//                                   await startVideoRecording();
//                                 }
//                               },
//                               child: Stack(
//                                 alignment: Alignment.center,
//                                 children: [
//                                   Icon(
//                                     Icons.circle,
//                                     color: Colors.white,
//                                     size: 80,
//                                   ),
//                                   Icon(
//                                     Icons.circle,
//                                     color: Colors.red,
//                                     size: 65,
//                                   ),
//                                   Icon(
//                                     Icons.stop_rounded,
//                                     color: Colors.white,
//                                     size: 32,
//                                   )
//                                 ],
//                               ),
//                             ),
//                             // Container(
//                             //   height: 82,
//                             //   width: 82,
//                             //   decoration: BoxDecoration(
//                             //     color: Color(0xff591721),
//                             //     shape: BoxShape.circle,
//                             //   ),
//                             //   child: Container(
//                             //     height: 78,
//                             //     width: 78,
//                             //     decoration: BoxDecoration(
//                             //         color: Color(0xffBA3647),
//                             //         shape: BoxShape.circle),
//                             //   ),
//                             // ),
//                             InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   _isCameraInitialized = false;
//                                 });
//                                 onNewCameraSelected(
//                                   cameras[_isRearCameraSelected ? 0 : 1],
//                                 );
//                                 setState(() {
//                                   _isRearCameraSelected =
//                                       !_isRearCameraSelected;
//                                 });
//                               },
//                               child: Container(
//                                 height: 50,
//                                 width: 50,
//                                 decoration: BoxDecoration(
//                                     color: grey, shape: BoxShape.circle),
//                                 child: SvgPicture.asset(
//                                   "assets/svgs/flip.svg",
//                                   height: 20,
//                                   fit: BoxFit.scaleDown,
//                                   width: 20,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             : Container(),
//       ),
//     );
//   }
//
//   void onNewCameraSelected(CameraDescription cameraDescription) async {
//     final previousCameraController = controller;
//     // Instantiating the camera controller
//     final CameraController cameraController = CameraController(
//       cameraDescription,
//       ResolutionPreset.high,
//       imageFormatGroup: ImageFormatGroup.jpeg,
//     );
//
//     // Dispose the previous controller
//     await previousCameraController?.dispose();
//
//     // Replace with the new controller
//     if (mounted) {
//       setState(() {
//         controller = cameraController;
//       });
//     }
//
//     // Update UI if controller updated
//     cameraController.addListener(() {
//       if (mounted) setState(() {});
//     });
//
//     // Initialize controller
//     try {
//       await cameraController.initialize();
//     } on CameraException catch (e) {
//       print('Error initializing camera: $e');
//     }
//
//     // Update the Boolean
//     if (mounted) {
//       setState(() {
//         _isCameraInitialized = controller!.value.isInitialized;
//       });
//     }
//   }
//
//   Future<void> startVideoRecording() async {
//     final CameraController? cameraController = controller;
//
//     if (cameraController == null || !cameraController.value.isInitialized) {
//       //showInSnackBar('Error: select a camera first.');
//       return;
//     }
//
//     if (cameraController.value.isRecordingVideo) {
//       // A recording is already started, do nothing.
//       return;
//     }
//
//     try {
//       await cameraController.startVideoRecording();
//       _isRecordingInProgress = true;
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       return;
//     }
//   }
//
//   Future<XFile?> stopVideoRecording() async {
//     final CameraController? cameraController = controller;
//
//     if (cameraController == null || !cameraController.value.isRecordingVideo) {
//       return null;
//     }
//
//     try {
//       XFile file = await controller!.stopVideoRecording();
//       setState(() {
//         _isRecordingInProgress = false;
//         print(_isRecordingInProgress);
//       });
//       return file;
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       return null;
//     }
//   }
//
//   Future<void> pauseVideoRecording() async {
//     final CameraController? cameraController = controller;
//
//     if (cameraController == null || !cameraController.value.isRecordingVideo) {
//       return;
//     }
//
//     try {
//       await cameraController.pauseVideoRecording();
//       //  _isRecordingInProgress = false;
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       rethrow;
//     }
//   }
//
//   Future<void> resumeVideoRecording() async {
//     final CameraController? cameraController = controller;
//
//     if (cameraController == null || !cameraController.value.isRecordingVideo) {
//       return;
//     }
//
//     try {
//       await cameraController.resumeVideoRecording();
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       rethrow;
//     }
//   }
//
//   void _showCameraException(CameraException e) {
//     // _logError(e.code, e.description);
//     // showInSnackBar('Error: ${e.code}\n${e.description}');
//   }
//   void setCountDown(int second) {
//     final reduceSecondsBy = 1;
//     second = myDuration.inSeconds - reduceSecondsBy;
//     setState(() {
//       if (second < 0) {
//         countdownTimer!.cancel();
//         setState(() {
//           timerEnded = true;
//         });
//         startVideoRecording();
//       } else {
//         myDuration = Duration(seconds: second);
//       }
//     });
//   }
//
//   void startTimer(int second) {
//     countdownTimer =
//         Timer.periodic(Duration(seconds: 1), (_) => setCountDown(second));
//   }
//
//   Future<void> _startVideoPlayer() async {
//     if (_videoFile != null) {
//       videoController = VideoPlayerController.file(_videoFile);
//       await videoController.initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized,
//         // even before the play button has been pressed.
//         setState(() {});
//       });
//       await videoController.setLooping(true);
//       await videoController.play();
//     }
//   }
// }
import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ovatoyu/core/controllers/add_video_controller.dart';
import 'package:ovatoyu/ui/screens/video/preview_video/video_preview_screen.dart';
import 'package:ovatoyu/ui/theme/colors.dart';

import '../../../../main.dart';

// import 'CameraView.dart';
// import 'VideoView.dart';

class StartVideoScreen extends StatefulWidget {
  static const routeName = "/start_video";
  StartVideoScreen({Key? key}) : super(key: key);

  @override
  _StartVideoScreenState createState() => _StartVideoScreenState();
}

class _StartVideoScreenState extends State<StartVideoScreen> {
  CameraController? _cameraController;
  AddVideoController _addVideoController = Get.find();
  Future<void>? cameraValue;
  bool isRecoring = false;
  bool isPauseRecoding = false;
  bool flash = false;
  bool iscamerafront = true;
  double transform = 0;

  static const maxSeconds = 600;
  int seconds = maxSeconds;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController!.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController!.dispose();
  }

  void startTimer({bool reset = true, context}) {
    if (reset) {
      resetTimer();
    }
    print("start timer");
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        stopTimer(reset: false);
        stopVideoRecoding(context);
      }
    });
  }

  void stopVideoRecoding(context) async {
    XFile videopath = await _cameraController!.stopVideoRecording();
    _addVideoController.addFile(File(videopath.path));
    setState(() {
      isRecoring = false;
    });
    Navigator.push(
        context, MaterialPageRoute(builder: (builder) => PreviewVideoScreen()));
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    setState(() {
      timer?.cancel();
    });
  }

  void resetTimer() {
    setState(() {
      seconds = maxSeconds;
    });
  }

  void pauseRecoding() async {
    setState(() {
      isPauseRecoding = !isPauseRecoding;
      print(isPauseRecoding);
    });
    if (isPauseRecoding == true) {
      await _cameraController!.pauseVideoRecording();
    } else {
      await _cameraController!.resumeVideoRecording();
    }
    setState(() {
      isRecoring = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SizedBox(
        width: media.width,
        height: media.height,
        child: Stack(
          children: [
            FutureBuilder(
                future: cameraValue,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return SizedBox(
                        child: Stack(
                      children: [
                        SizedBox(
                            width: media.width,
                            height: media.height,
                            child: CameraPreview(_cameraController!)),
                        Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(top: 30.h, left: 8, right: 8),
                              child: buildTimer(isRecoring),
                            ))
                      ],
                    ));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: primary,
                      ),
                    );
                  }
                }),
            Positioned(
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: media.height * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: media.height * 0.2,
                        ),
                        SvgPicture.asset("assets/svgs/sound.svg"),
                        SvgPicture.asset("assets/svgs/filter.svg"),
                        SvgPicture.asset("assets/svgs/duration.svg"),
                      ],
                    ),
                  ),
                )),
            Positioned(
              bottom: 0.0,
              child: SizedBox(
                height: media.height * 0.17,
                width: media.width,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(flex: 1, child: buildIconFlag()),
                        isRecoring == false
                            ? Container()
                            : InkWell(
                                onTap: () => pauseRecoding(),
                                child: buildPauseIcons()),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            // onTap: () async {
                            //   await _cameraController!.startVideoRecording();
                            //   setState(() {
                            //     isRecoring = true;
                            //   });
                            // },
                            onLongPressUp: () async {
                              XFile videopath =
                                  await _cameraController!.stopVideoRecording();

                              _addVideoController.addFile(File(videopath.path));
                              setState(() {
                                isRecoring = false;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) =>
                                          PreviewVideoScreen()));
                            },
                            onLongPress: () {
                              // if (!isRecoring) takePhoto(context);
                            },
                            child: isRecoring
                                ? InkWell(
                                    onTap: () async {
                                      XFile videopath = await _cameraController!
                                          .stopVideoRecording();

                                      _addVideoController
                                          .addFile(File(videopath.path));
                                      setState(() {
                                        isRecoring = false;
                                      });
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (builder) =>
                                                  PreviewVideoScreen()));
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Color(0xff591721),
                                              width: 10)),
                                      child: Padding(
                                          padding: const EdgeInsets.all(22.0),
                                          child: Container(
                                            height: 14,
                                            width: 14,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                shape: BoxShape.rectangle,
                                                color: Colors.red),
                                          )),
                                    ))
                                : InkWell(
                                    onTap: () async {
                                      startTimer(context: context);
                                      await _cameraController!
                                          .startVideoRecording();
                                      setState(() {
                                        isRecoring = true;
                                      });
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Color(0xff591721),
                                              width: 10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundColor: Color(0xffBA3647),
                                        ),
                                      ),
                                    )),
                          ),
                        ),
                        Expanded(flex: 1, child: buildIconCamera()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIconFlag() {
    return IconButton(
        icon: Icon(
          flash ? Icons.flash_on : Icons.flash_off,
          color: Colors.white,
          size: 28,
        ),
        onPressed: () {
          setState(() {
            flash = !flash;
          });
          flash
              ? _cameraController!.setFlashMode(FlashMode.torch)
              : _cameraController!.setFlashMode(FlashMode.off);
        });
  }

  Widget buildPauseIcons() {
    if (isPauseRecoding == true) {
      return Icon(
        Icons.play_arrow,
        color: Colors.white,
      );
    } else {
      return Icon(
        Icons.pause,
        color: Colors.white,
      );
    }
  }

  Widget buildIconCamera() {
    return IconButton(
        padding: EdgeInsets.zero,
        icon: Transform.rotate(
          angle: transform,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(color: grey, shape: BoxShape.circle),
            child: SvgPicture.asset(
              "assets/svgs/flip.svg",
              height: 20,
              fit: BoxFit.scaleDown,
              width: 20,
            ),
          ),
        ),
        onPressed: () async {
          setState(() {
            iscamerafront = !iscamerafront;
            transform = transform + pi;
          });
          int cameraPos = iscamerafront ? 0 : 1;
          _cameraController =
              CameraController(cameras[cameraPos], ResolutionPreset.high);
          cameraValue = _cameraController!.initialize();
        });
  }

  Widget renderText(bool isRecoring) {
    // if(isRecoring){
    //   return Text("Question there");
    // }else{
    //
    // }
    // return isRecoring==true? Text("Question there",style: TextStyle(color: Colors.green,fontSize: 20),):Container();
    return isRecoring
        ? Container(
            margin: EdgeInsets.all(30),
            width: 200,
            height: 200,
            color: Colors.red,
            child: Text(
              "Question there",
              style: TextStyle(color: Colors.green, fontSize: 20),
            ))
        : Container();
  }

  Widget buildTimer(bool isRecodring) {
    return isRecodring
        ? Column(
            children: [
              LinearProgressIndicator(
                value: 1 - seconds / maxSeconds,
                valueColor: const AlwaysStoppedAnimation(Colors.white),
                backgroundColor: primary,
              ),
              Center(
                child: Text(
                  "$seconds",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        : Container();
  }
}
