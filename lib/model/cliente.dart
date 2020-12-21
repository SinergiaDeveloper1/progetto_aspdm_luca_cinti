import 'package:equatable/equatable.dart';

class Cliente extends Equatable {
  final int idCliente;
  final bool personaFisica;
  final String nominativo;
  final String ragioneSociale;
  final String partitaIva;
  final String codFiscale;

  Cliente(
    this.idCliente,
    this.personaFisica,
    this.nominativo,
    this.ragioneSociale,
    this.partitaIva,
    this.codFiscale,
  );

  @override
  List<Object> get props => [idCliente];

  //TODO SISTEMARE CON IL MODELLO DATI AGGIORNATO
  factory Cliente.daMappa(Map<String, dynamic> mappa) => Cliente(
      mappa['ID'],
      true,
      '${mappa['NOME']} ${mappa['COGNOME']}',
      null,
      mappa['P_IVA'],
      mappa['COD_FISCALE']);

//TODO FARE ANCHE CON LE PRATICHE

}
