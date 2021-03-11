import 'dart:convert';
import 'package:app_luca_cinti/model/cliente.dart';
import 'package:app_luca_cinti/model/pratica.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;

Future<List<Cliente>> getClientiAPI() async {
  try {
    final snapshotClienti =
        await FirebaseDatabase.instance.reference().child('Clienti').once();

    if (snapshotClienti.value != null) {
      return snapshotClienti.value
          .map<Cliente>(
            (e) => Cliente(
              (e as Map<dynamic, dynamic>)['idCliente'],
              (e as Map<dynamic, dynamic>)['flgPF'],
              (e as Map<dynamic, dynamic>)['nominativo'],
              (e as Map<dynamic, dynamic>)['partitaIva'],
              (e as Map<dynamic, dynamic>)['codFiscale'],
            ),
          )
          .toList();
    } else {
      return [];
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<List<Pratica>> getPraticheAPI() async {
  try {
    final snapshotPratiche =
        await FirebaseDatabase.instance.reference().child('Pratiche').once();

    if (snapshotPratiche.value != null) {
      return snapshotPratiche.value
          .map<Pratica>(
            (e) => Pratica(
              (e as Map<dynamic, dynamic>)['idPratica'],
              (e as Map<dynamic, dynamic>)['flgPF'],
              (e as Map<dynamic, dynamic>)['anno'],
              (e as Map<dynamic, dynamic>)['progressivo'],
              (e as Map<dynamic, dynamic>)['attivita'],
              (e as Map<dynamic, dynamic>)['nominativo'],
            ),
          )
          .toList();
    } else {
      return [];
    }

    /* vecchio modo */
    /*final result = await http.get(
        'https://firebasestorage.googleapis.com/v0/b/gestionearchivio-870b6.appspot.com/o/json_Pratiche_new.json?alt=media&token=f37f9d84-cb85-4977-89a2-02a72b545047');
    if (result.statusCode != 200) return null;
    final List<dynamic> listaDati = jsonDecode(result.body);
    final datiPratiche = listaDati.map((e) => Pratica.daJson(e)).toList();
    return datiPratiche;*/

  } catch (e) {
    print(e);
    return null;
  }
}
