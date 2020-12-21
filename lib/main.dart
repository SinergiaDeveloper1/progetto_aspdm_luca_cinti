import 'package:app_luca_cinti/database/database.dart';
import 'package:app_luca_cinti/model/utente.dart';
import 'package:app_luca_cinti/pages/main_page.dart';
import 'package:app_luca_cinti/pages/pagina_login.dart';
import 'package:app_luca_cinti/pages/pagina_pratiche_cliente.dart';
import 'package:app_luca_cinti/repository/repository.dart';
import 'package:app_luca_cinti/states/stato_login.dart';
import 'package:app_luca_cinti/states/stato_pagina_clienti.dart';
import 'package:app_luca_cinti/states/stato_pagina_pratiche.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final statoLogin = StatoLogin();
  await statoLogin.init();
  final db = DatabaseInterno();
  await db.init();

  runApp(App(statoLogin, Repository(db)));
}

class App extends StatelessWidget {
  final statoLogin;
  final repos;

  App(this.statoLogin, this.repos);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Repository>.value(value: repos),
        ChangeNotifierProvider<StatoLogin>.value(
          value: statoLogin,
        ),
        ChangeNotifierProvider<StatoPaginaClienti>(
          create: (context) => StatoPaginaClienti(repos),
        ),
        ChangeNotifierProvider<StatoPaginaPratiche>(
          create: (context) => StatoPaginaPratiche(repos),
        ),
      ],
      child: MaterialApp(
        title: 'Gestione Archivio',
        theme: ThemeData.light().copyWith(
          colorScheme: ColorScheme.light(),
          primaryColor: Color.fromARGB(255, 139, 0, 0),
        ),
        routes: {
          '/': (_) => Ingresso(),
          '/pratiche_cliente': (_) => PaginaPraticheCliente(),
        },
        initialRoute: '/',
      ),
    );
  }
}

class Ingresso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<StatoLogin, Utente>(
      builder: (context, value, child) {
        if (value != null) {
          return MainPage();
        } else {
          return PaginaLogin();
        }
      },
      selector: (_, stato) => stato.utenteLoggato,
    );
  }
}
