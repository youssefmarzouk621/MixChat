import 'package:chatup/CustomWidgets/flat_action_btn.dart';
import 'package:chatup/CustomWidgets/flat_page_header.dart';
import 'package:chatup/CustomWidgets/flat_page_wrapper.dart';
import 'package:chatup/Home/ChatList.dart';
import 'package:chatup/Home/ContactList.dart';

import 'package:flutter/material.dart';
import 'package:sm_websocket/sm_websocket.dart';

class Homepage extends StatefulWidget {

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  int index = 0;
  WebSocket ws = WebSocket();

  final Tabs = [
    ChatList(),
    ContactList(),
  ];

  @override
  void initState() {
    super.initState();
    ws.open("wss://tranquil-journey-23890.herokuapp.com");
  }

  @override
  Widget build(BuildContext context) {

    ws.onSuccess(() {
      print("new connection");
    });

    ws.onFail(() {
      print("fail");
    });

    ws.onMessage((data) {
      print(data);
    });

    ws.onClose(() {
      print("closed");
    });


    return Scaffold(
      body: new WillPopScope(
        onWillPop: () async => false,
        child: FlatPageWrapper(
          scrollType: ScrollType.floatingHeader,
          header: FlatPageHeader(
            prefixWidget: Text(""),
            title: "MixChat",
            suffixWidget: FlatActionButton(
              onPressed: (){
                ws.close();
                ws.onClose(() {
                  print("closed connection");
                });
              },
              iconData: Icons.logout,
            ),
          ),
          children: [
              Tabs[index],
          ],
        ),
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
