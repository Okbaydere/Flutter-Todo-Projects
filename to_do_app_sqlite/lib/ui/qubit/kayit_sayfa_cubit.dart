import 'package:to_do_app/data/repo/tododao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KayitSayfaCubit extends Cubit<void> {
  KayitSayfaCubit() : super(0);
  var toDoRepo = ToDoDaoRepository();

  Future<void> kaydet(String name ) async {

    await toDoRepo.kaydet(name);

  }
}
