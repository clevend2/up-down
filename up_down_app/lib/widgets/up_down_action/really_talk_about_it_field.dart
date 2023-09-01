import 'package:flutter/material.dart';
import 'package:up_down_app/model/up_down_action.dart';

/// a text area that expands to fill the entire device screen, with a save button in the bottom corner
class ReallyTalkAboutItField extends StatefulWidget {
  const ReallyTalkAboutItField({
    Key? key,
    required this.action,
  }) : super(key: key);

  final UpDownAction action;

  @override
  _ReallyTalkAboutItFieldState createState() => _ReallyTalkAboutItFieldState();
}

class _ReallyTalkAboutItFieldState extends State<ReallyTalkAboutItField> {
  final _formKey = GlobalKey<FormState>();

  final reallyTalkAboutItController = TextEditingController();

  @override
  void initState() {
    super.initState();
    reallyTalkAboutItController.text = widget.action.reallyTalkAboutIt ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Really talk about it'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: reallyTalkAboutItController,
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
                  onChanged: (value) {
                    widget.action.reallyTalkAboutIt = value;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
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