import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:to_do_app/data/entity/todos.dart';
import 'package:to_do_app/data/entity/todos_cevap.dart';

class ToDoDaoRepository {
  // Dao = database access object
  List<ToDos> parseTodos(String cevap) {
    return ToDosCevap.fromJson(json.decode(cevap)).toDos;
  }

  Future<void> kaydet(String name) async {
    var url = "http://kasimadalan.pe.hu/toDos/insert.php";
    var veri = {"name":name};
    var cevap = await Dio().post(url,data:FormData.fromMap(veri));
    print("Kaydet : ${cevap.data.toString()}");
  }

  Future<void> guncelle(int id, String name) async {
    var url = "http://kasimadalan.pe.hu/toDos/update.php";
    var veri = {"id":id,"name":name};
    var cevap = await Dio().post(url,data:FormData.fromMap(veri));
    print("Guncelle: ${cevap.data.toString()}");

  }

  Future<List<ToDos>> toDosYukle() async {
    var url = "http://kasimadalan.pe.hu/toDos/getAllToDos.php";
    var cevap = await Dio().get(url);
    return parseTodos(cevap.data.toString());
  }

  Future<List<ToDos>> ara(String aramaKelimesi) async {
    var url = "http://kasimadalan.pe.hu/toDos/search.php";
    var veri = {"name": aramaKelimesi};
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    return parseTodos(cevap.data.toString());
  }


  Future<void> sil(int id) async {
    var url = "http://kasimadalan.pe.hu/toDos/delete.php";
    var veri = {"id": id};
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    print("Sil: ${cevap.data.toString()}");

  }
}
