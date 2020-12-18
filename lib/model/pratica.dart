import 'package:equatable/equatable.dart';

class Pratica extends Equatable {
  final int idPratica;
  final int anno;
  final int progressivo;
  final String attivita;
  final String nominativo;
  final String ragioneSociale;

  Pratica(
    this.idPratica,
    this.anno,
    this.progressivo,
    this.attivita,
    this.nominativo,
    this.ragioneSociale,
  );

  @override
  List<Object> get props => [idPratica];
}
