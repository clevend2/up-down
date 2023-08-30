
import 'package:up_down_app/model/action_fields.dart';
import 'package:up_down_app/model/up_down_action.dart';
import 'package:up_down_app/utilities/database.dart';

class ActionRepository {
  final UpDownDatabase db = UpDownDatabase.instance;

  Future<UpDownAction> create(UpDownAction action) async {
    final db = await UpDownDatabase.instance.database;
    final id = await db.insert('actions', action.toMap());
    
    action.setId(id);

    return action;
  }

  Future<UpDownAction> read(int id) async {
    final db = await UpDownDatabase.instance.database;

    final maps = await db.query('actions',
      where: '${ActionFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return UpDownAction.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<int> update(UpDownAction action) async {
    final db = await UpDownDatabase.instance.database;

    return db.update(
      'actions',
      action.toMap(),
      where: '${ActionFields.id} = ?',
      whereArgs: [action.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await UpDownDatabase.instance.database;

    return await db.delete(
      'actions',
      where: '${ActionFields.id} = ?',
      whereArgs: [id],
    );
  }
}