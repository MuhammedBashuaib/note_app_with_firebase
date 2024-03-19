import 'package:flutter/material.dart';

dynamic customCircularProgressIndicator({required BuildContext context}) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => const AlertDialog(
      content: Center(child: CircularProgressIndicator()),
    ),
  );
}
