import 'package:drift/drift.dart';
import 'package:sqflite/sqflite.dart';
import 'package:up_down_app/data/up_down_action.dart';
import 'package:up_down_app/utilities/database.dart';

/// Uses britedb instance from database class to handle CRUD operations which broadcast events that can be captured by the models
class UpDownActionDao extends Table {
  @override
  String get tableName => 'actions';
}
