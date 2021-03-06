import 'package:app_luca_cinti/model/cliente.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardCliente extends StatelessWidget {
  final Cliente cliente;

  const CardCliente(this.cliente);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            '/pratiche_cliente',
            arguments: cliente,
          );
        },
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Container(
            child: ListTile(
              leading: Icon(
                  cliente.flgPF ? Icons.person : Icons.apartment_sharp,
                  color: cliente.flgPF ? Colors.blue : Colors.green),
              title: Text(
                cliente.nominativo,
                style: TextStyle(fontSize: 15),
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
        ),
      ),
    );
  }
}
