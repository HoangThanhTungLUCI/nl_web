import 'package:dio/dio.dart';
import 'package:nl_web/core/network/network_info.dart';
import 'package:nl_web/core/utility/logging.dart';
import 'package:nl_web/features/_sample_feature/data/datasources/local/post_local_data_source.dart';
import 'package:nl_web/features/_sample_feature/data/datasources/remote/post_remote_data_source.dart';
import 'package:nl_web/features/_sample_feature/domain/entities/post.dart';
import 'package:nl_web/features/_sample_feature/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostLocalDataSource postLocalDataSource;
  final PostRemoteDataSource postRemoteDatasource;
  final NetworkInfo networkInfo;

  PostRepositoryImpl({
    required this.networkInfo,
    required this.postLocalDataSource,
    required this.postRemoteDatasource,
  });

  @override
  Future<List<Post>> getPosts(int startIndex, int postLimit) async {
    final isConnected = await NetworkInfoImpl.instance.isConnected;
    if (isConnected) {
      try {
        final localPostsModel =
            await postRemoteDatasource.getPosts(startIndex, postLimit);

        List<Post> listPosts = [];
        for (var element in localPostsModel) {
          listPosts.add(element.toDomain());
        }

        return listPosts;
      } on DioError {
        rethrow;
      }
    } else {
      try {
        final localPostsModel =
            await postLocalDataSource.getPosts(startIndex, postLimit);
        List<Post> listPost = [];
        for (var element in localPostsModel) {
          Post post = (element).toDomain();
          (listPost).add(post);
        }
        return listPost;
      } catch (e) {
        Log.warning("$runtimeType convertModel", e.toString());
        rethrow;
      }
    }
  }
}
