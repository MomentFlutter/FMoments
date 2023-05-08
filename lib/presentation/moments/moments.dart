import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "../../cubit/moments_cubit.dart";
import "../../cubit/moments_state.dart";

class Moments extends StatefulWidget {
  const Moments({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MomentsState();
}

class _MomentsState extends State<Moments> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MomentsCubit>(
      create: (context) => MomentsCubit(),
      child: BlocBuilder<MomentsCubit, MomentsState>(
        builder: (context, state) {
          return Scaffold(
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    collapsedHeight: 56.0,
                    expandedHeight: 100.0,
                    floating: true,
                    pinned: true,
                    flexibleSpace: Text(""),
                  ),
                ];
              },
              body: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("Item $index"),
                  );
                },
                itemCount: 0,
              ),
            ),
          );
        },
      ),
    );
  }
}
