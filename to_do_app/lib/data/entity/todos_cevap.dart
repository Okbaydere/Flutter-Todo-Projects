import 'package:to_do_app/data/entity/todos.dart';

class ToDosCevap {
  List<ToDos> toDos;
  int success;

  ToDosCevap({required this.toDos, required this.success});

  factory ToDosCevap.fromJson(Map<String, dynamic> json) {
    var success = json["success"] as int;
    var jsonArray = json["toDos"] as List;

    var toDos =
        jsonArray.map((jsonNesnesi) => ToDos.fromJson(jsonNesnesi)).toList();

    return ToDosCevap(toDos: toDos, success: success);
  }
}
