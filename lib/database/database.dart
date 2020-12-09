import 'package:app_luca_cinti/model/cliente.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseInterno {
  Database _db;

  Future init() async {
    _db = await openDatabase(
      'database.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE AG_CLIENTI '
            '(ID_CLIENTE INTEGER PRIMARY KEY'
            ', FLG_PERSONA_FISICA INTEGER'
            ', TEXT NOMINATIVO'
            ', TEXT RAGIONE_SOCIALE'
            ', TEXT PARTITA_IVA '
            ', TEXT COD_FISCALE)');

        //TODO FARE ANCHE LA TABELLA DELLE PRATICHE
      },
    );
  }

  Future close() async {
    await _db.close();
  }

  Future<List<Cliente>> getClienti() async {
    //final mappaClienti = await _db.rawQuery('SELECT * FROM AG_CLIENTI');

    //devo ritornare una lista di clienti, la query restituisce una lista di mappe

    //return (Sqflite.firstIntValue(result) == 1);
  }

}
