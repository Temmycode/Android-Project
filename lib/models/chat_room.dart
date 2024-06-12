import 'package:apple_match/models/message.dart';
import 'package:apple_match/models/user_model.dart';

class ChatRoom {
  String? roomId;
  List<User>? users;
  List<Message>? messages;
  int? unreadMessages;

  ChatRoom({this.roomId, this.users, this.messages, this.unreadMessages});
}
