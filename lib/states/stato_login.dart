import 'package:app_luca_cinti/model/utente.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatoLogin extends ChangeNotifier {
  Utente _utenteLoggato;

  Utente get utenteLoggato => _utenteLoggato;
  bool errore = false;

  void login(
    String username,
    String password,
  ) async {
    if (username == 'SuperAdmin' && password == 'Penna789') {
      final preferenze = await SharedPreferences.getInstance();
      await preferenze.setString('Username', username);
      await preferenze.setString('Password', password);

      _utenteLoggato = Utente(username, password);
      errore = false;
    } else {
      errore = true;
    }
    notifyListeners();
  }

  void logout() async {
    final preferenze = await SharedPreferences.getInstance();
    await preferenze.setString('Username', null);
    await preferenze.setString('Password', null);

    _utenteLoggato = null;
    notifyListeners();
  }

  Future<void> init() async {
    final preferenze = await SharedPreferences.getInstance();
    final username = preferenze.getString('Username');
    final password = preferenze.getString('Password');

    if (username != null && password != null) {
      _utenteLoggato = Utente(username, password);
    }
  }
}
