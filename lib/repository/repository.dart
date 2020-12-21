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
    return [
      Pratica(10, 2020, 1, 'Dichiarazione redditi', 'Luca Cinti', null),
      Pratica(1, 2019, 1, 'Dichiarazione redditi', 'Luca Cinti', null),
      Pratica(11, 2020, 2, 'Test, prova prova', 'Cormorano', null),
      Pratica(12, 2020, 3, 'ciao ciao ciao', null, 'pellicano ASD'),
      Pratica(2, 2019, 2, 'Dichiarazione IVA', 'Luca Cinti', null),
      Pratica(3, 2019, 3, 'Varie', null, 'Società truffe'),
      Pratica(4, 2019, 4, 'Contabilità', 'Luca Cinti', null),
      Pratica(5, 2019, 5, 'Test prova', null, 'FIAT SPA'),
      Pratica(13, 2020, 4, 'Ciao ciao ', 'Un altro cliente', null),
    ];
  }

  Future<List<Pratica>> getPraticheCliente(int idCliente) async {
    return [
      Pratica(10, 2020, 1, 'Dichiarazione redditi', 'Luca Cinti', null),
      Pratica(1, 2019, 1, 'Dichiarazione redditi', 'Luca Cinti', null),
      Pratica(2, 2019, 2, 'Dichiarazione IVA', 'Luca Cinti', null),
      Pratica(3, 2019, 3, 'Varie', null, 'Società truffe'),
      Pratica(13, 2020, 4, 'Ciao ciao ', 'Un altro cliente', null),
    ];
  }
}
