// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_model_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostsModelRequest _$PostsModelRequestFromJson(Map<String, dynamic> json) =>
    PostsModelRequest(
      startIndex: json['startIndex'] as int,
      postLimit: json['postLimit'] as String,
    );

Map<String, dynamic> _$PostsModelRequestToJson(PostsModelRequest instance) =>
    <String, dynamic>{
      'startIndex': instance.startIndex,
      'postLimit': instance.postLimit,
    };
