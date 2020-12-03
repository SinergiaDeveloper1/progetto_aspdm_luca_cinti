import 'package:app_luca_cinti/pages/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestione Archivio',
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.light(),
        primaryColor: Color.fromARGB(255, 139, 0, 0),
      ),
      home: MainPage(),
    );
  }
}
