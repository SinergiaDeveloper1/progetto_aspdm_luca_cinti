import 'package:app_luca_cinti/model/pratica.dart';
import 'package:app_luca_cinti/repository/repository.dart';
import 'package:flutter/material.dart';

class StatoPaginaPraticheCliente extends ChangeNotifier {
  final String nominativo;

  bool staCaricando = false;
  bool errore = false;
  List<Pratica> elencoPratiche = [];
  Repository _repository;

  StatoPaginaPraticheCliente(
    this.nominativo,
    this._repository,
  );

  Future<void> getPraticheCliente([bool mostraCaricamento = true]) async {
    if (mostraCaricamento) {
      staCaricando = true;
      notifyListeners();
    }

    try {
      elencoPratiche = await _repository.getPraticheCliente(nominativo);
    } catch (e) {
      errore = true;
    } finally {
      staCaricando = false;
      notifyListeners();
    }
  }
}
