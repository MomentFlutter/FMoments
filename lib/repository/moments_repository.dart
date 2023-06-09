import "package:network/endpoints/moments_api.dart";
import "package:network/model/moments_user_info_resp.dart";
import "package:network/model/tweet_resp.dart";

import "../model/user_info_data.dart";

class MomentsRepository {
  late MomentsApi _momentsApi;

  MomentsRepository(this._momentsApi);

  Future<UserInfo> fetchUserInfo() async {
    MomentUserInfoResp resp = await _momentsApi.fetchUserInfo();
    return UserInfo(resp.profileBg, resp.avatar, resp.username, resp.nick);
  }

  Future<List<Tweet>> fetchTweets() async {
    List<Tweet> tweets = await _momentsApi.fetchTweets();
    return tweets.where((tweet) => tweet.isValid()).toList();
  }
}
