import "package:json_annotation/json_annotation.dart";

part "login_resp.g.dart";

@JsonSerializable()
class LoginResp {
  @JsonKey(name: "token")
  late String authToken;

  LoginResp(this.authToken);

  factory LoginResp.fromJson(Map<String, dynamic> json) =>
      _$LoginRespFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRespToJson(this);
}
