import 'package:app_luca_cinti/database/database.dart';
import 'package:app_luca_cinti/model/cliente.dart';
import 'package:app_luca_cinti/model/pratica.dart';

extension StringContains on String {
  bool containsCaseIns(String daComparare) {
    return this.toLowerCase().contains(daComparare?.toLowerCase());
  }
}

class Repository {
  final DatabaseInterno _database;

  Repository(this._database);

  Future<List<Cliente>> getClienti(String filtro) async {
    final clienti = await _database.getClienti();

    if (filtro != null && filtro.isNotEmpty) {
      return clienti
          .where((e) =>
              e.nominativo.containsCaseIns(filtro.trim()) ||
              (e.codFiscale?.containsCaseIns(filtro.trim()) ?? false) ||
              (e.partitaIva?.containsCaseIns(filtro.trim()) ?? false))
          .toList();
    } else {
      return clienti;
    }
  }

  Future<List<Pratica>> getPratiche(String filtro) async {
    final pratiche = await _database.getPratiche();

    if (filtro != null && filtro.isNotEmpty) {
      return pratiche
          .where((e) =>
      e.nominativo.containsCaseIns(filtro.trim()) ||
          (e.anno.toString().contains(filtro.trim()) ?? false) ||
          (e.attivita?.containsCaseIns(filtro.trim()) ?? false))
          .toList();
    } else {
      return pratiche;
    }
  }

  Future<List<Pratica>> getPraticheCliente(String nominativo) async {
    return await _database.getPratiche(nominativo);


    /*return [
      Pratica(10, true, 2020, 1, 'Dichiarazione redditi', 'Luca Cinti'),
      Pratica(1, true, 2019, 1, 'Dichiarazione redditi', 'Luca Cinti'),
      Pratica(2, true, 2019, 2, 'Dichiarazione IVA', 'Luca Cinti'),
      Pratica(4, true, 2019, 4, 'Contabilità', 'Luca Cinti'),
    ];*/
  }
}
