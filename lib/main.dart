import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summer_iti_api_bloc/bloc/WeatherBloc.dart';
import 'package:summer_iti_api_bloc/bloc/WeatherState.dart';
import 'package:summer_iti_api_bloc/data/remote/api_services.dart';

import 'chnge_city.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
