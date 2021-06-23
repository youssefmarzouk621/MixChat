import 'dart:convert';

import 'package:chatup/Models/CoreUser.dart';
import 'package:chatup/Models/User.dart';
import 'package:chatup/Statics/Statics.dart';
import 'package:chatup/Storage/UsersRepository.dart';
import 'package:http/http.dart';

class UsersController {
  Future<int> Login(String username,String password) async{
    final response = await post(
      Uri.http(baseURL,"api/users/login/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": username,
        "password": password,
      }),
    );
    if(response.statusCode==200) {
      var jsonData = json.decode(response.body);
      User connectedUser = User.fromJson(jsonData);
      CoreUser storedUser = CoreUser.fromUser(connectedUser, jsonData['token'], "none", "none");
      UsersRepository.addUser(storedUser);
    }
      return response.statusCode;
  }

  Future<List<User>> getUsers() async{

    final response = await get(
        Uri.http(baseURL,"api/users/")
    );
    if(response.statusCode==200){
      var body = json.decode(response.body);
      List<User> users = [];

      for(var obj in body){
        User user = User.fromJson(obj);
        users.add(user);
      }

      return users;
    }else{
      throw Exception('Request API Failed');
    }
  }
}