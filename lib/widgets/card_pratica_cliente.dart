import 'package:app_luca_cinti/model/pratica.dart';
import 'package:flutter/material.dart';

class CardPraticaCliente extends StatelessWidget {
  final Pratica pratica;

  const CardPraticaCliente(this.pratica);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.list),
                const SizedBox(
                  width: 8,
                ),
                Text(pratica.anno.toString()),
                const SizedBox(
                  width: 5,
                ),
                Text('#' + pratica.progressivo.toString()),
                const SizedBox(
                  width: 5,
                ),
                Text(pratica.attivita),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Icon(
                    pratica.nominativo != null
                        ? Icons.person
                        : Icons.apartment_sharp,
                    color: pratica.nominativo != null
                        ? Colors.blue
                        : Colors.green),
                const SizedBox(
                  width: 8,
                ),
                Text(pratica.nominativo),
              ],
            )
          ],
        ),
      ),
    );
  }
}
