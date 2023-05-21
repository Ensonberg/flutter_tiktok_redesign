import 'package:ovatoyu/core/enums/message_enum.dart';
import 'package:ovatoyu/core/model/chat/message.dart';
import 'package:stacked/stacked.dart';

class ChatViewModel extends BaseViewModel {
  //TODO dummy chat list;

  final List<Message> _list = [
    Message(
        message: "hi",
        senderId: "1",
        receiverId: "2",
        dateTime: DateTime.now(),
        messageType: MessageType.video),
    Message(
        message: "I hope you found the instrument?",
        senderId: "2",
        receiverId: "2",
        dateTime: DateTime.now(),
        messageType: MessageType.text),
    Message(
        message:
            "Yoooo, so you were at that festival too! How did you get so close to the stage?!",
        senderId: "1",
        receiverId: "2",
        dateTime: DateTime.now(),
        messageType: MessageType.text),
    Message(
        message:
            "Yoooo, so you were at that festival too! How did you get so close to the stage?!",
        senderId: "2",
        dateTime: DateTime.now(),
        receiverId: "1",
        messageType: MessageType.text)
  ];

  List<Message> get list => _list;
}
