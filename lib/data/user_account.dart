import 'dart:convert';

class UsersAccount {
  String? name;
  String? userName;
  String? avatar;
  UsersAccount({
    this.name,
    this.userName,
    this.avatar,
  });

  //reciving data from server
  factory UsersAccount.fromMap(map) {
    return UsersAccount(
      name: map['name'] as String,
      userName: map['userName'] as String,
      avatar: map['avatar'] as String,
    );
  }

  //sending data from our server
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'userName': userName,
      'avatar': avatar,
    };
  }

  String toJson() => json.encode(toMap());

  factory UsersAccount.fromJson(String source) =>
      UsersAccount.fromMap(json.decode(source) as Map<String, dynamic>);
}
