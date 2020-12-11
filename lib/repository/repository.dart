import 'package:app_luca_cinti/model/cliente.dart';
import 'package:app_luca_cinti/model/pratica.dart';

class Repository {
  Future<List<Cliente>> getClienti() async {
    return [
      Cliente(1, true, 'Luca Cinti', null, '02566130411', 'CNTLCU89L06C357Q'),
      Cliente(2, true, 'Mario Rossi', null, null, 'CIAO_CIAO:TTT'),
      Cliente(3, false, '', 'Azienda a caso', '02566130444', 'prova prova'),
      Cliente(4, true, 'Luca CIAO', null, null, null),
    ];
  }

  Future<List<Pratica>> getPratiche() async {
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
