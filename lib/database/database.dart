import 'dart:io';
import 'package:app_luca_cinti/model/cliente.dart';
import 'package:app_luca_cinti/model/pratica.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseInterno {
  Database _db;

  Future init() async {
    var percorsodb = await getDatabasesPath();
    var path = join(percorsodb, "database.db");

    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "database.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }

    _db = await openDatabase(
      'database.db',
      version: 1,
      onCreate: (db, version) async {
        print('HO CHIAMATO ONCREATE');
      },
    );
  }

  Future close() async {
    await _db.close();
  }

  Future<List<Cliente>> getClienti() async {
    final mappaClienti = await _db.rawQuery(
        'SELECT * FROM FAKE_APP_TABELLA_CLIENTI ORDER BY NOMINATIVO ASC');

    return mappaClienti.map((e) => Cliente.daMappa(e)).toList();
  }

  Future<List<Pratica>> getPratiche([String nominativo = '']) async {
    final String filtroQuery =
        nominativo == '' ? '' : 'WHERE NOMINATIVO = "${nominativo}"';

    final mappaPratiche = await _db.rawQuery(
        'SELECT * FROM FAKE_APP_TABELLA_PRATICHE ${filtroQuery} ORDER BY ANNO DESC');

    return mappaPratiche.map((e) => Pratica.daMappa(e)).toList();
  }

  Future<void> aggiornaDB(List<Cliente> clienti, List<Pratica> pratiche) {

  }

}
