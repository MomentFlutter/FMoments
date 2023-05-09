import "package:json_annotation/json_annotation.dart";

part "moments_user_info_resp.g.dart";

@JsonSerializable()
class MomentUserInfoResp {
  @JsonKey(name: "profile-image")
  late String profileBg;
  late String avatar;
  late String nick;
  late String username;

  MomentUserInfoResp(this.profileBg, this.avatar, this.nick, this.username);

  factory MomentUserInfoResp.fromJson(Map<String, dynamic> json) =>
      _$MomentUserInfoRespFromJson(json);

  Map<String, dynamic> toJson() => _$MomentUserInfoRespToJson(this);
}
