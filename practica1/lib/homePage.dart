import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:practica1/gets/bloc/fondo_bloc.dart';
import 'package:practica1/gets/bloc/frases_bloc.dart';
import 'package:practica1/gets/bloc/hora_bloc.dart';

class homePage extends StatefulWidget {
  homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int inde = 1;
  final nombresPaises = [
    "Andorra",
    "Mexico",
    "Peru",
    "Argentina",
    "Canada"
  ];

  final banderaPaises = [
    "ad.png", 
    "mx.png", 
    "pe.png", 
    "ar.png", 
    "ca.png",
  ];


  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
    appBar: BackdropAppBar(
      title: Text("Paises"),
      actions: <Widget>[
        BackdropToggleButton(
          icon: AnimatedIcons.list_view,
        )
      ],
    ),
    headerHeight: MediaQuery.of(context).size.height*0.6,
    backLayer: Container(
          height: MediaQuery.of(context).size.height * .5 * 0.75,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: banderaPaises.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network('https://flagcdn.com/16x12/${banderaPaises[index]}'),
                ),
                title: Text(nombresPaises[index], style: TextStyle(color: Colors.white),),
                onTap: () {
                  inde = index;
                  BlocProvider.of<HoraBloc>(context).i = index;
                  BlocProvider.of<HoraBloc>(context).add(HoraEventData());
                  BlocProvider.of<FondoBloc>(context).add(FondoEventData());
                  BlocProvider.of<FrasesBloc>(context).add(FrasesEventData());
                },
              );
            },
          ),
        ),
    frontLayer: Stack(
      children:<Widget>[
          BlocConsumer<FondoBloc, FondoState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if(state is FondoReady){
                return Stack(
                  children:[  
                      Image.memory(state.fondo,
                      height: MediaQuery.of(context).size.height - 80,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      
                        ),
                      Container(
                        color: Colors.black.withOpacity(0.50),
                        height: MediaQuery.of(context).size.height - 80,
                        width: MediaQuery.of(context).size.width,
                      ),
                        ]
                );
              }
              else if(state is FondoError){
                return Center(child: Text('se murio'),);
              }
              else{
                return Center(
                  child:  CircularProgressIndicator(),
                  
                );
              }
            },
          ),

          BlocConsumer<FrasesBloc, FrasesState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state1) {
              if(state1 is FrasesRady){
                return Padding(
                  padding: EdgeInsets.fromLTRB(9, 300, 9, 0),
                  child: Column(
                      children: [
                      Text(
                        state1.frase,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),
                        ),
                      Text(
                        '-${state1.autor}',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),)
                    ],
                    
                    ),
                );
                
              }
              else if(state1 is FrasesError){
                return Center(child: Text('se murio'),);
              }
              else{
                return Center(
                  child:  CircularProgressIndicator(),
                  
                );
              }
            },
          ),
          BlocConsumer<HoraBloc, HoraState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state2) {
              if(state2 is HoraReady){
                return Padding(
                  padding: EdgeInsets.fromLTRB(9, 100, 9, 0),
                  child: Center(
                    child: Column(
                      children: [
                        Text(state2.hora,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                          color: Colors.white,
                          fontSize: 50
                                ),),
                        Text(nombresPaises[inde],textAlign: TextAlign.right,
                          style: TextStyle(
                          color: Colors.white,
                          fontSize: 30
                                ),)
                      ],
                    ),
                  ),
                );
              }
              else if(state2 is HoraError){
                return Center(child: Text('se murio'),);
              }
              else{
                return Center(
                  child:  CircularProgressIndicator(),
                  
                );
              }
            },
          )
          
        ],
      
    )
  );
  }
}