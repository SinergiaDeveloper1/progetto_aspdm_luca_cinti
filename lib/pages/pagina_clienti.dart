import 'package:app_luca_cinti/model/cliente.dart';
import 'package:app_luca_cinti/widgets/card_cliente.dart';
import 'package:flutter/material.dart';

class PaginaClienti extends StatelessWidget {
  
  final fintaListaClienti = [
    Cliente(1, true, 'Luca Cinti', null, '02566130411', 'CNTLCU89L06C357Q'),
    Cliente(2, true, 'Mario Rossi', null, null, 'CIAO_CIAO:TTT'),
    Cliente(3, false, '', 'Azienda a caso', '02566130444', 'prova prova'),
    Cliente(4, true, 'Luca CIAO', null, null, null),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, indice) => CardCliente(fintaListaClienti[indice]),
      itemCount: fintaListaClienti.length,
    );
  }
}
