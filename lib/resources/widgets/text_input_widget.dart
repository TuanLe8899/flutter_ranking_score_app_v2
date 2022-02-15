import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final controller;
  const TextInputWidget(
      {Key? key,
      required this.labelText,
      required this.hintText,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
          hintText: hintText,
        ),
        controller: controller,
      ),
    );
  }
}
