part of 'hora_bloc.dart';

@immutable
abstract class HoraEvent extends Equatable{
  const HoraEvent();
  @override
  List<Object> get props=>[];
}
class HoraEventData extends HoraEvent{

}