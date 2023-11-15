import 'package:drift/drift.dart';


import 'dart:io';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';
import 'package:up_down_app/data/up_down_action.dart';

part 'database.g.dart';

@DriftDatabase(include: { '../config/database.drift' })
class UpDownDatabase extends _$UpDownDatabase {
  UpDownDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<UpDownAction>> watchAllActions({int limit = 50, int offset = 0}) {
    return (select(actions)..limit(limit, offset: offset)).watch();
  }

  Stream<UpDownAction> watchAction(int id) {
    return (select(actions)..where((a) => a.id.equals(id))).watchSingle();
  }

  Future<int> insertAction(ActionsCompanion action) {
    return into(actions).insert(action);
  }

  Future updateAction(ActionsCompanion action) {
    return update(actions).replace(action);
  }

  Future deleteAction(int id) {
    return (delete(actions)..where((a) => a.id.equals(id))).go();
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}


class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._internal();

  UpDownDatabase? _database;

  DatabaseManager._internal();

  factory DatabaseManager() {
    return _instance;
  }

  Future<void> initDatabase() async {
    _database ??= UpDownDatabase();
  }

  UpDownDatabase get database => _database!;

  void closeDatabase() {
    _database?.close();
    _database = null;
  }
}



