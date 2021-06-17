import 'package:chatup/Chat/ChatPage.dart';
import 'package:chatup/CustomWidgets/flat_add_story_btn.dart';
import 'package:chatup/CustomWidgets/flat_chat_item.dart';
import 'package:chatup/CustomWidgets/flat_counter.dart';
import 'package:chatup/CustomWidgets/flat_profile_image.dart';
import 'package:chatup/CustomWidgets/flat_section_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Story extends StatefulWidget{

  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Center(
        child: Container(
          child: Text(
              "story", style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}



