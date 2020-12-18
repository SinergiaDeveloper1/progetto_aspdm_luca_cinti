import 'package:app_luca_cinti/pages/pagina_clienti.dart';
import 'package:app_luca_cinti/pages/pagina_pratiche.dart';
import 'package:app_luca_cinti/states/stato_login.dart';
import 'package:app_luca_cinti/states/stato_pagina_clienti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _indicePagina;
  SearchBar searchBar;

  @override
  void initState() {
    super.initState();
    _indicePagina = 0;

    searchBar = SearchBar(
      setState: setState,
      hintText: 'Cerca...',
      onSubmitted: (value) {
        //TODO: fare logica di ricerca
        print(value);
      },
      buildDefaultAppBar: (context) => AppBar(
        title: Text('Gestione Archivio'),
        centerTitle: true,
        leading: searchBar.getSearchAction(context),
        actions: [
          PopupMenuButton(
            //TODO: VEDI SE VUOI CUSTOMIZZARLO
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Logout'),
                value: 'Logout',
              ),
            ],
            onSelected: (value) {
              if (value == 'Logout') {
                context.read<StatoLogin>().logout();
              }
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchBar.build(context),
      body: IndexedStack(
        children: [
          PaginaPratiche(),
          ChangeNotifierProvider<StatoPaginaClienti>(
            child: PaginaClienti(),
            create: (_) => StatoPaginaClienti(),
          ),
        ],
        index: _indicePagina,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (nuovoIndice) {
          setState(() {
            _indicePagina = nuovoIndice;
          });
        },
        currentIndex: _indicePagina,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search_sharp),
            label: 'Storico Pratiche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_sharp),
            label: 'Anagrafica clienti',
          ),
        ],
      ),
    );
  }
}
