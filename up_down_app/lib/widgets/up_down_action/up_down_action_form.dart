import 'package:flutter/material.dart';
import 'package:up_down_app/model/action_levels.dart';
import 'package:up_down_app/model/action_types.dart';
import 'package:up_down_app/data/up_down_action.dart';
import 'package:up_down_app/widgets/up_down_action/talk_about_it_field.dart';
import 'package:up_down_app/widgets/up_down_action/up_down_selector.dart';
import 'package:up_down_app/widgets/up_down_action/level_selector.dart';
import 'package:up_down_app/widgets/up_down_action/what_happened_field.dart';
import 'package:up_down_app/model/up_down_action_form.dart';

class UpDownActionForm extends StatelessWidget {
  final UpDownActionFormModel model;

  UpDownActionForm({required this.model});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _whatHappenedController = TextEditingController();

  final TextEditingController _talkAboutItController = TextEditingController();

  void handleOnPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
    } else {
      throw FlutterError('Form state is not defined.');
    }
  }

  void handleTypeChanged(int index) {
    model.updateType(ActionType.values[index]);
  }

  void handleLevelChanged(int index) {
    model.updateLevel(ActionLevel.values[index]);
  }

  void handleWhatHappenedChange() {
    /// TODO: update list of recommended previous actions
    model.updateWhatHappened(_whatHappenedController.text);
  }

  void handleTalkAboutItChange() {
    model.updateTalkAboutIt(_talkAboutItController.text);
  }

  @override
  Widget build(BuildContext context) {
    _whatHappenedController.addListener(handleWhatHappenedChange);

    _talkAboutItController.addListener(handleTalkAboutItChange);

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          UpDownSelector(
            value: model.action.type.index,
            onValueChanged: (int index) => handleTypeChanged(index),
          ),
          LevelSelector(
            level: model.action.level.index,
            onLevelChanged: (int index) => handleLevelChanged(index),
          ),
          WhatHappenedField(formKey: _formKey, controller: _whatHappenedController),
          TalkAboutItField(formKey: _formKey, controller: _talkAboutItController),
          ElevatedButton(
            onPressed: () {
              handleOnPressed();
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}