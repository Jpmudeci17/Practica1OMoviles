part of 'fondo_bloc.dart';

@immutable
abstract class FondoState  extends Equatable{
  const FondoState();
  @override
  List<Object> get props=>[];
}

class FondoInitial extends FondoState {}

class FondoReady extends FondoState {
  final Uint8List fondo;
  FondoReady({required this.fondo});

  @override
  List<Object> get props => [fondo];
}

class FondoError extends FondoState {
  final String errMsg;

  FondoError(this.errMsg);

  @override
  List<Object> get props => [errMsg];
}

