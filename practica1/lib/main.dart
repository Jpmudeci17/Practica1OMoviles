import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practica1/gets/bloc/hora_bloc.dart';
import 'package:practica1/homePage.dart';
import 'package:practica1/gets/bloc/fondo_bloc.dart';
import 'package:practica1/gets/bloc/frases_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => FondoBloc()..add(FondoEventData()),
            ),
            BlocProvider(
              create: (context) => FrasesBloc()..add(FrasesEventData()),
            ),
            BlocProvider(
              create: (context) => HoraBloc()..add(HoraEventData()),
            ),
          ],
          child: homePage(),
        ),
        
        );
  }
}
