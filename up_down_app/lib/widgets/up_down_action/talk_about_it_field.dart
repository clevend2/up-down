import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TalkAboutItField extends StatelessWidget {
  const TalkAboutItField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.onSubmitted,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: 'Talk about it',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}