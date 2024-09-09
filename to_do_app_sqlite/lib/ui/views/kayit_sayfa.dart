import 'package:flutter/material.dart';
import 'package:to_do_app/ui/qubit/kayit_sayfa_cubit.dart';
import 'package:to_do_app/ui/renkler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {
  var tfName = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kayıt Sayfa",
          style: TextStyle(color: hardal, fontFamily: "Pacifico", fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: haki,
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
                  context.read<KayitSayfaCubit>().kaydet(tfName.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: renk3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  "KAYDET",
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
