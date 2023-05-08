import "package:flutter_bloc/flutter_bloc.dart";

import "moments_state.dart";

class MomentsCubit extends Cubit<MomentsState> {
  MomentsCubit() : super(MomentsStateInitial());
}
