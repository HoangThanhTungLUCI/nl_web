import 'package:nl_web/features/_sample_feature/domain/entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts(int startIndex, int postLimit);
}
