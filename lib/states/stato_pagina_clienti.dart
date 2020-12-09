import 'package:app_luca_cinti/model/cliente.dart';
import 'package:app_luca_cinti/repository/repository_clienti.dart';
import 'package:flutter/material.dart';

class StatoPaginaClienti extends ChangeNotifier {
  bool staCaricando = false;
  bool errore = false;
  List<Cliente> datiClienti = [];

  RepositoryClienti _repository = RepositoryClienti();

  StatoPaginaClienti();

  Future<void> getClienti([bool mostraCaricamento = true]) async {
    if (mostraCaricamento) {
      staCaricando = true;
      notifyListeners();
    }

    try {
      datiClienti = await _repository.getClienti();

      await Future.delayed(Duration(seconds: 3));
    } catch (e) {
      errore = true;
    } finally {
      staCaricando = false;
      notifyListeners();
    }
  }
}
