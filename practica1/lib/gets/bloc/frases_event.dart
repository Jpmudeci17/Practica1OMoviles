part of 'frases_bloc.dart';

@immutable
abstract class FrasesEvent extends Equatable{
  const FrasesEvent();
  @override
  List<Object> get props=>[];
}
class FrasesEventData extends FrasesEvent{

}