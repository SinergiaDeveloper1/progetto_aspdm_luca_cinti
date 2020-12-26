import 'package:equatable/equatable.dart';

class Pratica extends Equatable {
  final int idPratica;
  final bool flgPF;
  final int anno;
  final int progressivo;
  final String attivita;
  final String nominativo;

  Pratica(
    this.idPratica,
    this.flgPF,
    this.anno,
    this.progressivo,
    this.attivita,
    this.nominativo,
  );

  @override
  List<Object> get props => [idPratica];

  factory Pratica.daMappa(Map<String, dynamic> mappa) => Pratica(
      mappa['ID_PRATICA'],
      mappa['FLG_PF'] == 1 ? true : false,
      mappa['ANNO'],
      mappa['PROGRESSIVO'],
      mappa['DES_ATTIVITA'],
      mappa['NOMINATIVO']);

}
