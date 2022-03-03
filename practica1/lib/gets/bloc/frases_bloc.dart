import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart';
import 'dart:typed_data';

part 'frases_event.dart';
part 'frases_state.dart';

class FrasesBloc extends Bloc<FrasesEvent, FrasesState> {
  FrasesBloc() : super(FrasesInitial()) {
    on<FrasesEvent>(loadFrase);
  }
  void loadFrase(FrasesEvent event, Emitter emit) async{
    var frase = await _getFrase();
    print(frase[0]['q']);
    emit(FrasesRady(frase:frase[0]['q'],autor:frase[0]['a']));
  }
  Future _getFrase() async {
    final String url = "https://zenquotes.io/api/random";
    try {
      Response res = await get(Uri.parse(url));
      if(res.statusCode == HttpStatus.ok){
        return jsonDecode(res.body);

      }
    } catch (e) {print(e);}
  }
}
