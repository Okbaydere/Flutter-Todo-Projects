import 'package:to_do_app/data/entity/todos.dart';
import 'package:to_do_app/sqlite/veritabani_yardimcisi.dart';

class ToDoDaoRepository {
  // Dao = database access object
  Future<void> kaydet(String name) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var yeniTodo = <String,dynamic>{};
    yeniTodo["name"] = name;
    await db.insert("toDo", yeniTodo);

  }

  Future<void> guncelle(int id, String name) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    var guncellenenTodo = <String,dynamic>{};
    guncellenenTodo["name"] = name;

    await db.update("toDo", guncellenenTodo, where: "id = ?", whereArgs: [id]);

  }

  Future<List<ToDos>> toDosYukle() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM toDo");

    return List.generate(maps.length, (index) {
      var satir = maps[index];
      var id = satir["id"];
      var name = satir["name"];
      return ToDos(id: id, name: name);
    });
  }

  Future<List<ToDos>> ara(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM toDo WHERE name LIKE '%$aramaKelimesi%'" );

    return List.generate(maps.length, (index) {
      var satir = maps[index];
      var id = satir["id"];
      var name = satir["name"];
      return ToDos(id: id, name: name);
    });
  }

  Future<void> sil(int id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete("toDo", where: "id = ?", whereArgs: [id]);

  }
}
