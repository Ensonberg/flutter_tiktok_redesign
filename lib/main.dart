import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ovatoyu/app/service_locator.dart';
import 'package:ovatoyu/ui/screens/auth/email_auth_screen.dart';
import 'package:ovatoyu/ui/screens/auth/gettig_started_screen.dart';
import 'package:ovatoyu/ui/screens/auth/phone_auth_screen.dart';
import 'package:ovatoyu/ui/screens/auth/user_details_screen.dart';
import 'package:ovatoyu/ui/screens/chat/chat_screen.dart';
import 'package:ovatoyu/ui/screens/competition/competition_screen.dart';
import 'package:ovatoyu/ui/screens/competition/competition_scroll_screen.dart';
import 'package:ovatoyu/ui/screens/interests/interest_screen.dart';
import 'package:ovatoyu/ui/screens/join_a_competition/join_competition_screen.dart';
import 'package:ovatoyu/ui/screens/main_screen/main_screen.dart';
import 'package:ovatoyu/ui/screens/settings/settings_screen.dart';
import 'package:ovatoyu/ui/screens/single_live/single_live_screen.dart';
import 'package:ovatoyu/ui/screens/video/share/share_video_screen.dart';
import 'package:ovatoyu/ui/screens/video/start_video/start_video_screen.dart';
import 'package:ovatoyu/ui/screens/video/trim_video/trim_video_screen.dart';
import 'package:ovatoyu/ui/screens/video/upload_video/upload_video.dart';
import 'package:ovatoyu/ui/styles/color.dart';

import 'ui/screens/profile/edit_profile_screen.dart';

late List<CameraDescription> cameras;
//get List<CameraDescription> camera=>_cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (child) {
          return GetMaterialApp(
            title: 'Ovatoyo App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: OColor.primaryColor,
                fontFamily: "SF Pro Display"),
            home: const GettingStartedScreen(),
            // home: const MainScreen(),
            // initialRoute: HomePage.routeName,
            routes: {
              MainScreen.routeName: (_) => const MainScreen(),
              SingleLiveScreen.routeName: (_) => const SingleLiveScreen(),
              ChatScreen.routeName: (_) => const ChatScreen(),
              UploadVideoScreen.routeName: (_) => UploadVideoScreen(),
              StartVideoScreen.routeName: (_) => StartVideoScreen(),
              JoinCompetitionScreen.routeName: (_) =>
                  const JoinCompetitionScreen(),
              CompetitionScreen.routeName: (_) => const CompetitionScreen(),
              CompetitionScrollScreen.routeName: (_) =>
                  const CompetitionScrollScreen(),
              TrimVideoScreen.routeName: (_) => const TrimVideoScreen(),
              ShareVideoScreen.routeName: (_) => const ShareVideoScreen(),
              PhoneNumberAuthScreen.routeName: (_) =>
                  const PhoneNumberAuthScreen(),
              EmailAuthScreen.routeName: (_) => const EmailAuthScreen(),
              UserDetailsScreen.routeName: (_) => const UserDetailsScreen(),
              InterestScreen.routeName: (_) => const InterestScreen(),
              SettingsScreen.routeName: (_) => const SettingsScreen(),
              EditProfileScreen.routeName: (_) => const EditProfileScreen(),
            },
          );
        });
  }
}
