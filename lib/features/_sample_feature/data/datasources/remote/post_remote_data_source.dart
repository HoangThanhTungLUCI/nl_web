import 'package:dio/dio.dart';
import 'package:nl_web/features/_sample_feature/data/models/response/post_model_response.dart';
import 'package:retrofit/retrofit.dart';

part 'post_remote_data_source.g.dart';

@RestApi()
abstract class PostRemoteDataSource {
  factory PostRemoteDataSource(Dio dio, {String baseUrl}) =
      _PostRemoteDataSource;

  @GET('/posts')
  Future<List<PostModelResponse>> getPosts(
    @Query("_start") int startIndex,
    @Query("_limit") int postLimit,
  );
}
