import 'package:flutter/material.dart';

extension TextControllerExtension on TextEditingController {
  ///Get the text from the text field
  String getText() {
    return text.trim();
  }
}
