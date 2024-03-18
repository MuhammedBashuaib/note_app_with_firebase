import 'package:flutter/material.dart';

dynamic customShowDialog({
  required BuildContext context,
  required String title,
  required String content,
  required void Function()? onPressed,
  bool showCancelButton = false,
}) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        showCancelButton
            ? TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              )
            // ignore: dead_code
            : Container(),
        TextButton(
          onPressed: onPressed ?? () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
