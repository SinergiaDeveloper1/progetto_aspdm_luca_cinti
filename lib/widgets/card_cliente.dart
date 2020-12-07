import 'package:app_luca_cinti/model/cliente.dart';
import 'package:flutter/material.dart';

class CardCliente extends StatelessWidget {
  final Cliente cliente;

  const CardCliente(this.cliente);

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
                Icon(
                    cliente.personaFisica
                        ? Icons.person
                        : Icons.apartment_sharp,
                    color: cliente.personaFisica ? Colors.blue : Colors.green),
                const SizedBox(
                  width: 10,
                ),
                Text(cliente.personaFisica
                    ? cliente.nominativo
                    : cliente.ragioneSociale)
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                SizedBox(
                  width: 34,
                ),
                if (cliente.partitaIva != null) Text(cliente.partitaIva),
                if (cliente.partitaIva != null)
                  const SizedBox(
                    width: 20,
                  ),
                if (cliente.codFiscale != null) Text(cliente.codFiscale),
              ],
            )
          ],
        ),
      ),
    );
  }
}
