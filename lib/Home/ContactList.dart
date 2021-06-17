import 'package:chatup/Chat/ChatPage.dart';
import 'package:chatup/Controllers/UsersController.dart';
import 'package:chatup/CustomWidgets/flat_add_story_btn.dart';
import 'package:chatup/CustomWidgets/flat_chat_item.dart';
import 'package:chatup/CustomWidgets/flat_counter.dart';
import 'package:chatup/CustomWidgets/flat_profile_image.dart';
import 'package:chatup/CustomWidgets/flat_section_header.dart';
import 'package:chatup/Statics/Statics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class ContactList extends StatefulWidget{

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final UsersController usersController = UsersController();

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: usersController.getUsers(),
      builder: (context, snapshot) {
        if(snapshot.data==null){
          return Container(
              child: Center(
                  child: SpinKitDoubleBounce(
                    color: Theme.of(context).primaryColorDark,
                    size: 50.0,
                  )
              )
          );
        }else{

          return Container(
            padding: EdgeInsets.only(
              top: 90.0,
            ),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return FlatChatItem(
                    onPressed: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => ChatPage())
                      );
                    },
                    profileImage: FlatProfileImage(
                      onlineIndicator: true,
                      imageUrl: baseUploadsURL+snapshot.data[index].avatar,
                    ),
                    name: snapshot.data[index].firstName+" "+snapshot.data[index].lastName,
                  );
                }
            ),
          );
        }
      },

    );
  }
}



