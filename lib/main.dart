import 'package:app_luca_cinti/database/database.dart';
import 'package:app_luca_cinti/model/utente.dart';
import 'package:app_luca_cinti/pages/main_page.dart';
import 'package:app_luca_cinti/pages/pagina_login.dart';
import 'package:app_luca_cinti/pages/pagina_pratiche_cliente.dart';
import 'package:app_luca_cinti/repository/repository.dart';
import 'package:app_luca_cinti/states/stato_login.dart';
import 'package:app_luca_cinti/states/stato_pagina_clienti.dart';
import 'package:app_luca_cinti/states/stato_pagina_pratiche.dart';
import 'package:app_luca_cinti/states/stato_refresh.dart';
import 'package:app_luca_cinti/widgets/gestore_notifiche.dart';
import 'package:app_luca_cinti/widgets/slide_personalizzato.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  final statoLogin = StatoLogin();
  await statoLogin.init();
  final db = DatabaseInterno();
  await db.init();

  runApp(
    App(
      statoLogin,
      Repository(db),
    ),
  );
}

class App extends StatelessWidget {
  final statoLogin;
  final repos;

  App(
    this.statoLogin,
    this.repos,
  );

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
        ChangeNotifierProvider<StatoRefresh>(
          create: (context) => StatoRefresh(repos),
        ),
      ],
      child: Builder(
        builder: (context) => GestoreNotifiche(
          statoRefresh: context.watch<StatoRefresh>(),
          statoPaginaClienti: context.watch<StatoPaginaClienti>(),
          statoPaginaPratiche: context.watch<StatoPaginaPratiche>(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Gestione Archivio',
            theme: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(),
              primaryColor: Color.fromARGB(255, 139, 0, 0),
            ),
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case '/':
                  return MaterialPageRoute(
                    builder: (context) => Ingresso(),
                  );
                case '/pratiche_cliente':
                  return SlideRightRoute(
                    page: PaginaPraticheCliente(),
                    settings: settings,
                  );
                default:
                  throw Exception(
                    'percorso sconosciuto ${settings.name}',
                  );
              }
            },
            initialRoute: '/',
          ),
        ),
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
