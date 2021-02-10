import 'package:equatable/equatable.dart';

class Cliente extends Equatable {
  final int idCliente;
  final bool flgPF;
  final String nominativo;
  final String partitaIva;
  final String codFiscale;

  Cliente(
    this.idCliente,
    this.flgPF,
    this.nominativo,
    this.partitaIva,
    this.codFiscale,
  );

  @override
  List<Object> get props => [idCliente];

  factory Cliente.daMappa(Map<String, dynamic> mappa) => Cliente(
      mappa['ID'],
      mappa['FLG_PF'] == 1 ? true : false,
      mappa['NOMINATIVO'],
      mappa['P_IVA'],
      mappa['COD_FISCALE']);

  factory Cliente.daJson(Map<String, dynamic> mappa) => Cliente(
      mappa['idCliente'],
      mappa['flgPF'],
      mappa['nominativo'],
      mappa['partitaIva'],
      mappa['codFiscale']);

  @override
  String toString() {
    return 'Cliente{idCliente: $idCliente, flgPF: $flgPF, nominativo: $nominativo, partitaIva: $partitaIva, codFiscale: $codFiscale}';
  }
}
