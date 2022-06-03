// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModelResponse _$PostModelResponseFromJson(Map<String, dynamic> json) =>
    PostModelResponse(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$PostModelResponseToJson(PostModelResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
