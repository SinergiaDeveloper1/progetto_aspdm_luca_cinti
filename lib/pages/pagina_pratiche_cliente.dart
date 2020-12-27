import 'package:app_luca_cinti/model/cliente.dart';
import 'package:app_luca_cinti/repository/repository.dart';
import 'package:app_luca_cinti/states/stato_pagina_pratiche_cliente.dart';
import 'package:app_luca_cinti/widgets/card_pratica_cliente.dart';
import 'package:app_luca_cinti/widgets/card_pratica.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

class PaginaPraticheCliente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cliente cliente = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Storico pratiche di ${cliente.nominativo}'),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
        create: (_) => StatoPaginaPraticheCliente(
          cliente.nominativo,
          context.read<Repository>(),
        ),
        child: PaginaPraticheClienteWidget(cliente),
      ),
    );
  }
}

class PaginaPraticheClienteWidget extends StatefulWidget {
  final Cliente cliente;

  PaginaPraticheClienteWidget(this.cliente);

  @override
  _PaginaPraticheClienteWidgetState createState() =>
      _PaginaPraticheClienteWidgetState();
}

class _PaginaPraticheClienteWidgetState
    extends State<PaginaPraticheClienteWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.microtask(() =>
          context.read<StatoPaginaPraticheCliente>().getPraticheCliente()),
      builder: (_, __) => Consumer<StatoPaginaPraticheCliente>(
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
                if (value.elencoPratiche.isEmpty) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            'Non sono presenti pratiche per il cliente ${widget.cliente.nominativo}',
                            style: Theme.of(context).textTheme.headline6,
                            textAlign: TextAlign.center,
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
                        CardPratica(value.elencoPratiche[indice]),
                        //CardPraticaCliente(value.elencoPratiche[indice]),
                    itemCount: value.elencoPratiche.length,
                  ),
                );
              },
            ),
            onRefresh: () => value.getPraticheCliente(false),
          );
        },
      ),
    );
  }
}
