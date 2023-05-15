import "package:network/model/tweet_resp.dart";

class MomentsUiInfo {
  late UserInfo userInfo;
  late List<Tweet>? tweets;
}

class UserInfo {
  String? profileBg;
  String? avatar;
  String? nick;
  String? username;

  UserInfo(this.profileBg, this.avatar, this.nick, this.username);
}
