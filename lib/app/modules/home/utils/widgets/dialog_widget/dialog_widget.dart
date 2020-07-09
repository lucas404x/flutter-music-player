import 'package:flutter/material.dart';

Future<bool> dialogWidget(
    {@required BuildContext context,
    @required String title,
    @required String content}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
            content: Text(content),
            title: Text(title),
            actions: <Widget>[
              FlatButton(
                  child: Text('No'),
                  onPressed: () => Navigator.pop(context, false)),
              FlatButton(
                  child: Text('Yes'),
                  onPressed: () => Navigator.pop(context, true))
            ],
          ));
}
