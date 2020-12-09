import 'package:app_luca_cinti/database/database.dart';
import 'package:app_luca_cinti/pages/main_page.dart';
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
      child: MaterialApp(
        title: 'Gestione Archivio',
        theme: ThemeData.light().copyWith(
          colorScheme: ColorScheme.light(),
          primaryColor: Color.fromARGB(255, 139, 0, 0),
        ),
        home: MainPage(),
      ),
    );
  }
}
