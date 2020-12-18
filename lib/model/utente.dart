import 'package:equatable/equatable.dart';

class Utente extends Equatable {
  final String userName;
  final String passWord;

  Utente(
    this.userName,
    this.passWord,
  );

  @override
  List<Object> get props => [userName, passWord];
}
