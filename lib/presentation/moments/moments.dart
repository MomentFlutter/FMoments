import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:network/endpoints/moments_api.dart";

import "../../cubit/moments_cubit.dart";
import "../../cubit/moments_state.dart";
import "../../network/client.dart";
import "../../repository/moments_repository.dart";

class Moments extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MomentsState();
}

class _MomentsState extends State<Moments> {
  late final MomentsCubit _momentsCubit;

  @override
  void initState() {
    super.initState();
    MomentsRepository repository =
        MomentsRepository(MomentsApi(DioClient().dio));
    _momentsCubit = MomentsCubit(repository);
    _momentsCubit.fetchUserInfo();
    _momentsCubit.fetchMomentsData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MomentsCubit>(
      create: (context) => _momentsCubit,
      child: BlocBuilder<MomentsCubit, MomentsState>(
        builder: (context, state) {
          return Scaffold(
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    expandedHeight: 200.0,
                    floating: true,
                    pinned: false,
                    flexibleSpace: header(state),
                  ),
                ];
              },
              body: Center(child: content(state)),
            ),
          );
        },
      ),
    );
  }

  Widget header(MomentsState state) {
    if (state is MomentStateLoaded) {
      return FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Image.network(
                state.userInfo.profileBg!,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              right: 100,
              bottom: 30,
              child: Text(
                state.userInfo.username!,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 0,
              child: SizedBox(
                width: 80.0,
                height: 80.0,
                child: Image.network(state.userInfo.avatar!),
              ),
            ),
          ],
        ),
      );
    }
    return Container();
  }

  Widget content(MomentsState state) {
    if (state is MomentsStateLoading) {
      return SizedBox.fromSize(
        size: Size(50, 50),
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        key: ValueKey("moments_list"),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("Item $index"),
          );
        },
        itemCount: 50,
      );
    }
  }
}
