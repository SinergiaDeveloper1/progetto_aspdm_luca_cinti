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

  /*factory Pratica.daJson(Map<String, dynamic> mappa) => Pratica(
      mappa['idPratica'],
      mappa['flgPF'],
      mappa['anno'],
      mappa['progressivo'],
      mappa['attivita'],
      mappa['nominativo']);*/

  @override
  String toString() {
    return 'Pratica{idPratica: $idPratica, flgPF: $flgPF, anno: $anno, progressivo: $progressivo, attivita: $attivita, nominativo: $nominativo}';
  }
}
