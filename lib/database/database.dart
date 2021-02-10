import 'package:app_luca_cinti/model/cliente.dart';
import 'package:app_luca_cinti/model/pratica.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseInterno {
  Database _db;

  Future init() async {
    var percorsodb = await getDatabasesPath();
    var path = join(percorsodb, "database.db");

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {

        await db.execute('CREATE TABLE APP_CLIENTI ('
            'ID INTEGER PRIMARY KEY, '
            'FLG_PF INTEGER, '
            'NOMINATIVO TEXT, '
            'P_IVA TEXT, '
            'COD_FISCALE TEXT)');

        await db.execute('CREATE TABLE APP_PRATICHE ('
            'ID_PRATICA INTEGER PRIMARY KEY, '
            'FLG_PF INTEGER, '
            'ANNO INTEGER, '
            'PROGRESSIVO INTEGER, '
            'DES_ATTIVITA TEXT, '
            'NOMINATIVO TEXT)');
      },
    );
  }

  Future close() async {
    await _db.close();
  }

  Future<List<Cliente>> getClienti() async {
    try {
      final mappaClienti = await _db
          .rawQuery('SELECT * FROM APP_CLIENTI ORDER BY NOMINATIVO ASC');

      return mappaClienti.map((e) => Cliente.daMappa(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<Pratica>> getPratiche([String nominativo = '']) async {
    try {
      final String filtroQuery =
          nominativo == '' ? '' : 'WHERE NOMINATIVO = "${nominativo}"';

      final mappaPratiche = await _db.rawQuery(
          'SELECT * FROM APP_PRATICHE ${filtroQuery} ORDER BY ANNO DESC');

      return mappaPratiche.map((e) => Pratica.daMappa(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> aggiornaDB(List<Cliente> clienti, List<Pratica> pratiche) async {
    try {
      _db.rawDelete('DELETE FROM APP_CLIENTI');
      _db.rawDelete('DELETE FROM APP_PRATICHE');

      final batch = _db.batch();

      clienti.forEach((element) {
        batch.rawInsert(
            'INSERT INTO APP_CLIENTI (ID, FLG_PF, NOMINATIVO, P_IVA, COD_FISCALE) VALUES (?, ?, ?, ?, ?)',
            [
              element.idCliente,
              element.flgPF,
              element.nominativo,
              element.partitaIva,
              element.codFiscale
            ]);
      });

      pratiche.forEach((element) {
        batch.rawInsert(
            'INSERT INTO APP_PRATICHE (ID_PRATICA, FLG_PF, ANNO, PROGRESSIVO, DES_ATTIVITA, NOMINATIVO) VALUES (?, ?, ?, ?, ?, ?)',
            [
              element.idPratica,
              element.flgPF,
              element.anno,
              element.progressivo,
              element.attivita,
              element.nominativo
            ]);
      });

      await batch.commit();
    } catch (e) {
      print(e);
    }
  }
}
