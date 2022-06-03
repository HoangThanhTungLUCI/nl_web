import 'package:flutter/material.dart';
import 'package:nl_web/core/style/style.dart';
import 'package:nl_web/features/_sample_feature/domain/entities/post.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(AppDimens.mSpaceXSmall4),
      color: AppColor.mCPrimary50,
      elevation: 2.0,
      child: ListTile(
        leading: Text('${post.id}'),
        title: Text(post.title),
        isThreeLine: true,
        subtitle: Text(post.body),
        dense: true,
      ),
    );
  }
}
