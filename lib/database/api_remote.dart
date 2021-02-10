import 'dart:convert';
import 'package:app_luca_cinti/model/cliente.dart';
import 'package:app_luca_cinti/model/pratica.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Cliente>> getClientiAPI() async {
  try {
    final result = await http.get(
        'https://firebasestorage.googleapis.com/v0/b/gestionearchivio-870b6.appspot.com/o/json_Clienti_new.json?alt=media&token=47433553-c682-452a-bcae-1d520d3a8639',
        headers: {'Accept':'application-json; charset=UTF-8'});

    if (result.statusCode != 200) return null;

    //debugPrint(result.body);
    final List<dynamic> listaDati = jsonDecode(result.body);
    final datiClienti = listaDati.map((e) => Cliente.daJson(e)).toList();

    return datiClienti;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<List<Pratica>> getPraticheAPI() async {
  try {
    final result = await http.get(
        'https://firebasestorage.googleapis.com/v0/b/gestionearchivio-870b6.appspot.com/o/json_Pratiche_new.json?alt=media&token=f37f9d84-cb85-4977-89a2-02a72b545047');

    if (result.statusCode != 200) return null;

    final List<dynamic> listaDati = jsonDecode(result.body);
    final datiPratiche = listaDati.map((e) => Pratica.daJson(e)).toList();

    return datiPratiche;
  } catch (e) {
    print(e);
    return null;
  }
}
