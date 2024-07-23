
import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));



class LoginModel {
  var status;
  var reason;
  var userId;
  var name;

  LoginModel({
     this.status,
     this.reason,
     this.userId,
     this.name,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    reason: json["reason"],
    userId: json["user_id"],
    name: json["name"],
  );

}
