import 'package:flutter/material.dart';

class MessagesGroupSeperator extends StatelessWidget {
  final String title;
  final double textSize;
  final FontWeight fontWeight;
  final Color backgroundColor;
  final Color textColor;
  MessagesGroupSeperator({this.title, this.textSize, this.fontWeight, this.backgroundColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        child: Text(
          title ?? "Section Header",
          style: TextStyle(
            color: textColor ?? Theme.of(context).primaryColorDark,
            fontWeight: fontWeight ?? FontWeight.w500,
            fontSize: textSize ?? 15.0,
          ),
        ),
      ),
    );
  }
}