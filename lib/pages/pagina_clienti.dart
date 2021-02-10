import 'package:app_luca_cinti/states/stato_pagina_clienti.dart';
import 'package:app_luca_cinti/widgets/card_cliente.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

class PaginaClienti extends StatefulWidget {
  @override
  _PaginaClientiState createState() => _PaginaClientiState();
}

class _PaginaClientiState extends State<PaginaClienti> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<StatoPaginaClienti>().getClienti();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StatoPaginaClienti>(
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
              if (value.datiClienti.isEmpty) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    child: Center(
                      child: Text(
                        'Non sono presenti clienti',
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
                      CardCliente(value.datiClienti[indice]),
                  itemCount: value.datiClienti.length,
                ),
              );
            },
          ),
          onRefresh: () => value.getClienti(false),
        );
      },
    );
  }
}
