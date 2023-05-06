import "package:json_annotation/json_annotation.dart";

part "login_req.g.dart";

@JsonSerializable()
class LoginReq {
  @JsonKey(name: "username")
  late String? username;

  @JsonKey(name: "password")
  late String? password;

  LoginReq({required this.username, required this.password});

  factory LoginReq.fromJson(Map<String, dynamic> json) =>
      _$LoginReqFromJson(json);
  Map<String, dynamic> toJson() => _$LoginReqToJson(this);
}
