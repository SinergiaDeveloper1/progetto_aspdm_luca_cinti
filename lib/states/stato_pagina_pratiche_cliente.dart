import 'package:app_luca_cinti/model/pratica.dart';
import 'package:app_luca_cinti/repository/repository.dart';
import 'package:flutter/material.dart';

class StatoPaginaPraticheCliente extends ChangeNotifier {
  final int idCliente;

  bool staCaricando = false;
  bool errore = false;
  List<Pratica> elencoPratiche = [];

  Repository _repository = Repository();

  StatoPaginaPraticheCliente(this.idCliente);

  Future<void> getPraticheCliente([bool mostraCaricamento = true]) async {
    if (mostraCaricamento) {
      staCaricando = true;
      notifyListeners();
    }

    try {
      elencoPratiche = await _repository.getPraticheCliente(idCliente);

      //TODO, cancellare
      await Future.delayed(Duration(seconds: 3));

    } catch (e) {
      errore = true;
    } finally {
      staCaricando = false;
      notifyListeners();
    }
  }
}
