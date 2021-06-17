import 'package:chatup/Controllers/ChatController.dart';
import 'package:chatup/CustomWidgets/flat_action_btn.dart';
import 'package:chatup/CustomWidgets/flat_chat_message.dart';
import 'package:chatup/CustomWidgets/flat_message_input_box.dart';
import 'package:chatup/CustomWidgets/flat_page_header.dart';
import 'package:chatup/CustomWidgets/flat_page_wrapper.dart';
import 'package:chatup/CustomWidgets/flat_profile_image.dart';
import 'package:chatup/Models/Message.dart';
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

  List<Message> messages = [];
  final ChatController chatController = ChatController();
  @override
  void initState() {
    super.initState();
    chatController.getMessages(
      sender: widget.friend.id, //(friend)
      receiver: "60cb38f5063b48abf6cedc2d", //(connectedUser)
    ).then((result) {

        setState(() {
          messages = result;
        });
    });
  }

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
        child: ListView.builder(
          itemCount: messages.length,
          padding: EdgeInsets.only(
            top: 122.0,
            bottom: 80.0,
          ),
          reverse: true,
          itemBuilder: (context, index) {

            return FlatChatMessage(
              message: messages[index].message,
              messageType: messages[index].messageType,
              showTime: true,
              time: dateFormat.format(messages[index].createdAt) ,
            );
          },
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
