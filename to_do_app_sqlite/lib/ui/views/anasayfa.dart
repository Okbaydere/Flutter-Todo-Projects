import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/entity/todos.dart';
import 'package:to_do_app/ui/qubit/anasayfa_cubit.dart';
import 'package:to_do_app/ui/renkler.dart';
import 'package:to_do_app/ui/views/detay_sayfa.dart';
import 'package:to_do_app/ui/views/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  Future<void> ara(String aramaKelimesi) async {
    print("Ara : $aramaKelimesi");
  }


  @override
  void initState() {

    super.initState();
    //Uygulama çalıştığında bir kere çalışır.

    context.read<AnasayfaCubit>().toDosYukle();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDos",
            style: TextStyle(
                color: turuncu, fontFamily: "Pacifico", fontSize: 24)),
        backgroundColor: haki,
        centerTitle: true,
      ),
      backgroundColor: pastelYesil,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const KayitSayfa()))
              .then((value) {
            context.read<AnasayfaCubit>().toDosYukle();
          });
        },
        backgroundColor: canliyesil,
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoSearchTextField(
                placeholder: "Ara",
                onChanged: (searchText) {
                  context.read<AnasayfaCubit>().ara(searchText);
                },
                decoration: BoxDecoration(
                  color: beyaz,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            BlocBuilder<AnasayfaCubit,List<ToDos>>(
              builder: (context, toDosListesi) {
                if (toDosListesi.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: toDosListesi.length,
                      itemBuilder: (context, indeks) {
                        var toDo = toDosListesi[indeks];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetaySayfa(toDos: toDo))).
                            then((value) {
                              context.read<AnasayfaCubit>().toDosYukle();
                            });
                          },
                          child: Card(
                            color: beyaz,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    toDo.name,
                                    style:
                                        TextStyle(fontSize: 20, color: koyugri),
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: gri,
                                      content: Text("${toDo.name} silinsin mi?",
                                          style: TextStyle(color: beyaz)),
                                      action: SnackBarAction(
                                        label: "Evet",
                                        textColor: beyaz,
                                        onPressed: () {
                                          context.read<AnasayfaCubit>().sil(toDo.id);
                                        },
                                      ),
                                    ));
                                  },
                                  icon: Icon(Icons.clear,
                                      color: gri), // İkon rengi gri
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
