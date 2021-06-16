import 'package:chatup/CustomWidgets/flat_action_btn.dart';
import 'package:chatup/CustomWidgets/flat_add_story_btn.dart';
import 'package:chatup/CustomWidgets/flat_chat_item.dart';
import 'package:chatup/CustomWidgets/flat_counter.dart';
import 'package:chatup/CustomWidgets/flat_page_header.dart';
import 'package:chatup/CustomWidgets/flat_page_wrapper.dart';
import 'package:chatup/CustomWidgets/flat_profile_image.dart';
import 'package:chatup/CustomWidgets/flat_section_header.dart';
import 'package:chatup/Chat/ChatPage.dart';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlatPageWrapper(
        scrollType: ScrollType.floatingHeader,
        header: FlatPageHeader(
          prefixWidget: FlatActionButton(
            iconData: Icons.menu,
          ),
          title: "Flat Social",
          suffixWidget: FlatActionButton(
            iconData: Icons.search,
          ),
        ),
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
                  child: FlatAddStoryBtn(),
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
                FlatProfileImage(
                  outlineIndicator: true,
                ),
                FlatProfileImage(
                  outlineIndicator: true,
                ),
                FlatProfileImage(
                  outlineIndicator: true,
                )
              ],
            ),
          ),
          FlatSectionHeader(
            title: "Marked Important",
          ),
          FlatChatItem(
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
              imageUrl: "https://images.unsplash.com/photo-1536057222397-e51989d3cb8a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=639&q=80",
            ),
            name: "And His Brother",
          ),
          FlatChatItem(
            profileImage: FlatProfileImage(
              onlineIndicator: true,
              imageUrl: "https://images.unsplash.com/photo-1558392204-ac78741f4abf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
            ),
            name: "And Sister",
          ),
          FlatChatItem(
            profileImage: FlatProfileImage(
              onlineIndicator: true,
              imageUrl: "https://images.unsplash.com/photo-1521235042493-c5bef89dc2c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1385&q=80",
            ),
            name: "Father",
          ),
          FlatChatItem(
            profileImage: FlatProfileImage(
              onlineIndicator: true,
              imageUrl: "https://images.unsplash.com/photo-1499557354967-2b2d8910bcca?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1235&q=80",
            ),
            name: "Mother",
          ),
          FlatChatItem(
            profileImage: FlatProfileImage(
              onlineIndicator: true,
              imageUrl: "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80",
            ),
            name: "Not From Family",
          )
        ],
      ),
    );
  }
}
