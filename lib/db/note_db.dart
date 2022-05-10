import 'package:fnote_app/models/note_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NoteDatabase {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }

    _db = await initializeDb();
    return _db;
  }

  initializeDb() async {
    var databasePath = await getDatabasesPath();
    var path = join(databasePath, "notedb.db");
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database database, int version) async {
    await database.execute('''
        CREATE TABLE note (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          description TEXT NOT NULL, 
          date TEXT NOT NULL, 
          time TEXT NOT NULL
          )
        ''');
  }

  Future<int> insert(NoteModel model, bool isDuplicate) async {
    var dbClient = await db;
    return await dbClient!.insert(
      'note',
      isDuplicate? model.toMapDuplicateRecord() : model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<NoteModel>?> read() async {
    var dbClient = await db;
    List<Map<String, Object?>> mapList =
        await dbClient!.query('note', orderBy: "id desc");
    if (mapList.isEmpty) {
      return mapList.map((map) => NoteModel.fromMap(map)).toList();
    }
    return null;
  }
}
