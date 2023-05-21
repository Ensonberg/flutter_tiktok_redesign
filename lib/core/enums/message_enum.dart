enum MessageType { text, video, audio, image }

extension Type on MessageType {
  MessageType get type {
    switch (this) {
      case MessageType.text:
        return MessageType.text;
        break;
      case MessageType.video:
        return MessageType.video;
        break;
      case MessageType.audio:
        return MessageType.audio;
        break;
      case MessageType.image:
        return MessageType.image;
        break;
    }
  }
}
