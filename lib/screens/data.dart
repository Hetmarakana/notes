import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
Database?database;
List l=[];
get() async {
  // Get a location using getDatabasesPath
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'demo.db');

// open the database
  database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE Note (id INTEGER PRIMARY KEY AUTOINCREMENT, description TEXT )');
      });




}
get_data()
async{
  String sql="select * from Note";
  l=await  database!.rawQuery(sql);

}
