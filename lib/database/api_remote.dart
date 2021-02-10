import 'dart:convert';
import 'package:app_luca_cinti/model/cliente.dart';
import 'package:app_luca_cinti/model/pratica.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Cliente>> getClientiAPI() async {
  try {
    final result = await http.get(
        'https://firebasestorage.googleapis.com/v0/b/gestionearchivio-870b6.appspot.com/o/json_Clienti.json?alt=media&token=f7f678df-4f03-44c8-9d75-f954fbe9ab59',
        headers: {'Accept':'application-json; charset=UTF-8'});

    if (result.statusCode != 200) return null;

    debugPrint(result.body);

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
        'https://firebasestorage.googleapis.com/v0/b/gestionearchivio-870b6.appspot.com/o/json_Pratiche.json?alt=media&token=dbb0d451-80ee-4eee-9d96-f858942eec89');

    if (result.statusCode != 200) return null;

    final List<dynamic> listaDati = jsonDecode(result.body);
    final datiPratiche = listaDati.map((e) => Pratica.daJson(e)).toList();

    return datiPratiche;
  } catch (e) {
    print(e);
    return null;
  }
}
