// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tweet _$TweetFromJson(Map<String, dynamic> json) => Tweet(
      content: json['content'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
      sender: json['sender'] == null
          ? null
          : Sender.fromJson(json['sender'] as Map<String, dynamic>),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => Comments.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TweetToJson(Tweet instance) => <String, dynamic>{
      'content': instance.content,
      'images': instance.images,
      'sender': instance.sender,
      'comments': instance.comments,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'url': instance.url,
    };

Sender _$SenderFromJson(Map<String, dynamic> json) => Sender(
      username: json['username'] as String?,
      nick: json['nick'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$SenderToJson(Sender instance) => <String, dynamic>{
      'username': instance.username,
      'nick': instance.nick,
      'avatar': instance.avatar,
    };

Comments _$CommentsFromJson(Map<String, dynamic> json) => Comments(
      content: json['content'] as String?,
      sender: json['sender'] == null
          ? null
          : Sender.fromJson(json['sender'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentsToJson(Comments instance) => <String, dynamic>{
      'content': instance.content,
      'sender': instance.sender,
    };
