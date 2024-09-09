import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/repo/tododao_repository.dart';

class DetaySayfaCubit extends Cubit<void> {
  DetaySayfaCubit()
      : super(0); // bu bir constructor ve super'in içine herhangi bir değer alır
  var toDoRepo = ToDoDaoRepository();

  Future<void> guncelle(int id, String name) async {
    await toDoRepo.guncelle(id, name);
  }
  
}
