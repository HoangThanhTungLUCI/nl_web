import 'package:nl_web/core/base/data/model/base_model.dart';
import 'package:nl_web/features/_sample_feature/domain/entities/post.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PostModelResponse extends BaseModel<Post> {
  PostModelResponse({required this.id, required this.title, required this.body});

  final int id;
  final String title;
  final String body;

  @override
  Post toDomain() {
    return Post(
      title: title,
      body: body,
      id: id,
    );
  }

  factory PostModelResponse.fromJson(Map<String, dynamic> json) =>
      _$PostModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelResponseToJson(this);
}
