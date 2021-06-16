import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatup/CustomWidgets/title.dart';

class PasswordsPage extends StatefulWidget {
  final String firstname;
  final String lastname;
  final String username;
  final String email;

  PasswordsPage(this.firstname, this.lastname, this.username, this.email);
  @override
  _PasswordsPageState createState() => _PasswordsPageState();
}

class _PasswordsPageState extends State<PasswordsPage> {
  String password;
  String confirmPassword;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _passwordField(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true),
            // ignore: missing_return
            validator: (String value) {
              if (value.isEmpty) {
                return 'Password is Required';
              }
            },
            onSaved: (String value) {
              password = value;
            },
          )
        ],
      ),
    );
  }

  Widget _confirmPasswordField(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true),
            // ignore: missing_return
            validator: (String value) {
              if (value.isEmpty) {
                return 'Confirm your password';
              }

              if(value!=password){
                return 'Passwords does not match';
              }
            },
            onSaved: (String value) {
              confirmPassword = value;
            },
          )
        ],
      ),
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        if (!_formKey.currentState.validate()) {
          return;
        }
        _formKey.currentState.save();
        print("saved");
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xff435de6).withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Color(0xff435de6)),
        child: Text(
          'Continue',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            height: height,
            child: Stack(children: <Widget>[
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                        SizedBox(height: height * .1),
                        appTitle(),
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                _passwordField("Password"),
                                _confirmPasswordField("Confirm password"),
                                SizedBox(
                                  height: 20,
                                ),
                                _submitButton(),
                              ],
                            )),
                      ]))),
              Positioned(top: 40, left: 0, child: _backButton()),
            ])));
  }
}
