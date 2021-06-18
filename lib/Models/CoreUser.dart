
import 'package:chatup/Models/User.dart';

class CoreUser {

  String id;
  String firstName;
  String lastName;
  String email;
  String password;
  String phone;
  String avatar;

  String token;
  String pincode;
  String touchId;

  CoreUser(
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.phone,
      this.avatar,

      this.token,
      this.pincode,
      this.touchId
  );

  CoreUser.fromJson(Map<String, dynamic> json) {
    this.id = json['id'] as String;

    this.firstName = json['firstName'] as String;
    this.lastName = json['lastName'] as String;
    this.email = json['email'] as String;
    this.password = json['password'] as String;
    this.phone = json['phone'] as String;
    this.avatar = json['avatar'] as String;

    this.token = json['token'] as String;
    this.pincode = json['pincode'] as String;
    this.touchId = json['touchId'] as String;
  }

  CoreUser.fromUser(User user,String token,String pincode,String touchId) {
    this.id = user.id;

    this.firstName = user.firstName;
    this.lastName = user.lastName;
    this.email = user.email;
    this.password = user.password;
    this.phone = user.password;
    this.avatar = user.avatar;

    this.token = token;
    this.pincode = pincode;
    this.touchId = touchId;
  }


}
