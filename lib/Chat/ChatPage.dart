import 'package:chatup/CustomWidgets/flat_action_btn.dart';
import 'package:chatup/CustomWidgets/flat_chat_message.dart';
import 'package:chatup/CustomWidgets/flat_message_input_box.dart';
import 'package:chatup/CustomWidgets/flat_page_header.dart';
import 'package:chatup/CustomWidgets/flat_page_wrapper.dart';
import 'package:chatup/CustomWidgets/flat_profile_image.dart';
import 'package:chatup/Models/User.dart';
import 'package:chatup/Statics/Statics.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  User friend;
  ChatPage(this.friend);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlatPageWrapper(
        scrollType: ScrollType.floatingHeader,
        reverseBodyList: true,
        header: FlatPageHeader(
          prefixWidget: FlatActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: widget.friend.firstName+" "+widget.friend.lastName,
          textSize: 22,
          suffixWidget: FlatProfileImage(
            size: 35.0,
            onlineIndicator: true,
            imageUrl: baseUploadsURL+widget.friend.avatar,
            onPressed: () {
              print("Clicked to open Profile");
            },
          ),
        ),
        child: ListView(//child
          reverse: true,
          padding: EdgeInsets.only(
            top: 122.0,
            bottom: 80.0,
          ),
          children: [
            FlatChatMessage(
              message: "Hello World!, This is the first message.",
              messageType: MessageType.sent,
              showTime: true,
              time: "2 mins ago",
            ),
            FlatChatMessage(
              message: "Typing another message from the input box.",
              messageType: MessageType.sent,
              showTime: true,
              time: "2 mins ago",
            ),
            FlatChatMessage(
              message: "Message Length Small.",
              showTime: true,
              time: "2 mins ago",
            ),
            FlatChatMessage(
              message: "Message Length Large. This message has more text to configure the size of the message box.",
              showTime: true,
              time: "2 mins ago",
            ),
            FlatChatMessage(
              message: "Meet me tomorrow at the coffee shop.",
              showTime: true,
              time: "2 mins ago",
            ),
            FlatChatMessage(
              message: "Around 11 o'clock.",
              showTime: true,
              time: "2 mins ago",
            ),
            FlatChatMessage(
              message: "Flat Social UI kit is going really well. Hope this finishes soon.",
              showTime: true,
              time: "2 mins ago",
            ),
            FlatChatMessage(
              message: "Final Message in the list.",
              showTime: true,
              time: "2 mins ago",
            ),
          ],
        ),

        footer: FlatMessageInputBox(
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
    );
  }
}
