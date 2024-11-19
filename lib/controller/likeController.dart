import 'package:get/get.dart';
import 'package:pas_21/model/postModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class Likecontroller extends GetxController{
  static Database? _db;
  var tasks = <PostModel>[].obs;
  var isLiked = false.obs;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db;
  }

  Future<Database> initDB() async {
    var databasePath = await getDatabasesPath();
        String path = join(databasePath, 'task_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tasks(
            idTeam TEXT, 
            strTeam TEXT, 
            strLocation TEXT,
            strBadge TEXT, 
            strStadium TEXT,
            isLiked INTEGER 
          )
        ''');
      },
    );
    
  }
  Future<int> addTask(PostModel task) async {
    var dbClient = await db;
    int result = await dbClient!.insert('tasks', task.toMap());
    loadTasks();
    return result;
  }

  Future<void> loadTasks() async {
    var dbClient = await db; // nyambungin
    List<Map<String, dynamic>> queryResult = await dbClient!.query('tasks');
    tasks.assignAll(queryResult.map((data) => PostModel.fromMap(data)).toList());
  }

   Future<void> deleteTask(String idTeam) async {
    var dbClient = await db;
    await dbClient!.delete('tasks', where: 'idTeam = ?', whereArgs: [idTeam]);
    loadTasks();
  }

  Rx<bool> getLikedById(String idTeam) {
  for (var model in tasks) {
    if (model.idTeam == idTeam) {
      return true.obs;
    }
  }
  return false.obs; 
}

  
}
