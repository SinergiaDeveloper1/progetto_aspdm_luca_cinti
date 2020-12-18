import 'package:app_luca_cinti/model/cliente.dart';
import 'package:app_luca_cinti/repository/repository.dart';
import 'package:flutter/material.dart';

class StatoPaginaClienti extends ChangeNotifier {
  bool staCaricando = false;
  bool errore = false;
  List<Cliente> datiClienti = [];
  Repository _repository;

  StatoPaginaClienti(this._repository);

  Future<void> getClienti(
      [bool mostraCaricamento = true, String filtro]) async {
    if (mostraCaricamento) {
      staCaricando = true;
      notifyListeners();
    }

    try {
      datiClienti = await _repository.getClienti(filtro);

      await Future.delayed(Duration(seconds: 3));
    } catch (e) {
      errore = true;
    } finally {
      staCaricando = false;
      notifyListeners();
    }
  }
}
