// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moments_user_info_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MomentUserInfoResp _$MomentUserInfoRespFromJson(Map<String, dynamic> json) =>
    MomentUserInfoResp(
      json['profile-image'] as String,
      json['avatar'] as String,
      json['nick'] as String,
      json['username'] as String,
    );

Map<String, dynamic> _$MomentUserInfoRespToJson(MomentUserInfoResp instance) =>
    <String, dynamic>{
      'profile-image': instance.profileBg,
      'avatar': instance.avatar,
      'nick': instance.nick,
      'username': instance.username,
    };
