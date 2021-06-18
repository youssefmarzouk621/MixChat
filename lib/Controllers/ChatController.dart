import 'dart:convert';

import 'package:chatup/Models/Message.dart';
import 'package:chatup/Models/User.dart';
import 'package:chatup/Statics/Statics.dart';
import 'package:http/http.dart';
import 'package:sm_websocket/sm_websocket.dart';

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

  Future<String> addMessageToDataBase({Message message}) async{
    final response = await post(
      Uri.http(baseURL,"api/chat/addMessage/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "sender": message.sender,
        "receiver": message.receiver,
        "type": message.type,
        "message": message.message,
      }),
    );
    if(response.statusCode==200){
      var body = json.decode(response.body);
      String message = body["message"] as String;

      return message;
    }else{
      throw Exception('Request API Failed');
    }
  }

  void sendMessageToWebSocket({Message message,WebSocket webSocket}) async{
    webSocket.send(
        jsonEncode(message.toJson())
    ); //parse message to JSON then to String
  }

}