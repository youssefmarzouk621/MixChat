import 'package:chatup/CustomWidgets/flat_chat_message.dart';

class Message {
String id;
String sender;
String receiver;
String type;
String message;

String discussionId;
String seen="false";

DateTime createdAt;
MessageType messageType;

Message(this.id, this.sender, this.receiver, this.type, this.message, this.createdAt, this.messageType);



Message.fromJson(Map<String, dynamic> json,String connected) {

  this.id = json['_id'] as String;
  this.sender = json['sender'] as String;
  this.receiver = json['receiver'] as String;
  this.type = json['type'] as String;
  this.message = json['message'] as String;

  this.discussionId = json['discussionId'] as String;
  this.seen = json['seen'] as String;

  //handling dateTime
  String dateString = json['createdAt'] as String;
  this.createdAt = DateTime.parse(dateString);
  this.createdAt.add(const Duration(hours: 1));

  if(connected==sender){
    this.messageType = MessageType.sent;
  }else{
    this.messageType = MessageType.received;
  }

}

Map<String, dynamic> toJson() => {
  'sender': sender,
  'receiver': receiver,
  'type': type,
  'message': message,
  'discussionId': discussionId,
  'seen':"false",
  'createdAt': createdAt.toString(),
};



}