import 'package:flutter/material.dart';
import 'package:nl_web/core/generated/l10n.dart';
import 'package:nl_web/features/_sample_feature/presentation/bloc/post_bloc.dart';
import 'package:nl_web/features/_sample_feature/presentation/bloc/post_event.dart';
import 'package:nl_web/features/_sample_feature/presentation/bloc/post_state.dart';
import 'package:nl_web/features/_sample_feature/presentation/components/bottom_loader.dart';
import 'package:nl_web/features/_sample_feature/presentation/components/posts_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsList extends StatefulWidget {
  const PostsList({Key? key}) : super(key: key);

  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(PostFetched());
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        switch (state.status) {
          case PostStatus.failure:
            return Center(child: Text(S.of(context).connection_problem));
          case PostStatus.success:
            if (state.posts.isEmpty) {
              return Center(child: Text(S.of(context).data_empty));
            }
            return Center(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return index >= state.posts.length
                      ? const BottomLoader()
                      : PostListItem(post: state.posts[index]);
                },
                itemCount: state.hasReachedMax
                    ? state.posts.length
                    : state.posts.length + 1,
                controller: _scrollController,
              ),
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<PostBloc>().add(PostFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
