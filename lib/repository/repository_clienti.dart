import 'package:app_luca_cinti/model/cliente.dart';

class RepositoryClienti {
  Future<List<Cliente>> getClienti() async {
    return [
      Cliente(1, true, 'Luca Cinti', null, '02566130411', 'CNTLCU89L06C357Q'),
      Cliente(2, true, 'Mario Rossi', null, null, 'CIAO_CIAO:TTT'),
      Cliente(3, false, '', 'Azienda a caso', '02566130444', 'prova prova'),
      Cliente(4, true, 'Luca CIAO', null, null, null),
    ];
  }
}
