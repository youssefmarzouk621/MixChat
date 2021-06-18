import 'package:another_flushbar/flushbar.dart';
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

  List<Widget> Tabs = [];

  @override
  void initState() {
    super.initState();
    ws.open("wss://tranquil-journey-23890.herokuapp.com");
    Tabs = [
      ChatList(),
      ContactList(ws),
    ];
  }

  @override
  Widget build(BuildContext context) {

    ws.onSuccess(() async {
      await Flushbar(
          title: 'Hey Youssef',
          message: 'Connected successfully',
          duration: Duration(seconds: 3),
      ).show(context);
      print("new connection");
    });

    ws.onFail(() async {
      print("fail");
      await Flushbar(
          title: 'Error (Failed)',
          message: 'Connection Failed',
          duration: Duration(seconds: 3),
      ).show(context);
    });

    ws.onMessage((data) {
      print(data);
    });

    ws.onClose(() async {
      print("closed without logout");
      await Flushbar(
          title: 'Warning (Closed)',
          message: 'Lost connection ...',
          duration: Duration(seconds: 3),
      ).show(context);
      ws.open("wss://tranquil-journey-23890.herokuapp.com");

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
          child: Tabs[index],
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
