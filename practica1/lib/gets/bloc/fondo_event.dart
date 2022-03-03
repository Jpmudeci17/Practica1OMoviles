part of 'fondo_bloc.dart';

@immutable
abstract class FondoEvent extends Equatable{
  const FondoEvent();
  @override
  List<Object> get props=>[];
}
class FondoEventData extends FondoEvent{

}
