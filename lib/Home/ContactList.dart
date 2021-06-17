import 'package:chatup/Chat/ChatPage.dart';
import 'package:chatup/CustomWidgets/flat_add_story_btn.dart';
import 'package:chatup/CustomWidgets/flat_chat_item.dart';
import 'package:chatup/CustomWidgets/flat_counter.dart';
import 'package:chatup/CustomWidgets/flat_profile_image.dart';
import 'package:chatup/CustomWidgets/flat_section_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ContactList extends StatefulWidget{

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlatSectionHeader(
          title: "Contacts",
        ),

        FlatChatItem(
          profileImage: FlatProfileImage(
            onlineIndicator: true,
            imageUrl: "https://images.unsplash.com/photo-1573488693582-260a6f1a51c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1356&q=80",
          ),
          name: "Alix Cage",
        ),
        FlatChatItem(
          profileImage: FlatProfileImage(
            onlineIndicator: true,
            imageUrl: "https://images.unsplash.com/photo-1573488693582-260a6f1a51c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1356&q=80",
          ),
          name: "Alix Cage",
        ),
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



