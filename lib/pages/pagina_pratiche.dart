import 'package:app_luca_cinti/model/pratica.dart';
import 'package:app_luca_cinti/states/stato_pagina_pratiche.dart';
import 'package:app_luca_cinti/widgets/card_pratica.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

class PaginaPratiche extends StatefulWidget {
  @override
  _PaginaPraticheState createState() => _PaginaPraticheState();
}

class _PaginaPraticheState extends State<PaginaPratiche> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<StatoPaginaPratiche>().getPratiche();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StatoPaginaPratiche>(
      builder: (context, value, child) {
        return RefreshIndicator(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (value.errore) {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Qualcosa è andato storto!')));
                });
              }
              if (value.datiPratiche.isEmpty) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    child: Center(
                      child: Text(
                        'Non sono presenti pratiche',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    constraints:
                    BoxConstraints(minHeight: constraints.maxHeight),
                  ),
                  physics: AlwaysScrollableScrollPhysics(),
                );
              }
              return LoadingOverlay(
                isLoading: value.staCaricando,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  itemBuilder: (_, indice) =>
                      CardPratica(value.datiPratiche[indice]),
                  itemCount: value.datiPratiche.length,
                ),
              );
            },
          ),
          onRefresh: () => value.getPratiche(false),
        );
      },
    );
  }
}

/*
class PaginaPratiche extends StatelessWidget {
  final fintaListaPratiche = [
    Pratica(10, true, 2020, 1, 'Dichiarazione redditi', 'Luca Cinti'),
    Pratica(1, true, 2019, 1, 'Dichiarazione redditi', 'Luca Cinti'),
    Pratica(11, false, 2020, 2, 'Test, prova prova', 'Cormorano'),
    Pratica(12, false, 2020, 3, 'ciao ciao ciao', 'pellicano ASD'),
    Pratica(2, true, 2019, 2, 'Dichiarazione IVA', 'Luca Cinti'),
    Pratica(3, false, 2019, 3, 'Varie', 'Società truffe'),
    Pratica(4, true, 2019, 4, 'Contabilità', 'Luca Cinti'),
    Pratica(5, false, 2019, 5, 'Test prova', 'FIAT SPA'),
    Pratica(13, true, 2020, 4, 'Ciao ciao ', 'Un altro cliente'),
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
*/