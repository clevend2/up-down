import 'package:flutter/material.dart';
import 'package:up_down_app/data/up_down_action.dart';
import 'package:up_down_app/utilities/database.dart';

class UpDownActionListModel with ChangeNotifier {
  List<UpDownAction> _actions = [];

  List<UpDownAction> get actions => _actions;

  Future<void> addAction(UpDownAction action) async {
    _actions.add(action);

    notifyListeners(); // Notify all listeners

    try {
      await DatabaseManager().database.insertAction(action as ActionsCompanion);
    } catch (e) {
      print(e);

      _actions.forEach((element) {
        if (element.id == action.id) {
          _actions.remove(element);
        }
      });
    }
  }

  Future<void> deleteAction(UpDownAction action) async {
    _actions.remove(action);

    notifyListeners(); // Notify all listeners

    try {
      await DatabaseManager().database.deleteAction(action.id!);
    } catch (e) {
      print(e);

      _actions.add(action);
    }
  }

  Future<void> updateAction(UpDownAction action) async {
    notifyListeners(); // Notify all listeners

    try {
      await DatabaseManager().database.updateAction(action as ActionsCompanion);
    } catch (e) {
      print(e);
    }
  }

  Future<void> loadActions() async {
    _actions = await DatabaseManager().database.watchAllActions().first;

    notifyListeners(); // Notify all listeners
  }

  Future<void> loadAction(int id) async {
    _actions = [await DatabaseManager().database.watchAction(id).first];

    notifyListeners(); // Notify all listeners
  }

  Stream<List<UpDownAction>> watchAllActions() {
    return DatabaseManager().database.watchAllActions();
  }

  Stream<UpDownAction> watchAction(int id) {
    return DatabaseManager().database.watchAction(id);
  }
}