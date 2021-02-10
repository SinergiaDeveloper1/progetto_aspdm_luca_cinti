import 'package:app_luca_cinti/model/pratica.dart';
import 'package:app_luca_cinti/repository/repository.dart';
import 'package:flutter/material.dart';

class StatoPaginaPratiche extends ChangeNotifier {
  bool staCaricando = false;
  bool errore = false;
  List<Pratica> datiPratiche = [];
  Repository _repository;

  StatoPaginaPratiche(this._repository);

  Future<void> getPratiche(
      [bool mostraCaricamento = true, String filtro]) async {
    if (mostraCaricamento) {
      staCaricando = true;
      notifyListeners();
    }

    try {
      datiPratiche = await _repository.getPratiche(filtro);
    } catch (e) {
      errore = true;
    } finally {
      staCaricando = false;
      notifyListeners();
    }
  }
}
