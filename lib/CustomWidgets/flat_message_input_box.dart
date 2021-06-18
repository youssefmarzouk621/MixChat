import 'package:chatup/CustomWidgets/flat_action_btn.dart';
import 'package:flutter/material.dart';

class FlatMessageInputBox extends StatelessWidget {
  final Widget prefix;
  final Widget suffix;
  final Widget messageField;
  final Widget sendBtn;

  final bool roundedCorners;


  FlatMessageInputBox({this.prefix, this.suffix, this.roundedCorners, this.messageField, this.sendBtn});


  @override
  Widget build(BuildContext context) {

    double cornerRadius() {
      if(roundedCorners != null && roundedCorners == true) {
        return 60.0;
      } else {
        return 0.0;
      }
    }

    double padding() {
      if(roundedCorners != null && roundedCorners == true) {
        return 12.0;
      } else {
        return 8.0;
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(cornerRadius()),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 20,
            blurRadius: 20,
            offset: Offset(0, -5), // changes position of shadow
          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark.withOpacity(0.1),
          borderRadius: BorderRadius.circular(cornerRadius()),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: padding(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            prefix ?? SizedBox(width: 0, height: 0),
            Expanded(
              child: messageField,
            ),
            suffix ?? SizedBox(width: 0, height: 0),
            sendBtn,
          ],
        ),
      ),
    );
  }
}



