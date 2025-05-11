import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  ButtonStyle get actionButtonStyle => ButtonStyle(
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    backgroundColor: WidgetStateProperty.all(Colors.black87),
    foregroundColor: WidgetStateProperty.all(Colors.black87),
  );
  ButtonStyle get actionBorderButtonStyle => ButtonStyle(
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey),
      ),
    ),

    foregroundColor: WidgetStateProperty.all(Colors.black87),
  );
}
