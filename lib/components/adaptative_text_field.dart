import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final String label;

  final TextEditingController controller;

  final TextInputType keyboardType;

  final Function(String) onSubmitted;

  AdaptativeTextField({
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
              controller: controller,
              onSubmitted: onSubmitted,
              keyboardType: keyboardType,
              placeholder: label,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            controller: controller,
            onSubmitted: onSubmitted,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              labelText: label,
            ),
          );
  }
}
