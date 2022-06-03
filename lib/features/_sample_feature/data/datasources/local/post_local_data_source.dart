import 'dart:convert';

import 'package:nl_web/core/services/local/local_storage_service.dart';
import 'package:nl_web/core/utility/logging.dart';
import 'package:nl_web/features/_sample_feature/data/models/response/post_model_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cachedPost = 'POST';

abstract class PostLocalDataSource {
  Future<List<PostModelResponse>> getPosts(int startIndex, int limitPost);

  Future<void> cachedPosts(List<PostModelResponse> posts);
}

class PostLocalDataSourceImpl implements PostLocalDataSource {
  PostLocalDataSourceImpl();

  @override
  Future<List<PostModelResponse>> getPosts(
      int startIndex, int limitPost) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonString = prefs.getString(cachedPost);

      jsonString ??= await LocalStorageService().getJson('data/dummy'
          '.json');

      final rawMap = json.decode(jsonString) as List;

      List<PostModelResponse> listPostModelResponse =
          rawMap.map((dynamic json) {
        return PostModelResponse.fromJson(json as Map<String, dynamic>);
      }).toList();

      return listPostModelResponse;
    } catch (e) {
      Log.info("Post Local file", e.toString());
      rethrow;
    }
  }

  @override
  Future<void> cachedPosts(List<PostModelResponse> posts) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
        cachedPost, jsonEncode(posts.map((e) => e.toJson()).toList()));
  }
}
