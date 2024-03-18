import 'package:flutter/material.dart';

dynamic customShowDialog(
    {required BuildContext context,
    required String title,
    required String content,
    required void Function()? onPressed}) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: onPressed ?? () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
