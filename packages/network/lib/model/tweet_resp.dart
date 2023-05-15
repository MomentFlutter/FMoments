import "package:json_annotation/json_annotation.dart";

part "tweet_resp.g.dart";

@JsonSerializable()
class Tweet {
  String? content;
  List<Images>? images;
  Sender? sender;
  List<Comments>? comments;

  Tweet({this.content, this.images, this.sender, this.comments});

  factory Tweet.fromJson(Map<String, dynamic> json) => _$TweetFromJson(json);

  Map<String, dynamic> toJson() => _$TweetToJson(this);

  bool isValid() {
    return (content != null && content!.isNotEmpty) ||
        images != null ||
        sender != null ||
        comments != null;
  }
}

@JsonSerializable()
class Images {
  String? url;

  Images({this.url});

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

@JsonSerializable()
class Sender {
  String? username;
  String? nick;
  String? avatar;

  Sender({this.username, this.nick, this.avatar});

  factory Sender.fromJson(Map<String, dynamic> json) => _$SenderFromJson(json);

  Map<String, dynamic> toJson() => _$SenderToJson(this);
}

@JsonSerializable()
class Comments {
  String? content;
  Sender? sender;

  Comments({this.content, this.sender});

  factory Comments.fromJson(Map<String, dynamic> json) =>
      _$CommentsFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsToJson(this);
}
