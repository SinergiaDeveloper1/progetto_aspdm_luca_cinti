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
}
