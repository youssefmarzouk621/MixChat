import 'package:chatup/Models/CoreUser.dart';
import 'package:chatup/Models/PopulatedMessage.dart';

class Conversations {
  String user;
  List<PopulatedMessage> messages;


  Conversations({this.user, this.messages});

  Conversations.fromJson(List<PopulatedMessage> messagesList,String key,CoreUser connectedUser ) {

    this.user = key;
    this.messages = messagesList;

  }

  @override
  String toString() {
    return 'Conversations{user: $user, messages: $messages}';
  }
}