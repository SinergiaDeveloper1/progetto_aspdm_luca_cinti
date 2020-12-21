import 'package:app_luca_cinti/model/pratica.dart';
import 'package:app_luca_cinti/widgets/card_pratica.dart';
import 'package:flutter/material.dart';

class PaginaPratiche extends StatelessWidget {
  final fintaListaPratiche = [
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

  //TODO, COLLEGARE STATO PAGINA PRATICHE, UNIFORMARE ALLA PAGINA DEI CLIENTI

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10),
      itemBuilder: (_, indice) => CardPratica(fintaListaPratiche[indice]),
      itemCount: fintaListaPratiche.length,
    );
  }
}
