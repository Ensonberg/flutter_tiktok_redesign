import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ovatoyu/ui/screens/chat/chat_screen.dart';

import '../../../../theme/colors.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        centerTitle: true,
        title: Text(
          "Messages",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 16, color: black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset("assets/svgs/Notification.svg"),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(ChatScreen.routeName);
                },
                leading: SizedBox(
                  height: 56,
                  width: 56,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      "assets/svgs/Ellipse 1.png",
                      height: 56,
                      fit: BoxFit.cover,
                      width: 56,
                    ),
                  ),
                ),
                title: Text(
                  "Jackson Ali",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                subtitle: Text(
                  "I like your videos so much! ",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                ),
                trailing: Text(
                  "3m",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ),
            );
          }),
    );
  }
}
