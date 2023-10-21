
import 'package:flutter/material.dart';
import 'package:up_down_app/data/up_down_action.dart';
import 'package:up_down_app/data/up_down_action_dao.dart';

class UpDownActionModel extends ChangeNotifier {
  UpDownActionDao _actionDao = UpDownActionDao();

  List<UpDownAction> _actions = [];

  List<UpDownAction> get actions => _actions;

  Future<void> addAction(UpDownAction action) {
    _actions.add(action);

    /// listen for a database change
    _actionDao.create(action);
    // Notify all listeners (i.e., rebuild all widgets that depend on this model)
    notifyListeners();
  }

  Future<void> deleteAction(UpDownAction action) {
    _actions.remove(action);

    _actionDao.delete(action.id!);
    // Notify all listeners (i.e., rebuild all widgets that depend on this model)
    notifyListeners();
  }

  Future<void> updateAction(UpDownAction action) async {
    await _actionDao.update(action);

    _actions[_actions.indexWhere((element) => element.id == action.id)] = action;

    // Notify all listeners (i.e., rebuild all widgets that depend on this model)
    notifyListeners();
  }

  void loadActions() {
    _actionDao.readAll().then((value) {
      _actions = value;
      notifyListeners();
    });
}
}