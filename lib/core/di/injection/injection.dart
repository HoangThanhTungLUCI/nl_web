import 'package:nl_web/core/di/module/api_module.dart';
import 'package:nl_web/core/di/module/bloc_module.dart';
import 'package:nl_web/core/di/module/components_module.dart';
import 'package:nl_web/core/di/module/repo_module.dart';
import 'package:nl_web/features/_sample_feature/di/post_module.dart';

class Injection {
  static Future inject() async {
    await ComponentsModule().provides();
    await ApiModule().provides();
    await BlocModule().provides();
    await RepoModule().provides();

    await PostModule().provides();
  }
}
