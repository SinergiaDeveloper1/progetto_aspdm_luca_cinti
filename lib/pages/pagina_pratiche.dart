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
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 22,
                        ),
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
