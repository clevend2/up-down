import 'package:flutter/material.dart';
import 'package:up_down_app/widgets/up_down_action/up_down_action_form.dart';

class ActionFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Action Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: UpDownActionForm(),
      ),
    );
  }
}