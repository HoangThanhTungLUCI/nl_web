import 'package:json_annotation/json_annotation.dart';

part 'posts_model_request.g.dart';

@JsonSerializable(explicitToJson: true)
class PostsModelRequest {
  final int startIndex;
  final String postLimit;

  PostsModelRequest({
    required this.startIndex,
    required this.postLimit,
  });

  factory PostsModelRequest.fromJson(Map<String, dynamic> json) =>
      _$PostsModelRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PostsModelRequestToJson(this);
}
