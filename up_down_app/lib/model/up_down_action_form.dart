import 'package:flutter/material.dart';
import 'package:up_down_app/data/up_down_action.dart';
import 'package:up_down_app/model/action_levels.dart';
import 'package:up_down_app/model/action_types.dart';

class UpDownActionFormModel extends ChangeNotifier {
  static const historyLimit = 10;

  late final List<UpDownAction> _actionHistory;

  UpDownActionFormModel({GlobalKey<FormState>? formKey, required UpDownAction initialAction}) : _actionHistory = [initialAction];

  UpDownAction get action => _actionHistory.last;

  /// private method to add a new action to the history while ensuring the list doesn't exceed the historyLimit
  void _addAction(UpDownAction action) {
    _actionHistory.add(action);

    if (_actionHistory.length > historyLimit) {
      _actionHistory.removeAt(0);
    }
  }

  void updateAction(UpDownAction action) {
    _addAction(action.copyWith(
      type: action.type,
      level: action.level,
      whatHappened: action.whatHappened,
      talkAboutIt: action.talkAboutIt,
      timestamp: action.timestamp,
      device: action.device,
      tokenizedWhatHappened: action.tokenizedWhatHappened,
    ));

    notifyListeners();
  }

  void updateType(ActionType type) {
    _addAction(action.copyWith(type: type));

    notifyListeners();
  }


  void updateLevel(ActionLevel level) {
    _addAction(action.copyWith(level: level));

    notifyListeners();
  }

  void updateWhatHappened(String whatHappened) {
    _addAction(action.copyWith(whatHappened: whatHappened));

    notifyListeners();
  }

  
  void updateTalkAboutIt(String talkAboutIt) {
    _addAction(action.copyWith(talkAboutIt: talkAboutIt));

    notifyListeners();
  }
}
