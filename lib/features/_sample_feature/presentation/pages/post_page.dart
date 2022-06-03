import 'package:flutter/material.dart';
import 'package:nl_web/core/generated/l10n.dart';
import 'package:nl_web/core/style/style.dart';
import 'package:nl_web/features/_sample_feature/presentation/components/posts_list.dart';
import 'package:nl_web/test_ui_page.dart';
import 'package:nl_web/ui_change_password_page.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UiForgotPass(),
    );
  }
}
