import 'dart:convert';
import 'package:app_luca_cinti/model/cliente.dart';
import 'package:http/http.dart' as http;

Future<List<Cliente>> getClientiAPI() async {
  try {
    final result = await http.get('https://10.0.2.2:44332/api/Cliente');

    final List<dynamic> listaDati = jsonDecode(result.body);

    final datiClieti = listaDati.map((e) => Cliente.daMappa(e));

    print(datiClieti);

    return datiClieti;
  } catch (e) {
    print(e);
  }
}

Future<void> getPraticheAPI() {}
