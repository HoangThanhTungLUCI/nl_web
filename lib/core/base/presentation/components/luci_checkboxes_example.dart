import 'package:flutter/material.dart';
import 'package:nl_web/core/base/presentation/components/luci_checkbox_item.dart';
import 'package:nl_web/core/utility/logging.dart';

class LuciCheckboxesExample extends StatefulWidget {
  final List listData;

  const LuciCheckboxesExample({Key? key, required this.listData})
      : super(key: key);

  @override
  LuciCheckboxesExampleState createState() => LuciCheckboxesExampleState();
}

class LuciCheckboxesExampleState extends State<LuciCheckboxesExample> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.listData.length,
        itemBuilder: (context, index) {
          return LuciCheckboxItem(
            data: widget.listData[index],
            onChanged: (bool? value) {
              Log.info('Checkbox', '${widget.listData[index]}- $value');
            },
          );
        },
      ),
    );
  }
}
