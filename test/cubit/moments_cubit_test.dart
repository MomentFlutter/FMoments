import "package:FMoments/cubit/moments_cubit.dart";
import "package:FMoments/cubit/moments_state.dart";
import "package:FMoments/model/user_info_data.dart";
import "package:FMoments/repository/moments_repository.dart";
import "package:bloc_test/bloc_test.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import "package:network/model/tweet_resp.dart";

import "moments_cubit_test.mocks.dart";

@GenerateMocks([MomentsRepository])
void main() {
  MomentsRepository momentsRepository = MockMomentsRepository();
  MomentsCubit momentsCubit = MomentsCubit(momentsRepository);
  momentsCubit.momentUiInfo = MomentsUiInfo();
  UserInfo userInfoStub = UserInfo("", "", "", "tester");
  List<Tweet> tweetsStub = [
    Tweet(content: "", images: [], sender: Sender(), comments: []),
  ];

  blocTest<MomentsCubit, MomentsState>(
    "given fetch user info, when fetch success, then get loaded type state",
    build: () => momentsCubit,
    act: (MomentsCubit momentsCubit) async {
      when(momentsRepository.fetchUserInfo())
          .thenAnswer((_) => Future.value(userInfoStub));
      when(momentsRepository.fetchTweets())
          .thenAnswer((_) => Future.value(tweetsStub));
      await momentsCubit.fetchData();
      momentsCubit.momentUiInfo.userInfo = userInfoStub;
      momentsCubit.momentUiInfo.tweets = tweetsStub;
    },
    verify: (momentsCubit) {
      expect(momentsCubit.momentUiInfo.userInfo.username, "tester");
      expect(momentsCubit.momentUiInfo.tweets!.length, 1);
    },
  );
}
