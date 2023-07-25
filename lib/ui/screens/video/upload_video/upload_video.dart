// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:ovatoyu/core/controllers/add_video_controller.dart';
// import 'package:ovatoyu/ui/screens/video/trim_video/trim_video_screen.dart';
// import 'package:ovatoyu/ui/theme/colors.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:photo_gallery/photo_gallery.dart';
// import 'package:transparent_image/transparent_image.dart';
//
// class UploadVideoScreen extends StatefulWidget {
//   static const routeName = "upload_video";
//   @override
//   _UploadVideoScreenState createState() => _UploadVideoScreenState();
// }
//
// class _UploadVideoScreenState extends State<UploadVideoScreen> {
//   List<Album>? _albums;
//   bool _loading = false;
//   bool _isAlbumPage = false;
//   late Album album;
//
//   @override
//   void initState() {
//     super.initState();
//     _loading = true;
//     initAsync();
//   }
//
//   Future<void> initAsync() async {
//     if (await _promptPermissionSetting()) {
//       List<Album> albums =
//           await PhotoGallery.listAlbums(mediumType: MediumType.video);
//       setState(() {
//         _albums = albums;
//         _loading = false;
//       });
//     }
//     setState(() {
//       _loading = false;
//     });
//   }
//
//   Future<bool> _promptPermissionSetting() async {
//     if (Platform.isIOS &&
//             await Permission.storage.request().isGranted &&
//             await Permission.photos.request().isGranted ||
//         Platform.isAndroid && await Permission.storage.request().isGranted) {
//       return true;
//     }
//     return false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       extendBody: true,
//       backgroundColor: Color(0xff000000),
//       body: _loading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : Column(
//               children: [
//                 Container(
//                   height: 50.h,
//                   color: Color(0xff000000),
//                 ),
//                 Expanded(
//                   child: LayoutBuilder(
//                     builder: (context, constraints) {
//                       double gridWidth = (constraints.maxWidth) / 3;
//                       double gridHeight = gridWidth + 50;
//                       double ratio = gridWidth / gridHeight;
//                       return Container(
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(24),
//                               topRight: Radius.circular(24)),
//                         ),
//                         padding: EdgeInsets.all(8),
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: 40.h,
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 16, right: 16),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     InkWell(
//                                       onTap: () {
//                                         if (_isAlbumPage) {
//                                           setState(() {
//                                             _isAlbumPage = false;
//                                           });
//                                         } else {
//                                           Navigator.of(context).pop();
//                                         }
//                                       },
//                                       child: Text(
//                                         _isAlbumPage ? "Back" : "Cancel",
//                                         textAlign: TextAlign.start,
//                                         style: TextStyle(
//                                           height: 1.2,
//                                           color: primary,
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 15,
//                                         ),
//                                       ),
//                                     ),
//                                     const Text(
//                                       "Gallery",
//                                       textAlign: TextAlign.start,
//                                       style: TextStyle(
//                                         height: 1.2,
//                                         color: black,
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 15,
//                                       ),
//                                     ),
//                                     const Text(
//                                       "Done",
//                                       textAlign: TextAlign.start,
//                                       style: TextStyle(
//                                         height: 1.2,
//                                         color: primary,
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 15,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: _isAlbumPage
//                                   ? AlbumPage(album)
//                                   : GridView.count(
//                                       childAspectRatio: ratio,
//                                       crossAxisCount: 3,
//                                       mainAxisSpacing: 5.0,
//                                       crossAxisSpacing: 5.0,
//                                       children: <Widget>[
//                                         ...?_albums?.map(
//                                           (album) => GestureDetector(
//                                             onTap: () {
//                                               setState(() {
//                                                 _isAlbumPage = true;
//                                                 this.album = album;
//                                               });
//                                             },
//                                             child: Column(
//                                               children: <Widget>[
//                                                 // ClipRRect(
//                                                 //   borderRadius:
//                                                 //       BorderRadius.circular(
//                                                 //           5.0),
//                                                 //   child: Container(
//                                                 //     color: Colors.grey[300],
//                                                 //     height: gridWidth,
//                                                 //     width: gridWidth,
//                                                 //     child: FadeInImage(
//                                                 //       fit: BoxFit.cover,
//                                                 //       placeholder: MemoryImage(
//                                                 //           kTransparentImage),
//                                                 //       image:
//                                                 //           AlbumThumbnailProvider(
//                                                 //         albumId: album.id,
//                                                 //         mediumType:
//                                                 //             album.mediumType,
//                                                 //         highQuality: true, album: ,
//                                                 //       ),
//                                                 //     ),
//                                                 //   ),
//                                                 // ),
//
//                                                 Container(
//                                                   alignment: Alignment.topLeft,
//                                                   padding: EdgeInsets.only(
//                                                       left: 2.0),
//                                                   child: Text(
//                                                     album.name ??
//                                                         "Unnamed Album",
//                                                     maxLines: 1,
//                                                     textAlign: TextAlign.start,
//                                                     style: TextStyle(
//                                                       height: 1.2,
//                                                       fontSize: 16,
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   alignment: Alignment.topLeft,
//                                                   padding: EdgeInsets.only(
//                                                       left: 2.0),
//                                                   child: Text(
//                                                     album.count.toString(),
//                                                     textAlign: TextAlign.start,
//                                                     style: TextStyle(
//                                                       height: 1.2,
//                                                       fontSize: 12,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }
//
// class AlbumPage extends StatefulWidget {
//   final Album album;
//
//   AlbumPage(Album album) : album = album;
//
//   @override
//   State<StatefulWidget> createState() => AlbumPageState();
// }
//
// class AlbumPageState extends State<AlbumPage> {
//  // List<Medium>? _media;
//   AddVideoController _addVideoController = Get.find();
//   @override
//   void initState() {
//     super.initState();
//     initAsync();
//   }
//
//   void initAsync() async {
//     // MediaPage mediaPage = await widget.album.listMedia();
//     // setState(() {
//     //   _media = mediaPage.items;
//     // });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       crossAxisCount: 3,
//       mainAxisSpacing: 1.0,
//       crossAxisSpacing: 1.0,
//       children: <Widget>[
//         ...?_media?.map(
//           (medium) => GestureDetector(
//             onTap: () async {
//               // PhotoGallery.getFile(mediumId: medium.id).then((value) {
//               //   _addVideoController.addFile(value);
//               //   Navigator.of(context).pushNamed(TrimVideoScreen.routeName);
//               // });
//
//               // Navigator.of(context).push(MaterialPageRoute(
//               //   builder: (context) => ViewerPage(medium)));
//             },
//             child: Container(
//               color: Colors.grey[300],
//               child: FadeInImage(
//                 fit: BoxFit.cover,
//                 placeholder: MemoryImage(kTransparentImage),
//                 image: ThumbnailProvider(
//                   mediumId: medium.id,
//                   mediumType: medium.mediumType,
//                   highQuality: true,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
// //
// // class ViewerPage extends StatelessWidget {
// //   final Medium medium;
// //
// //   ViewerPage(Medium medium) : medium = medium;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     DateTime? date = medium.creationDate ?? medium.modifiedDate;
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           leading: IconButton(
// //             onPressed: () => Navigator.of(context).pop(),
// //             icon: Icon(Icons.arrow_back_ios),
// //           ),
// //           title: date != null ? Text(date.toLocal().toString()) : null,
// //         ),
// //         body: Container(
// //           alignment: Alignment.center,
// //           child: medium.mediumType == MediumType.image
// //               ? FadeInImage(
// //                   fit: BoxFit.cover,
// //                   placeholder: MemoryImage(kTransparentImage),
// //                   image: PhotoProvider(mediumId: medium.id),
// //                 )
// //               : VideoProvider(
// //                   mediumId: medium.id,
// //                 ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class VideoProvider extends StatefulWidget {
// //   final String mediumId;
// //
// //   const VideoProvider({
// //     required this.mediumId,
// //   });
// //
// //   @override
// //   _VideoProviderState createState() => _VideoProviderState();
// // }
// //
// // class _VideoProviderState extends State<VideoProvider> {
// //   VideoPlayerController? _controller;
// //   File? _file;
// //
// //   @override
// //   void initState() {
// //     WidgetsBinding.instance?.addPostFrameCallback((_) {
// //       initAsync();
// //     });
// //     super.initState();
// //   }
// //
// //   Future<void> initAsync() async {
// //     try {
// //       _file = await PhotoGallery.getFile(mediumId: widget.mediumId);
// //       _controller = VideoPlayerController.file(_file!);
// //       _controller?.initialize().then((_) {
// //         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
// //         setState(() {});
// //       });
// //     } catch (e) {
// //       print("Failed : $e");
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return _controller == null || !_controller!.value.isInitialized
// //         ? Container()
// //         : Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: <Widget>[
// //               AspectRatio(
// //                 aspectRatio: _controller!.value.aspectRatio,
// //                 child: VideoPlayer(_controller!),
// //               ),
// //               FlatButton(
// //                 onPressed: () {
// //                   setState(() {
// //                     _controller!.value.isPlaying
// //                         ? _controller!.pause()
// //                         : _controller!.play();
// //                   });
// //                 },
// //                 child: Icon(
// //                   _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
// //                 ),
// //               ),
// //             ],
// //           );
// //   }
// // }
//
// // class UploadVideoScreen extends StatefulWidget {
// //   static const routeName = "upload_video";
// //   const UploadVideoScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   State<UploadVideoScreen> createState() => _UploadVideoScreenState();
// // }
// //
// // class _UploadVideoScreenState extends State<UploadVideoScreen> {
// //   final ImagePicker _picker = ImagePicker();
// //   pickVideo(ImageSource src, BuildContext context) async {
// //     final video = await ImagePicker().pickVideo(source: src);
// //     if (video != null) {
// //       Navigator.of(context).push(
// //         MaterialPageRoute(
// //           builder: (context) => ConfirmScreen(
// //             videoFile: File(video.path),
// //             videoPath: video.path,
// //           ),
// //         ),
// //       );
// //     }
// //   }
// //
// //   showOptionsDialog(BuildContext context) {
// //     return showDialog(
// //       context: context,
// //       builder: (context) => SimpleDialog(
// //         children: [
// //           SimpleDialogOption(
// //             onPressed: () => pickVideo(ImageSource.gallery, context),
// //             child: Row(
// //               children: const [
// //                 Icon(Icons.image),
// //                 Padding(
// //                   padding: EdgeInsets.all(7.0),
// //                   child: Text(
// //                     'Gallery',
// //                     style: TextStyle(fontSize: 20),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           SimpleDialogOption(
// //             onPressed: () => pickVideo(ImageSource.camera, context),
// //             child: Row(
// //               children: const [
// //                 Icon(Icons.camera_alt),
// //                 Padding(
// //                   padding: EdgeInsets.all(7.0),
// //                   child: Text(
// //                     'Camera',
// //                     style: TextStyle(fontSize: 20),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           SimpleDialogOption(
// //             onPressed: () => Navigator.of(context).pop(),
// //             child: Row(
// //               children: const [
// //                 Icon(Icons.cancel),
// //                 Padding(
// //                   padding: EdgeInsets.all(7.0),
// //                   child: Text(
// //                     'Cancel',
// //                     style: TextStyle(fontSize: 20),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   @override
// //   void didChangeDependencies() async {
// //     final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
// //     super.didChangeDependencies();
// //   }
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: InkWell(
// //           onTap: () => showOptionsDialog(context),
// //           child: Container(
// //             width: 190,
// //             height: 50,
// //             decoration: BoxDecoration(color: Colors.red),
// //             child: const Center(
// //               child: Text(
// //                 'Add Video',
// //                 style: TextStyle(
// //                   fontSize: 20,
// //                   color: Colors.black,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
