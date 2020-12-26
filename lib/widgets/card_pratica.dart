import 'package:app_luca_cinti/model/pratica.dart';
import 'package:flutter/material.dart';

class CardPratica extends StatelessWidget {
  final Pratica pratica;

  const CardPratica(this.pratica);

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
                    pratica.flgPF
                        ? Icons.person
                        : Icons.apartment_sharp,
                    color: pratica.flgPF
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
