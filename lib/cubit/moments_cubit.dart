import "package:flutter_bloc/flutter_bloc.dart";

import "../model/user_info_data.dart";
import "../repository/moments_repository.dart";
import "moments_state.dart";

class MomentsCubit extends Cubit<MomentsState> {
  late final MomentsRepository repository;

  MomentsCubit(this.repository) : super(MomentsStateInitial());

  Future<void> fetchUserInfo() async {
    UserInfo userInfo = await repository.fetchUserInfo();
    emit(MomentStateLoaded(userInfo));
  }

  void fetchMomentsData() {}
}
