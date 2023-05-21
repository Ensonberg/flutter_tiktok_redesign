import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:ovatoyu/core/model/chat/message.dart';
import 'package:ovatoyu/ui/screens/chat/chat_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../theme/colors.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = "/chat_screen";
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String? prevUserId;
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: SvgPicture.asset(
              "assets/svgs/BackArrow.svg",
              height: 11.5,
              width: 10.5,
              color: black.withOpacity(0.5),
            ),
          ),
        ),
        leadingWidth: 40,
        backgroundColor: white,
        title: Row(
          children: [
            CircleAvatar(
              child: Image.asset("assets/svgs/Ellipse 1.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Adelaja John",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: black),
                  ),
                  Text(
                    "Last seen today at 09:40pm",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: ViewModelBuilder<ChatViewModel>.reactive(
          viewModelBuilder: () => ChatViewModel(),
          builder: (context, model, child) {
            var media = MediaQuery.of(context).size;
            return SizedBox(
                height: media.height - MediaQuery.of(context).padding.top,
                child: Stack(
                  children: [
                    ListView.builder(
                      itemCount: model.list.length,
                      reverse: true,
                      padding: EdgeInsets.only(top: 10, bottom: 100),
                      itemBuilder: (context, index) {
                        Message message = model.list[index];
                        final bool isMe = message.senderId == "1";
                        final bool isSameUser = prevUserId == message.senderId;
                        prevUserId = message.senderId;
                        return _chatBubble(message, isMe, isSameUser);
                      },
                    ),
                    Positioned(
                      bottom: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: media.width,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 16),
                                    child: SvgPicture.asset(
                                        "assets/svgs/Camera.svg"),
                                  ),
                                  Flexible(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: Container(
                                        width: media.width,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(48),
                                          border:
                                              Border.all(color: grey, width: 2),
                                          backgroundBlendMode: BlendMode.darken,
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16),
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
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: isTyping == true
                                                    ? SvgPicture.asset(
                                                        "assets/svgs/act btn send.svg",
                                                        color: black,
                                                      )
                                                    : Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(right: 8),
                                                        child: SizedBox(
                                                          width: media.width *
                                                              0.15,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              SvgPicture.asset(
                                                                "assets/svgs/Mic.svg",
                                                                color: black,
                                                              ),
                                                              SvgPicture.asset(
                                                                "assets/svgs/act btn.svg",
                                                                color: black,
                                                              )
                                                            ],
                                                          ),
                                                        ),
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
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 5,
                                  width: 134,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: black),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ));
          }),
    );
  }

  static convertTimeStamp(DateTime timestamp) {
    assert(timestamp != null);
    String convertedDate;
    convertedDate = DateFormat.H().add_jm().format(timestamp);
    return convertedDate;
  }

  _chatBubble(Message message, bool isMe, bool isSameUser) {
    if (isMe) {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xff0072F7),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),

                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.withOpacity(0.5),
                //     spreadRadius: 2,
                //     blurRadius: 5,
                //   ),
                // ],
              ),
              child: Text(
                message.message!,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                convertTimeStamp(message.dateTime!),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black45,
                ),
              ),

              // Container(
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.grey.withOpacity(0.5),
              //         spreadRadius: 2,
              //         blurRadius: 5,
              //       ),
              //     ],
              //   ),
              //   child: CircleAvatar(
              //       radius: 15,
              //       backgroundImage:
              //           CachedNetworkImageProvider(model.imageUrl!)),
              // ),
            ],
          )
          // : Container(
          //     child: null,
          //   ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.78,
                  ),
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Text(
                    message.message!,
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 30,
                ),
                Text(
                  "${convertTimeStamp(message.dateTime!)}",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          )
        ],
      );
    }
  }
}
