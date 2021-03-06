import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

enum MessageType { sent, received }

class FlatChatMessage extends StatefulWidget {
  final String message;
  final MessageType messageType;
  final Color backgroundColor;
  final Color textColor;
  final String time;
  bool showTime;


  final double maxWidth;
  final double minWidth;

  FlatChatMessage({this.message, this.messageType, this.backgroundColor, this.textColor, this.time, this.showTime, this.minWidth, this.maxWidth});

  @override
  _FlatChatMessageState createState() => _FlatChatMessageState();
}

class _FlatChatMessageState extends State<FlatChatMessage> {

  CrossAxisAlignment messageAlignment() {
    if (widget.messageType == null || widget.messageType == MessageType.received) {
      return CrossAxisAlignment.start;
    } else {
      return CrossAxisAlignment.end;
    }
  }

  double topLeftRadius() {
    if (widget.messageType == null || widget.messageType == MessageType.received) {
      return 0.0;
    } else {
      return 12.0;
    }
  }

  double topRightRadius() {
    if (widget.messageType == null || widget.messageType == MessageType.received) {
      return 12.0;
    } else {
      return 0.0;
    }
  }

  Color messageBgColor(BuildContext context) {
    if (widget.messageType == null || widget.messageType == MessageType.received) {
      return Theme.of(context).primaryColorDark.withOpacity(0.1);
    } else {
      return Theme.of(context).primaryColor;
    }
  }

  Color messageTextColor(BuildContext context) {
    if (widget.messageType == null || widget.messageType == MessageType.received) {
      return Theme.of(context).primaryColorDark;
    } else {
      return Colors.white;
    }
  }

  Widget messageTime() {
    if(widget.showTime != null && widget.showTime == true) {
      return Text(
        widget.time ?? "Time",
        style: TextStyle(
          fontSize: 12.0,
          color: Color(0xFF666666),
        ),
      );
    } else {
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => setState(() { widget.showTime=!widget.showTime; }),
      //onLongPressEnd: (details) => setState(() { widget.showTime=!widget.showTime; }) ,
      child: FocusedMenuHolder(
        blurSize: 1,
        onPressed: (){},
        menuWidth: 308,
        menuBoxDecoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.all(Radius.circular(15.0))),

        menuItems: <FocusedMenuItem>[
          FocusedMenuItem(title: Row(
            children: [
              FlatButton(child: Icon(Icons.thumb_up),onPressed: () {print("like");},minWidth: 15),
              FlatButton(child: Icon(Icons.thumb_down),onPressed: () {print("dislike");},minWidth: 15),
              FlatButton(child: Icon(Icons.headset),onPressed: () {print("headset");},minWidth: 15),
              FlatButton(child: Icon(Icons.headset),onPressed: () {print("headset");},minWidth: 15),
              FlatButton(child: Icon(Icons.headset),onPressed: () {print("headset");},minWidth: 15),
            ],
          ), onPressed: (){}),
        ],
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 3.0,
            horizontal: 24.0,
          ),
          child: Column(
            crossAxisAlignment: messageAlignment(),
            children: [
              Container(
                constraints: BoxConstraints(minWidth: widget.minWidth ?? 100.0, maxWidth: widget.maxWidth ?? 250.0),
                decoration: BoxDecoration(
                  color: widget.backgroundColor ?? messageBgColor(context),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(topLeftRadius()),
                    topRight: Radius.circular(topRightRadius()),
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 16.0,
                ),
                child: Text(
                  widget.message ?? "Message here...",
                  style: TextStyle(
                    color: widget.textColor ?? messageTextColor(context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 3.0,
                ),
                child: messageTime(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
