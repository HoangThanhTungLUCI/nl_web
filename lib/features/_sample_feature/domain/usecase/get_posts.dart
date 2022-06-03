import 'package:equatable/equatable.dart';
import 'package:nl_web/core/base/domain/usecases/usecase.dart';
import 'package:nl_web/features/_sample_feature/domain/entities/post.dart';
import 'package:nl_web/features/_sample_feature/domain/repositories/post_repository.dart';

class GetPosts implements UseCase<List<Post>, GetPostParams> {
  final PostRepository postRepository;

  GetPosts(this.postRepository);

  @override
  Future<List<Post>> call(GetPostParams params) {
    return postRepository.getPosts(params.startIndex, params.postLimit);
  }
}

class GetPostParams extends Equatable {
  final int startIndex;
  final int postLimit;

  const GetPostParams({required this.startIndex, required this.postLimit});

  @override
  List<Object> get props => [startIndex, postLimit];
}
