import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ovatoyu/ui/screens/profile/edit_profile_screen.dart';
import 'package:ovatoyu/ui/theme/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 50.w,
                    ),
                    const Text(
                      "@mondough",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SvgPicture.asset("assets/svgs/settings.svg")
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: const [
                            Text(
                              "36",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Following",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        ClipOval(
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl:
                                "https://q5n8c8q9.rocketcdn.me/wp-content/uploads/2018/08/The-20-Best-Royalty-Free-Music-Sites-in-2018.png",
                            height: 100.0,
                            width: 100.0,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        Column(
                          children: const [
                            Text(
                              "13",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Followers",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "@salvadordev",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Column(
                    //       children: [
                    //         Text(
                    //           "36",
                    //           style: TextStyle(
                    //               fontSize: 20, fontWeight: FontWeight.bold),
                    //         ),
                    //         SizedBox(
                    //           height: 5,
                    //         ),
                    //         Text(
                    //           "Following",
                    //           style: TextStyle(
                    //               fontSize: 12, fontWeight: FontWeight.normal),
                    //         ),
                    //       ],
                    //     ),
                    //     Container(
                    //       color: Colors.black54,
                    //       width: 1,
                    //       height: 15,
                    //       margin: EdgeInsets.symmetric(horizontal: 15),
                    //     ),
                    //     Column(
                    //       children: [
                    //         Text(
                    //           "13",
                    //           style: TextStyle(
                    //               fontSize: 20, fontWeight: FontWeight.bold),
                    //         ),
                    //         SizedBox(
                    //           height: 5,
                    //         ),
                    //         Text(
                    //           "Followers",
                    //           style: TextStyle(
                    //               fontSize: 12, fontWeight: FontWeight.normal),
                    //         ),
                    //       ],
                    //     ),
                    //     Container(
                    //       color: Colors.black54,
                    //       width: 1,
                    //       height: 15,
                    //       margin: EdgeInsets.symmetric(horizontal: 15),
                    //     ),
                    //     Column(
                    //       children: [
                    //         Text(
                    //           "143",
                    //           style: TextStyle(
                    //               fontSize: 20, fontWeight: FontWeight.bold),
                    //         ),
                    //         SizedBox(
                    //           height: 5,
                    //         ),
                    //         Text(
                    //           "Likes",
                    //           style: TextStyle(
                    //               fontSize: 12, fontWeight: FontWeight.normal),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(EditProfileScreen.routeName);
                          },
                          child: Container(
                            width: 140,
                            height: 47,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(color: Colors.black12)),
                            child: const Center(
                              child: Text(
                                "Edit profile",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 45,
                          height: 47,
                          decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(2)),
                          child: Center(
                              child: SvgPicture.asset(
                                  "assets/svgs/share_prof.svg")),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.menu),
                              SizedBox(
                                height: 7,
                              ),
                              Container(
                                color: Colors.black,
                                height: 2,
                                width: 55,
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.favorite_border,
                                color: Colors.black26,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Container(
                                color: Colors.transparent,
                                height: 2,
                                width: 55,
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.lock_outline,
                                color: Colors.black26,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Container(
                                color: Colors.transparent,
                                height: 2,
                                width: 55,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 160,
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                border: Border.all(
                                    color: Colors.white70, width: .5)),
                            child: FittedBox(
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl:
                                    "https://media.giphy.com/media/Ii4Cv63yG9iYawDtKC/giphy.gif",
                                placeholder: (context, url) => Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 160,
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                border: Border.all(
                                    color: Colors.white70, width: .5)),
                            child: FittedBox(
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl:
                                    "https://media.giphy.com/media/tqfS3mgQU28ko/giphy.gif",
                                placeholder: (context, url) => Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 160,
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                border: Border.all(
                                    color: Colors.white70, width: .5)),
                            child: FittedBox(
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl:
                                    "https://media.giphy.com/media/3o72EX5QZ9N9d51dqo/giphy.gif",
                                placeholder: (context, url) => Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 160,
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                border: Border.all(
                                    color: Colors.white70, width: .5)),
                            child: FittedBox(
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl:
                                    "https://media.giphy.com/media/4oMoIbIQrvCjm/giphy.gif",
                                placeholder: (context, url) => Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 160,
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                border: Border.all(
                                    color: Colors.white70, width: .5)),
                            child: FittedBox(
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl:
                                    "https://media.giphy.com/media/aZmD30dCFaPXG/giphy.gif",
                                placeholder: (context, url) => Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 160,
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                border: Border.all(
                                    color: Colors.white70, width: .5)),
                            child: FittedBox(
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl:
                                    "https://media.giphy.com/media/NU8tcjnPaODTy/giphy.gif",
                                placeholder: (context, url) => Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
