import 'dart:convert';

import 'package:chatup/Models/Conversations.dart';
import 'package:chatup/Models/CoreUser.dart';
import 'package:chatup/Models/Message.dart';
import 'package:chatup/Models/PopulatedMessage.dart';
import 'package:chatup/Statics/Statics.dart';
import 'package:chatup/Storage/UsersRepository.dart';
import 'package:http/http.dart';
import 'package:sm_websocket/sm_websocket.dart';
import 'package:string_to_hex/string_to_hex.dart';

class ChatController {
  Future<List<Message>> getMessages({String sender}) async {
    CoreUser connectedUser = await UsersRepository.getConnectedUser();
    final response = await post(
      Uri.https(baseURL, "api/chat/getMessages/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "sender": sender,
        "receiver": connectedUser.id,
      }),
    );
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      List<Message> messages = [];

      for (var obj in body) {
        Message message = Message.fromJson(obj, connectedUser.id);
        messages.add(message);
      }

      return messages;
    } else {
      throw Exception('Request API Failed');
    }
  }

  Future<String> addMessageToDataBase({Message message}) async {
    CoreUser connectedUser = await UsersRepository.getConnectedUser();

    final response = await post(
      Uri.https(baseURL, "api/chat/addMessage/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "sender": connectedUser.id,
        "receiver": message.receiver,
        "type": message.type,
        "message": message.message,
      }),
    );
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      String message = body["message"] as String;

      return message;
    } else {
      throw Exception('Request API Failed');
    }
  }

  Future<String> generateDiscussionId({String sender, String receiver}) async {
    final response = await post(
      Uri.https(baseURL, "api/chat/generateDiscussionId/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "sender": sender,
        "receiver": receiver,
      }),
    );

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      String discussionId = body["discussionId"] as String;

      return discussionId;
    } else {
      throw Exception('Request API Failed');
    }
  }

  void sendMessageToWebSocket({Message message, WebSocket webSocket}) async {
    CoreUser connectedUser = await UsersRepository.getConnectedUser();

    String discussionId = await this.generateDiscussionId(
        sender: connectedUser.id, receiver: message.receiver);
    message.discussionId = discussionId;

    webSocket.send(
        jsonEncode(message.toJson())); //parse message to JSON then to String
  }

  Future<List<Conversations>> getConversations() async {
    CoreUser connectedUser = await UsersRepository.getConnectedUser();

    final response = await post(
      Uri.https(baseURL, "api/chat/getConversations/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"sender": connectedUser.id}),
    );
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      List<Conversations> conversations = [];

      body.forEach((key, value) {
        List<PopulatedMessage> messages = [];
        for (var message in value) {
          PopulatedMessage populatedMessage =
              PopulatedMessage.fromJson(message, connectedUser.id);
          messages.add(populatedMessage);
        }
        messages.sort((m1, m2) {
          return m1.createdAt.compareTo(m2.createdAt);
        });
        Conversations conversation =
            Conversations.fromJson(messages, key, connectedUser);
        conversations.add(conversation);
      });

      return conversations;
    } else {
      throw Exception('Request API Failed');
    }
  }

  int getUnseenMessages(
      List<PopulatedMessage> messages, CoreUser connectedUser) {
    int count = 0;
    for (var message in messages) {
      if (message.seen == "false" && (message.sender.id != connectedUser.id)) {
        count++;
      }
    }
    return count;
  }
}
