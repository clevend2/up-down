import 'package:flutter/material.dart';
import 'package:up_down_app/model/action_levels.dart';
import 'package:up_down_app/model/action_types.dart';
import 'package:up_down_app/data/up_down_action.dart';
import 'package:up_down_app/widgets/up_down_action/talk_about_it_field.dart';
import 'package:up_down_app/widgets/up_down_action/up_down_selector.dart';
import 'package:up_down_app/widgets/up_down_action/level_selector.dart';
import 'package:up_down_app/widgets/up_down_action/what_happened_field.dart';

class UpDownActionForm extends StatefulWidget {
  final UpDownAction initialAction; // Declare the initialAction variable

  UpDownActionForm({required this.initialAction}); // Add a constructor to initialize initialAction

  @override
  UpDownActionFormState createState() => UpDownActionFormState();
}

class UpDownActionFormState extends State<UpDownActionForm> {
  final _formKey = GlobalKey<FormState>();
  late UpDownAction action;

  TextEditingController whatHappenedController = TextEditingController();

  TextEditingController talkAboutItController = TextEditingController();

  @override
  void didUpdateWidget(covariant UpDownActionForm oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();

    action = widget.initialAction.copyWith(); // Initialize action
  }

  void handleLevelChange(ActionLevel newLevel) {
    setState(() {
      action.level = newLevel;
    });
  }

  void handleUpDownChange(ActionType newValue) {
    setState(() {
      type = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          UpDownSelector(
            value: type.index,
            onValueChanged: (int index) {
              handleUpDownChange(ActionType.values[index]);
            },
          ),
          LevelSelector(
            level: level.index,
            onLevelChanged: (int index) {
              handleLevelChange(ActionLevel.values[index]);
            },
          ),
          WhatHappenedField(formKey: _formKey, controller: whatHappenedController),
          TalkAboutItField(formKey: _formKey, controller: talkAboutItController),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                // If the form is valid, you might want to save the data
                _formKey.currentState?.save();
              } else {
                throw FlutterError('Form state is not defined.');
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}