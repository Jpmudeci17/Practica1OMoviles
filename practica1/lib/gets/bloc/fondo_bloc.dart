import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart';
import 'dart:typed_data';

part 'fondo_event.dart';
part 'fondo_state.dart';

class FondoBloc extends Bloc<FondoEvent, FondoState> {
  FondoBloc() : super(FondoInitial()) {
    on<FondoEvent>(loadFondo);
  }
  

  void loadFondo(FondoEvent event, Emitter emit) async {
      var fondoget = await _getFondo();
      // print(fondoget);
      if (fondoget == null){
        emit(FondoError('No se encontro la imagen'));
      }
        else{
        emit(FondoReady(fondo:fondoget));
      }
    }

  Future _getFondo() async {
    final seed = DateTime.now().second;
    final String url = "https://picsum.photos/seed/${seed}/200/300";
    try {
      Response res = await get(Uri.parse(url));
      if(res.statusCode == HttpStatus.ok){

        return res.bodyBytes;

      }
    } catch (e) {print(e);}
  }
}
