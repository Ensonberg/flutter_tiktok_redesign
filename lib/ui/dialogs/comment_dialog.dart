import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ovatoyu/ui/theme/colors.dart';

class CommentDialog extends StatefulWidget {
  const CommentDialog({Key? key}) : super(key: key);

  @override
  State<CommentDialog> createState() => _CommentDialogState();
}

class _CommentDialogState extends State<CommentDialog> {
  late StreamSubscription<bool> keyboardSubscription;
  bool isTyping = false;
  @override
  void initState() {
    keyboardSubscription =
        KeyboardVisibilityController().onChange.listen((isVisible) {
      setState(() {
        isTyping = isVisible;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Material(
      color: Colors.white,
      child: Container(
        height: media.height * 0.5,
        color: Colors.white,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 8),
              child: Text(
                "3 Comments",
                style: TextStyle(
                    color: black, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (ctx, index) => ListTile(
                        leading: Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/svgs/Ellipse 1.png"))),
                        ),
                        isThreeLine: true,
                        title: const Text(
                          "Lionel",
                          style: TextStyle(
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        subtitle: const Text(
                          "Dealing with technical support most useful tips",
                          style: TextStyle(
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        trailing: SvgPicture.asset(
                          "assets/svgs/liked_red.svg",
                          width: 16.w,
                          height: 14.4.h,
                        ),
                      )),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 8, left: 8),
                    child: Icon(
                      Icons.emoji_emotions_outlined,
                      size: 25,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffEAEAEC),
                          borderRadius: BorderRadius.circular(8),
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
                                  padding: const EdgeInsets.all(12.0),
                                  child: SvgPicture.asset(
                                    "assets/svgs/act btn send.svg",
                                    color: black,
                                  )),
                              hintStyle: const TextStyle(
                                  color: Color(0xff3B3B3B),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
