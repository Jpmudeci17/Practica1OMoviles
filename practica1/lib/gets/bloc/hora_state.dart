part of 'hora_bloc.dart';

@immutable
abstract class HoraState extends Equatable{
  const HoraState();
  @override
  List<Object> get props=>[];
}

class HoraInitial extends HoraState {}

class HoraReady extends HoraState{
  final String hora;

  HoraReady({required this.hora});

  @override
  List<Object> get props => [hora];

}
class HoraError extends HoraState {
  final String errMsg;

  HoraError(this.errMsg);

  @override
  List<Object> get props => [errMsg];
}