// import 'dart:async';
// import 'dart:io';
//
// import 'package:camera/camera.dart';
// import 'package:stacked/stacked.dart';
// import 'package:video_player/video_player.dart';
//
// class StartVideoViewModel extends BaseViewModel {
//   CameraController? controller;
//   bool _isCameraInitialized = false;
//   bool _isRearCameraSelected = true;
//   bool _isRecordingInProgress = false;
//   Timer? _countdownTimer;
//   bool _timerEnded = false;
//   Duration _myDuration = Duration(seconds: 5);
//   int _second = 0;
//
//   late VideoPlayerController _videoController;
//
//   late File _videoFile;
//
//   set videoFile(File value) {
//     _videoFile = value;
//   }
//
//   bool get isCameraInitialized => _isCameraInitialized;
//
//   void onNewCameraSelected(CameraDescription cameraDescription) async {
//     // final previousCameraController = controller;
//     // Instantiating the camera controller
//     final CameraController cameraController = CameraController(
//       cameraDescription,
//       ResolutionPreset.high,
//       imageFormatGroup: ImageFormatGroup.jpeg,
//     );
//
//     // Dispose the previous controller
//     /// await previousCameraController?.dispose();
//
//     // Replace with the new controller
//     // if (mounted) {
//     //   setState(() {
//     //     ;
//     //   });
//     // }
//     controller = cameraController;
//     notifyListeners();
//
//     // Update UI if controller updated
//     cameraController.addListener(() {
//       notifyListeners();
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
//
//     _isCameraInitialized = controller!.value.isInitialized;
//     notifyListeners();
//     // if (mounted) {
//     //   setState(() {
//     //     _isCameraInitialized = controller!.value.isInitialized;
//     //   });
//     // }
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
//
//       _isRecordingInProgress = false;
//       notifyListeners();
//       print(_isRecordingInProgress);
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
//
//     if (second < 0) {
//       countdownTimer.cancel();
//
//       _timerEnded = true;
//       notifyListeners();
//       startVideoRecording();
//     } else {
//       _myDuration = Duration(seconds: second);
//     }
//     notifyListeners();
//   }
//
//   void startTimer(int second) {
//     _countdownTimer =
//         Timer.periodic(Duration(seconds: 1), (_) => setCountDown(second));
//   }
//
//   Future<void> startVideoPlayer() async {
//     if (_videoFile != null) {
//       _videoController = VideoPlayerController.file(_videoFile);
//       await videoController.initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized,
//         // even before the play button has been pressed.
//       });
//       await videoController.setLooping(true);
//       await videoController.play();
//     }
//   }
//
//   bool get isRearCameraSelected => _isRearCameraSelected;
//
//   bool get isRecordingInProgress => _isRecordingInProgress;
//
//   Timer get countdownTimer => _countdownTimer!;
//
//   bool get timerEnded => _timerEnded;
//
//   Duration get myDuration => _myDuration;
//
//   int get second => _second;
//
//   VideoPlayerController get videoController => _videoController;
//
//   File get videoFile => _videoFile;
// }
