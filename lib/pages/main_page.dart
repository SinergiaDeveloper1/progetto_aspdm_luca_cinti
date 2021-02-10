import 'package:app_luca_cinti/pages/pagina_clienti.dart';
import 'package:app_luca_cinti/pages/pagina_pratiche.dart';
import 'package:app_luca_cinti/states/stato_login.dart';
import 'package:app_luca_cinti/states/stato_pagina_clienti.dart';
import 'package:app_luca_cinti/states/stato_pagina_pratiche.dart';
import 'package:app_luca_cinti/states/stato_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _indicePagina;
  SearchBar searchBar;
  bool stoFiltranoPratiche;
  bool stoFiltrandoClienti;

  @override
  void initState() {
    super.initState();
    _indicePagina = 0;
    stoFiltranoPratiche = false;
    stoFiltrandoClienti = false;

    searchBar = SearchBar(
      setState: setState,
      hintText: 'Cerca...',
      onSubmitted: (value) {
        if (_indicePagina == 0) {
          setState(() {
            stoFiltranoPratiche = true;
          });
          context.read<StatoPaginaPratiche>().getPratiche(true, value);
        } else if (_indicePagina == 1) {
          context.read<StatoPaginaClienti>().getClienti(true, value);
          setState(() {
            stoFiltrandoClienti = true;
          });
        }
      },
      buildDefaultAppBar: (context) => AppBar(
        title: Text('Gestione Archivio'),
        centerTitle: true,
        leading: searchBar.getSearchAction(context),
        actions: [
          if ((_indicePagina == 0 && stoFiltranoPratiche) ||
              (_indicePagina == 1 && stoFiltrandoClienti))
            IconButton(
              icon: Icon(Icons.filter_alt_outlined),
              onPressed: () {
                if (_indicePagina == 0) {
                  setState(() {
                    stoFiltranoPratiche = false;
                  });
                  context.read<StatoPaginaPratiche>().getPratiche(true);
                } else if (_indicePagina == 1) {
                  setState(() {
                    stoFiltrandoClienti = false;
                  });
                  context.read<StatoPaginaClienti>().getClienti(true);
                }
              },
            ),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Aggiorna dati'),
                value: 'Aggiorna',
              ),
              PopupMenuItem(
                child: Text('Logout'),
                value: 'Logout',
              ),
            ],
            onSelected: (value) {
              if (value == 'Logout') {
                context.read<StatoLogin>().logout();
              } else if (value == 'Aggiorna') {
                context.read<StatoRefresh>().aggiornaDB();
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchBar.build(context),
      body: Selector<StatoRefresh, bool>(
        selector: (_, stato) => stato.staCaricando,
        builder: (context, value, child) => LoadingOverlay(
          isLoading: value,
          child: IndexedStack(
            children: [
              PaginaPratiche(),
              PaginaClienti(),
            ],
            index: _indicePagina,
          ),
        ),
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
            icon: Icon(Icons.list_alt_sharp),
            label: 'Storico Pratiche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_sharp),
            label: 'Anagrafica clienti',
          ),
        ],
        //type: BottomNavigationBarType.shifting,
        backgroundColor: Color.fromARGB(255, 139, 0, 0),
        fixedColor: Colors.white,
      ),
    );
  }
}
