class ToDos{
  int id;
  String name;

  ToDos({required this.id,required this.name});

  factory ToDos.fromJson(Map<String,dynamic> json){
    return ToDos(id: json["id"] as int,  name: json["name"] as String);

  }

}

