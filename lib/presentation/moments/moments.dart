import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:network/endpoints/moments_api.dart";
import "package:network/model/tweet_resp.dart";

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
    _momentsCubit.fetchData();
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
                    floating: false,
                    pinned: false,
                    flexibleSpace: header(state),
                  ),
                ];
              },
              body: Center(child: Content(state)),
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
                state.momentsUiInfo.userInfo.profileBg!,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              right: 100,
              bottom: 30,
              child: Text(
                state.momentsUiInfo.userInfo.username!,
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
                child: CachedNetworkImage(
                  imageUrl: state.momentsUiInfo.userInfo.avatar!,
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Container();
  }

  Widget Content(MomentsState state) {
    if (state is MomentStateLoaded && state.momentsUiInfo.tweets!.length > 0) {
      return Padding(
        padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
        child: ListView.builder(
          addAutomaticKeepAlives: false,
          key: ValueKey("moments_list"),
          itemBuilder: (BuildContext context, int index) {
            Tweet tweet = state.momentsUiInfo.tweets![index];
            return _listItem(tweet);
          },
          itemCount: state.momentsUiInfo.tweets!.length,
        ),
      );
    } else {
      return SizedBox.fromSize(
        size: Size(50, 50),
        child: CircularProgressIndicator(),
      );
    }
  }

  Widget _listItem(Tweet tweet) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 50.0,
              height: 50.0,
              child: CachedNetworkImage(
                imageUrl: tweet.sender?.avatar ?? "",
              ),
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tweet.sender?.nick ?? "",
                    style: TextStyle(color: Color(0xFF5798EC)),
                  ),
                  SizedBox(height: 10.0),
                  Text(tweet.content ?? ""),
                  SizedBox(height: 20.0),
                  TweetImages(tweet.images ?? []),
                  SizedBox(height: 10.0),
                  CommentsWidget(tweet.comments ?? []),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        Divider(height: 0.1, color: Color(0x8ED6D6D6)),
        SizedBox(height: 20.0),
      ],
    );
  }

  Widget CommentsWidget(List<Comments> comments) {
    if (comments.isNotEmpty) {
      return Container(
        padding: EdgeInsets.all(10.0),
        color: Color(0x8ED6D6D6),
        child: ListView.builder(
          addAutomaticKeepAlives: false,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${comments[index].sender?.username ?? ""}",
                    style: TextStyle(color: Color(0xFF5798EC)),
                  ),
                  TextSpan(
                    text: ": ${comments[index].content ?? ""}",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            );
          },
          itemCount: comments.length,
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  Widget TweetImages(List<Images> images) {
    if (images.length == 1) {
      return CachedNetworkImage(
        imageUrl: images[0].url ?? "",
        fit: BoxFit.scaleDown,
      );
    } else if (images.length >= 2 && images.length <= 9) {
      int crossAxisCount = images.length == 4 ? 2 : 3;
      return GridView.builder(
        addAutomaticKeepAlives: false,
        itemCount: images.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Image(
            image: CachedNetworkImageProvider(images[index].url ?? ""),
            fit: BoxFit.cover,
          );
        },
      );
    } else {
      // Handle other cases
      return Container();
    }
  }
}
