import 'package:chatup/Chat/ChatPage.dart';
import 'package:chatup/CustomWidgets/flat_add_story_btn.dart';
import 'package:chatup/CustomWidgets/flat_chat_item.dart';
import 'package:chatup/CustomWidgets/flat_counter.dart';
import 'package:chatup/CustomWidgets/flat_profile_image.dart';
import 'package:chatup/CustomWidgets/flat_section_header.dart';
import 'package:chatup/Story/Story.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ChatList extends StatefulWidget{

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                ),
                child: FlatAddStoryBtn(
                  onPressed: () {
                    print("clicked add story");
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Story())
                    );
                  },
                ),
              ),
              FlatProfileImage(
                imageUrl: "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80",
                onlineIndicator: true,
                outlineIndicator: true,
              ),
              FlatProfileImage(
                outlineIndicator: true,
                onlineIndicator: true,
                imageUrl: "https://images.unsplash.com/photo-1502323777036-f29e3972d82f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
              ),
              FlatProfileImage(
                outlineIndicator: true,
                imageUrl: "https://images.unsplash.com/photo-1582721244958-d0cc82a417da?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2179&q=80",
              ),
              FlatProfileImage(
                onlineIndicator: true,
                outlineIndicator: true,
                imageUrl: "https://images.unsplash.com/photo-1583243567239-3727551e0c59?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1112&q=80",
              ),

            ],
          ),
        ),
        FlatSectionHeader(
          title: "Marked Important",
        ),//Marked Important

        FlatChatItem(
          onLongPress: (){
            print("long pressed");
          },
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ChatPage())
            );
          },
          name: "Akshaye JH",
          profileImage: FlatProfileImage(
            imageUrl: "https://cdn.dribbble.com/users/1281912/avatars/normal/febecc326c76154551f9d4bbab73f97b.jpg?1468927304",
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
        ),//Chats

        FlatChatItem(
          profileImage: FlatProfileImage(
            onlineIndicator: true,
            imageUrl: "https://images.unsplash.com/photo-1573488693582-260a6f1a51c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1356&q=80",
          ),
          name: "Alix Cage",
        ),
      ],
    );
  }
}



