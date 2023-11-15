import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WhatHappenedField extends StatelessWidget {
  const WhatHappenedField({
    super.key,
    required this.formKey,
    required this.controller,
  });

  final GlobalKey<FormState> formKey; 
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Talk about it',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}