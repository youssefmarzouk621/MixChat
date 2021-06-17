class User {
  String id;
  String firstName;
  String lastName;
  String email;
  String password;
  String phone;
  String avatar;
  int verified;

  User(
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.phone,
      this.avatar,
      this.verified
      );

  User.fromJson(Map<String, dynamic> json) {
    this.id = json['_id'] as String;
    this.firstName = json['firstName'] as String;
    this.lastName = json['lastName'] as String;
    this.email = json['email'] as String;
    this.password = json['password'] as String;
    this.phone = json['phone'] as String;
    this.avatar = json['avatar'] as String;
    this.verified = json['verified'] as int;
  }


}