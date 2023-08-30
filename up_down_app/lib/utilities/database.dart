import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UpDownDatabase {
  static final UpDownDatabase instance = UpDownDatabase._init();

  static Database? _database;

  UpDownDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('updown.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE actions(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        level TEXT NOT NULL,
        talkAboutIt TEXT,
        reallyTalkAboutIt TEXT,
        timestamp DATETIME NOT NULL,
        device TEXT NOT NULL,
        tokenizedTalkAboutIt TEXT,
        type TEXT NOT NULL
      )
    ''');
  }
}
