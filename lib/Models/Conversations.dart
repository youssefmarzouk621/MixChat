import 'package:chatup/Models/CoreUser.dart';
import 'package:chatup/Models/PopulatedMessage.dart';

class Conversations {
  String conversation;
  List<PopulatedMessage> messages;


  Conversations({this.conversation, this.messages});

  Conversations.fromJson(dynamic messagesList,String key,CoreUser connectedUser ) {
    print("inside conversations from json");
    this.conversation = key;
    //print(messagesList);
    for(var message in messagesList){
      PopulatedMessage populatedMessage = PopulatedMessage.fromJson(message, connectedUser.id);
      this.messages.add(populatedMessage);
    }

  }
}