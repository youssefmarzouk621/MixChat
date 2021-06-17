import 'package:chatup/CustomWidgets/flat_action_btn.dart';
import 'package:chatup/CustomWidgets/flat_page_header.dart';
import 'package:chatup/CustomWidgets/flat_page_wrapper.dart';
import 'package:chatup/Home/ChatList.dart';
import 'package:chatup/Home/ContactList.dart';

import 'package:flutter/material.dart';
class Homepage extends StatefulWidget {

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  int index = 0;

  final Tabs = [
    ChatList(),
    ContactList(),
  ];

  @override
  Widget build(BuildContext context) {



    return Scaffold(

      body: FlatPageWrapper(
        scrollType: ScrollType.floatingHeader,
        header: FlatPageHeader(
          prefixWidget: Text(""),
          title: "MixChat",
          suffixWidget: FlatActionButton(

            iconData: Icons.logout,
          ),
        ),
        children: [
            Tabs[index],
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            title: Text("Messages"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts_outlined),
            title: Text("Contacts"),
          )
        ],
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
      ),
    );
  }
}
