import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart';
import 'dart:typed_data';

part 'hora_event.dart';
part 'hora_state.dart';

final countryHrs = [
  "Europe/Andorra", 
  "America/Mexico_City", 
  "America/Lima", 
  "America/Argentina/Buenos_Aires", 
  "America/Toronto",
];


class HoraBloc extends Bloc<HoraEvent, HoraState> {
  HoraBloc() : super(HoraInitial()) {
    on<HoraEvent>((loadHora));
  }
    int i =1;
    void loadHora(HoraEvent event, Emitter emit) async {
      var horaget = await _getHora();
      if (horaget == null){
        emit(HoraError('No se encontro la imagen'));
      }
        else{
          
        var hora = horaget["datetime"].toString();
        var splitted = hora.split('T');
        var splitted2 = splitted[1].split('.');
        print(splitted2[0]);
        emit(HoraReady(hora:splitted2[0]));
      }
    }
    Future _getHora() async {
      String url = "http://worldtimeapi.org/api/timezone/${countryHrs[i]}";
      try {
        Response res = await get(Uri.parse(url));
        if(res.statusCode == HttpStatus.ok){
          // print(res.body);
          return jsonDecode(res.body);

        }
      } catch (e) {print(e);}
    }
}
