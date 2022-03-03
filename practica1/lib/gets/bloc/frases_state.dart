part of 'frases_bloc.dart';

@immutable
abstract class FrasesState extends Equatable{
  const FrasesState();
  @override
  List<Object> get props=>[];
}

class FrasesInitial extends FrasesState {}

class FrasesRady extends FrasesState{
  final String frase;
  final String autor;
  FrasesRady({required this.frase, required this.autor});

  @override
  List<Object> get props => [frase];
}
class FrasesError extends FrasesState {
  final String errMsg;

  FrasesError(this.errMsg);

  @override
  List<Object> get props => [errMsg];
}