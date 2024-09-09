import 'package:flutter/material.dart';
import 'package:to_do_app/data/entity/todos.dart';
import 'package:to_do_app/ui/qubit/detay_sayfa_cubit.dart';
import 'package:to_do_app/ui/renkler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetaySayfa extends StatefulWidget {
  ToDos toDos;
  DetaySayfa({super.key, required this.toDos});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  var tfName = TextEditingController();

  @override
  void initState() {
    super.initState();
    var toDo = widget.toDos;
    tfName.text = toDo.name;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detay Sayfa",
          style: TextStyle(color: hardal, fontFamily: "Pacifico", fontSize: 24),
        ),
        backgroundColor: haki,
        centerTitle: true,
      ),
      backgroundColor: pastelYesil,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                controller: tfName,
                decoration: InputDecoration(
                  hintText: "Yapılacak Giriniz...",
                  filled: true,
                  fillColor: beyaz,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  context.read<DetaySayfaCubit>().guncelle(widget.toDos.id, tfName.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: renk3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  "GÜNCELLE",
                  style: TextStyle(color: beyaz),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
