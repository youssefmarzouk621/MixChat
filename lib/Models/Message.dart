import 'package:chatup/CustomWidgets/flat_chat_message.dart';
import 'package:intl/intl.dart';

class Message {
String id;
String sender;
String receiver;
String type;
String message;
DateTime createdAt;
MessageType messageType;

Message(this.id, this.sender, this.receiver, this.type, this.message, this.createdAt, this.messageType);

Message.fromJson(Map<String, dynamic> json,String connected) {
  String dateString = json['createdAt'] as String;

  this.id = json['_id'] as String;
  this.sender = json['sender'] as String;
  this.receiver = json['receiver'] as String;
  this.type = json['type'] as String;
  this.message = json['message'] as String;
  this.createdAt = DateTime.parse(dateString);

  if(connected==sender){
    this.messageType = MessageType.sent;
  }else{
    this.messageType = MessageType.received;
  }

}


}