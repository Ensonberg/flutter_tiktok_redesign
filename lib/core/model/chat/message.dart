import 'package:ovatoyu/core/enums/message_enum.dart';

class Message {
  String? message;
  String? senderId;
  String? receiverId;
  DateTime? dateTime;
  MessageType? messageType;

  Message(
      {this.message,
      this.senderId,
      this.receiverId,
      this.dateTime,
      this.messageType});
}
