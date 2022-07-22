import 'package:flutter/material.dart';

void customBottomSheet({
  required BuildContext context,
  required Widget child,
}) {
  showModalBottomSheet<void>(
    isDismissible: true,
    enableDrag: false,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: SingleChildScrollView(child: child),
      );
    },
  );
}
