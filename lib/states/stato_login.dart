import 'package:app_luca_cinti/model/utente.dart';
import 'package:flutter/material.dart';

class StatoLogin extends ChangeNotifier {
  Utente _utenteLoggato;

  Utente get utenteLoggato => _utenteLoggato;

  void login(
    String username,
    String password,
  ) {
    //TODO controllare se l'utente loggato esiste

    _utenteLoggato = Utente(username, password);
    notifyListeners();
  }

  void logout() {
    _utenteLoggato = null;
    notifyListeners();
  }
}
