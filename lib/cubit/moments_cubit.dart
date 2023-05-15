import "package:flutter/foundation.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:network/model/tweet_resp.dart";

import "../model/user_info_data.dart";
import "../repository/moments_repository.dart";
import "moments_state.dart";

class MomentsCubit extends Cubit<MomentsState> {
  late final MomentsRepository repository;
  @visibleForTesting
  late MomentsUiInfo momentUiInfo;

  MomentsCubit(this.repository) : super(MomentsStateInitial()) {
    momentUiInfo = MomentsUiInfo();
  }

  Future<void> fetchUserInfo() async {
    momentUiInfo.userInfo = await repository.fetchUserInfo();
    emit(MomentStateLoaded(momentUiInfo));
  }

  Future<void> fetchTweets() async {
    List<Tweet> tweets = await repository.fetchTweets();
    momentUiInfo.tweets = tweets;
    emit(MomentStateLoaded(momentUiInfo));
  }

  Future<void> fetchData() async {
    momentUiInfo.userInfo = await repository.fetchUserInfo();
    momentUiInfo.tweets = await repository.fetchTweets();
    emit(MomentStateLoaded(momentUiInfo));
  }
}
