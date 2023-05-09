import "package:flutter_bloc/flutter_bloc.dart";
import "package:network/endpoints/moments_api.dart";

import "../model/user_info_data.dart";
import "../network/client.dart";
import "../repository/moments_repository.dart";
import "moments_state.dart";

class MomentsCubit extends Cubit<MomentsState> {
  MomentsCubit() : super(MomentsStateInitial());

  final MomentsRepository repository =
      MomentsRepository(MomentsApi(DioClient().dio));

  void fetchUserInfo() async {
    UserInfo userInfo = await repository.fetchUserInfo();
    emit(MomentStateLoaded(userInfo));
  }

  void fetchMomentsData() {}
}
