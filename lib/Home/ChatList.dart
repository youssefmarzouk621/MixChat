import 'package:chatup/Controllers/ChatController.dart';
import 'package:chatup/CustomWidgets/CardItem.dart';
import 'package:chatup/CustomWidgets/flat_add_story_btn.dart';
import 'package:chatup/CustomWidgets/flat_chat_item.dart';
import 'package:chatup/CustomWidgets/flat_counter.dart';
import 'package:chatup/CustomWidgets/flat_profile_image.dart';
import 'package:chatup/CustomWidgets/flat_section_header.dart';
import 'package:chatup/Models/Conversations.dart';
import 'package:chatup/Models/CoreUser.dart';
import 'package:chatup/Models/User.dart';
import 'package:chatup/Statics/Statics.dart';
import 'package:chatup/Storage/UsersRepository.dart';
import 'package:chatup/Story/Story.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sm_websocket/sm_websocket.dart';

class ChatList extends StatefulWidget {
  WebSocket ws;

  ChatList(this.ws);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final ChatController chatController = ChatController();
  List<Conversations> conversations = [];
  ScrollController _controller = new ScrollController();
  CoreUser connectedUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chatController.getConversations().then((convos) => {
      UsersRepository.getConnectedUser().then((user) => {
        setState(() {
          connectedUser = user;
          conversations = convos;
        })
      })
    });



  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        Padding(
            padding: EdgeInsets.only(
          top: 90.0,
          bottom: 12.0,
        )),
        FlatSectionHeader(
          title: "Recent Moments",
        ),
        Container(
          height: 76.0,
          margin: EdgeInsets.symmetric(
            vertical: 16.0,
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                ),
                child: FlatAddStoryBtn(
                  onPressed: () {
                    print("clicked add story");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Story()));
                  },
                ),
              ),
              FlatProfileImage(
                imageUrl:
                    "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80",
                onlineIndicator: true,
                outlineIndicator: true,
              ),
              FlatProfileImage(
                outlineIndicator: true,
                onlineIndicator: true,
                imageUrl:
                    "https://images.unsplash.com/photo-1502323777036-f29e3972d82f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
              ),
              FlatProfileImage(
                outlineIndicator: true,
                imageUrl:
                    "https://images.unsplash.com/photo-1582721244958-d0cc82a417da?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2179&q=80",
              ),
              FlatProfileImage(
                onlineIndicator: true,
                outlineIndicator: true,
                imageUrl:
                    "https://images.unsplash.com/photo-1583243567239-3727551e0c59?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1112&q=80",
              ),
            ],
          ),
        ),

        FlatSectionHeader(
          title: "Marked Important",
        ), //Marked Important

        FlatChatItem(
          onLongPress: () {
            print("long pressed");
          },
          onPressed: () {
            /*Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChatPage())
        );*/
          },
          name: "Akshaye JH",
          profileImage: FlatProfileImage(
            imageUrl:
                "https://cdn.dribbble.com/users/1281912/avatars/normal/febecc326c76154551f9d4bbab73f97b.jpg?1468927304",
            onlineIndicator: true,
          ),
          message: "Hello World!, Welcome to Flat Social - Flutter UI Kit.",
          multiLineMessage: true,
          counter: FlatCounter(
            text: "1",
          ),
        ),

        FlatSectionHeader(
          title: "Chats",
        ),

        //Chats
        Column(
          children: conversations.map((item) {
            //print(conversations);
            User friend = item.messages.first.sender;
            if(item.messages.first.sender.id==connectedUser.id){
              friend=item.messages.first.receiver;
            }

            return FlatChatItem(
              profileImage: FlatProfileImage(
                onlineIndicator: true,
                imageUrl: baseUploadsURL+friend.avatar,
              ),
              name: friend.firstName+" "+friend.lastName,
              message: item.messages.last.message,
              seen: item.messages.last.seen,
            );
          }).toList(),
        )
      ],
    );
  }
}
