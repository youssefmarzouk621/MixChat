import 'dart:convert';

import 'package:chatup/Models/Message.dart';
import 'package:chatup/Models/User.dart';
import 'package:chatup/Statics/Statics.dart';
import 'package:http/http.dart';

class ChatController {
  Future<List<Message>> getMessages({String sender,String receiver}) async{
    final response = await post(
      Uri.http(baseURL,"api/chat/getMessages/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "sender": sender,
        "receiver": receiver,
      }),
    );
    if(response.statusCode==200){
      var body = json.decode(response.body);
      List<Message> messages = [];

      for(var obj in body){
        Message message = Message.fromJson(obj,receiver);
        messages.add(message);
      }

      return messages;
    }else{
      throw Exception('Request API Failed');
    }

  }



}