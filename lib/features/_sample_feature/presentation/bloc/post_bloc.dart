import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:nl_web/core/base/presentation/bloc/base_bloc.dart';
import 'package:nl_web/core/common/exceptions/api_exception.dart';
import 'package:nl_web/features/_sample_feature/presentation/bloc/post_event.dart';
import 'package:bloc/bloc.dart';
import 'package:nl_web/features/_sample_feature/domain/entities/post.dart';
import 'package:nl_web/features/_sample_feature/domain/usecase/get_posts.dart';
import 'package:nl_web/features/_sample_feature/presentation/bloc/post_state.dart';
import 'package:stream_transform/stream_transform.dart';

const _postLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PostBloc extends BaseBloc<PostEvent, PostState> {
  final GetPosts getPosts;

  PostBloc({required this.getPosts}) : super(const PostState()) {
    on<PostFetched>(
      _onPostFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onPostFetched(
    PostFetched event,
    Emitter<PostState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == PostStatus.initial) {
        final posts = await _fetchPosts();
        return emit(state.copyWith(
          status: PostStatus.success,
          posts: posts,
          hasReachedMax: false,
        ));
      }
      final posts = await _fetchPosts(state.posts.length);
      posts.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: PostStatus.success,
                posts: List.of(state.posts)..addAll(posts),
                hasReachedMax: false,
              ),
            );
    } catch (e) {
      emit(state.copyWith(status: PostStatus.failure));

      if (e is DioError) {
        onAppErrorSink.add(ApiException(e));
      } else {
        onAppErrorSink.add(e);
      }
    }
  }

  Future<List<Post>> _fetchPosts([int startIndex = 0]) async {
    try {
      GetPostParams getPostParams =
          GetPostParams(startIndex: startIndex, postLimit: _postLimit);

      List<Post>? listPost = await getPosts(getPostParams);

      return listPost;
    } catch (e) {
      rethrow;
    }
  }
}
