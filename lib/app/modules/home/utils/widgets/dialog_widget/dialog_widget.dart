import 'package:flutter/material.dart';

Future<bool> dialogWidget(
    {@required BuildContext context,
    @required String title,
    @required String content,
    @required Widget firstOption,
    @required Widget secondOption}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
            content: Text(content),
            title: Text(title),
            actions: <Widget>[firstOption, secondOption],
          ));
}
