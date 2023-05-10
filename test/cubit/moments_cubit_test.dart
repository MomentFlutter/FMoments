import "package:FMoments/cubit/moments_cubit.dart";
import "package:FMoments/cubit/moments_state.dart";
import "package:FMoments/model/user_info_data.dart";
import "package:FMoments/repository/moments_repository.dart";
import "package:bloc_test/bloc_test.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";

import "moments_cubit_test.mocks.dart";

@GenerateMocks([MomentsRepository])
void main() {
  MomentsRepository momentsRepository = MockMomentsRepository();
  UserInfo userInfoStub = UserInfo("", "", "", "");

  blocTest<MomentsCubit, MomentsState>(
    "given fetch user info, when fetch success, then get loaded type state",
    build: () => MomentsCubit(momentsRepository),
    act: (MomentsCubit momentsCubit) async {
      when(momentsRepository.fetchUserInfo())
          .thenAnswer((_) => Future.value(userInfoStub));
      await momentsCubit.fetchUserInfo();
    },
    expect: () => [MomentStateLoaded(userInfoStub)],
  );
}
