import 'dart:convert';

import 'package:chatup/Controllers/ChatController.dart';
import 'package:chatup/CustomWidgets/MessagesGroupSeperator.dart';
import 'package:chatup/CustomWidgets/flat_action_btn.dart';
import 'package:chatup/CustomWidgets/flat_chat_message.dart';
import 'package:chatup/CustomWidgets/flat_message_input_box.dart';
import 'package:chatup/CustomWidgets/flat_page_header.dart';
import 'package:chatup/CustomWidgets/flat_page_wrapper.dart';
import 'package:chatup/CustomWidgets/flat_profile_image.dart';
import 'package:chatup/Models/CoreUser.dart';
import 'package:chatup/Models/Message.dart';
import 'package:chatup/Models/User.dart';
import 'package:chatup/Statics/Statics.dart';
import 'package:chatup/Storage/UsersRepository.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:sm_websocket/sm_websocket.dart';

class ChatPage extends StatefulWidget {
  User friend;
  WebSocket ws;

  ChatPage(this.friend, this.ws);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool isEmptyField = true;

  List<Message> messages = [];
  final ChatController chatController = ChatController();
  final messageValue = TextEditingController();
  CoreUser connectedUser;

  @override
  void initState() {
    super.initState();
    UsersRepository.getConnectedUser().then((value) => {connectedUser = value});

    chatController
        .getMessages(
      sender: widget.friend.id, //(friend)
    )
        .then((result) {
      result.sort((m1, m2) {
        return m1.createdAt.compareTo(m2.createdAt);
      });
      setState(() {
        messages = result.reversed.toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.ws.onMessage((data) {
      Message message = Message.fromJson(jsonDecode(data), connectedUser.id);
      if (message.receiver == connectedUser.id) {
        setState(() {
          messages.add(message);
        });
      }
    });

    return Scaffold(
      body: FlatPageWrapper(
        scrollType: ScrollType.fixedHeader,
        reverseBodyList: true,
        header: FlatPageHeader(
          prefixWidget: FlatActionButton(
            onPressed: () {
              Navigator.of(context).pop("refresh");
            },
          ),
          title: widget.friend.firstName + " " + widget.friend.lastName,
          textSize: 22,
          suffixWidget: FlatProfileImage(
            size: 35.0,
            onlineIndicator: true,
            imageUrl: baseUploadsURL + widget.friend.avatar,
            onPressed: () {
              print("Clicked to open Profile");
            },
          ),
        ),
        child: GestureDetector(
          onTapUp: (details) => FocusScope.of(context).unfocus(),
          child: GroupedListView<Message, String>(
            sort: false,
            elements: messages,
            groupBy: (message) {
              return groupFormat.format(message.createdAt);
            },
            groupSeparatorBuilder: (String date) => MessagesGroupSeperator(
              title: date,
            ),
            padding: EdgeInsets.only(
              bottom: 5.0,
            ),
            reverse: true,
            order: GroupedListOrder.DESC,
            itemBuilder: (context, dynamic msg) {
              return FlatChatMessage(
                message: msg.message,
                messageType: msg.messageType,
                showTime: msg.id == messages.first.id,
                time: timeFormat.format(msg.createdAt),
              );
            },
          ),
        ),
        footer: Container(
          padding: EdgeInsets.only(
            bottom: 10.0,
          ),
          child: FlatMessageInputBox(
            messageField: TextField(
              controller: messageValue,
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    isEmptyField = true;
                  } else {
                    isEmptyField = false;
                  }
                });
              },
              decoration: InputDecoration(
                hintText: "Enter Message...",
                hintStyle: TextStyle(
                  color: Theme.of(context).primaryColorDark.withOpacity(0.6),
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(
                  16.0,
                ),
              ),
              style: TextStyle(color: Theme.of(context).primaryColorDark),
            ),
            sendBtn: FlatActionButton(
              onPressed: () {
                if (isEmptyField) {
                  print("send like");
                } else {
                  //add message to socket
                  chatController.sendMessageToWebSocket(
                      message: Message(
                          "id",
                          connectedUser.id,
                          widget.friend.id,
                          "text",
                          messageValue.text,
                          DateTime.now(),
                          MessageType.sent),
                      webSocket: widget.ws);

                  //add message database
                  chatController
                      .addMessageToDataBase(
                          message: Message(
                              "id",
                              connectedUser.id,
                              widget.friend.id,
                              "text",
                              messageValue.text,
                              DateTime.now(),
                              MessageType.sent))
                      .then((response) => {print(response)});

                  //add message to localStorage

                  //add message to conversation
                  setState(() {
                    messages.add(Message(
                        "id",
                        User.fromCoreUser(connectedUser).id,
                        widget.friend.id,
                        "text",
                        messageValue.text,
                        DateTime.now(),
                        MessageType.sent));
                    messages.sort((m1, m2) {
                      return m1.createdAt.compareTo(m2.createdAt);
                    });
                    messages = messages.reversed.toList();
                    messageValue.text = "";
                    isEmptyField = true;
                  });
                }
              },
              icon: isEmptyField
                  ? RichText(
                      text: TextSpan(
                      text: '????', // emoji characters
                      style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: 'EmojiOne',
                      ),
                    ))
                  : Icon(
                      Icons.send,
                      size: 24.0,
                      color: Theme.of(context).primaryColorDark,
                    ),
            ),
            prefix: FlatActionButton(
              iconData: Icons.add,
              iconSize: 24.0,
            ),
            roundedCorners: true,
            suffix: FlatActionButton(
              iconData: Icons.image,
              iconSize: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}
