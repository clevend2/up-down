import 'package:flutter/material.dart';
import 'package:up_down_app/data/up_down_action.dart';

/// a text area that expands to fill the entire device screen, with a save button in the bottom corner
class TalkAboutItField extends StatelessWidget {
  const TalkAboutItField({
    Key? key,
    required this.action,
    required this.formKey,
    required this.controller,
  }) : super(key: key);

  final GlobalKey<FormState> formKey; 
  final TextEditingController controller;
  final UpDownAction action;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Really talk about it'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: controller,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Really talk about it',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    action.talkAboutIt = value;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                },
                child: Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}