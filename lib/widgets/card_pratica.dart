import 'package:app_luca_cinti/model/pratica.dart';
import 'package:flutter/material.dart';

class CardPratica extends StatelessWidget {
  final Pratica pratica;

  const CardPratica(this.pratica);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Builder(
          builder: (context) {
            final orientation = MediaQuery.of(context).orientation;
            if (orientation == Orientation.portrait)
              return Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.list),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        pratica.anno.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '#' + pratica.progressivo.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(pratica.flgPF ? Icons.person : Icons.apartment_sharp,
                          color: pratica.flgPF ? Colors.blue : Colors.green),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(pratica.nominativo),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(Icons.description_outlined),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(pratica.attivita),
                    ],
                  ),
                ],
              );
            else
              return Wrap(
                spacing: 10,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.list),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        pratica.anno.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '#' + pratica.progressivo.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.description_outlined),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(pratica.attivita),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(pratica.flgPF ? Icons.person : Icons.apartment_sharp,
                          color: pratica.flgPF ? Colors.blue : Colors.green),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(pratica.nominativo),
                    ],
                  )
                ],
              );
          },
        ),
      ),
    );
  }
}
