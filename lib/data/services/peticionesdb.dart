import 'package:sqflite/sqflite.dart' as sql;

class PeticionesDB {
  static Future<void> crearTabla(sql.Database db) async {
    await db.execute(""" CREATE TABLE  puntos(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      detalle TEXT,
      lon TEXT,
      lat TEXT)

""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('reton4.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await crearTabla(database);
    });
  }

  static Future<void> adicionar(detalle, lon, lat) async {
    final db = await PeticionesDB.db();
    final datos = {"detalle": detalle, "lon": lon, "lat": lat};
    await db.insert("puntos", datos,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> listar() async {
    final db = await PeticionesDB.db();
    return db.query("puntos", orderBy: "detalle");
  }

  static Future<void> eliminar(int id) async {
    final db = await PeticionesDB.db();
    await db.delete("apunte", where: "id=?", whereArgs: [id]);
  }
}
