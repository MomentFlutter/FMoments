import "package:equatable/equatable.dart";

import "../model/user_info_data.dart";

abstract class MomentsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MomentsStateInitial extends MomentsState {}

class MomentsStateLoading extends MomentsState {}

class MomentStateLoaded extends MomentsState {
  late final UserInfo userInfo;

  MomentStateLoaded(this.userInfo);
}
