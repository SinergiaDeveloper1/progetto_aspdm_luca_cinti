import 'package:app_luca_cinti/database/database.dart';
import 'package:app_luca_cinti/model/utente.dart';
import 'package:app_luca_cinti/pages/main_page.dart';
import 'package:app_luca_cinti/pages/pagina_login.dart';
import 'package:app_luca_cinti/pages/pagina_pratiche_cliente.dart';
import 'package:app_luca_cinti/states/stato_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) async {
        final db = DatabaseInterno();
        await db.init();
        return db;
      },
      dispose: (context, db) => db.close(),
      child: ChangeNotifierProvider(
        create: (context) => StatoLogin(),
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
