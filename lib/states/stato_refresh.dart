import 'package:app_luca_cinti/repository/repository.dart';
import 'package:flutter/material.dart';

class StatoRefresh extends ChangeNotifier {
  /*bool staCaricando = false;
  bool errore = false;*/
  Repository _repository;

  StatoRefresh(this._repository);

  Future<void> aggiornaDB() async {

    try {
      await _repository.aggiornaDB();
      //await Future.delayed(Duration(seconds: 3));
    } catch (e) {
      //errore = true;
    } finally {
      //staCaricando = false;
      notifyListeners();
    }
  }
}