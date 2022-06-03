import 'package:flutter/material.dart';
import 'package:nl_web/core/style/style.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: AppDimens.mSpaceNormal,
        width: AppDimens.mSpaceNormal,
        child: CircularProgressIndicator(strokeWidth: 1.5),
      ),
    );
  }
}
