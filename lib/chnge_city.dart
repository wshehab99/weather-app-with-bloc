import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summer_iti_api_bloc/home.dart';
import './data/Constants.dart';
import 'bloc/WeatherBloc.dart';
import 'bloc/WeatherState.dart';
import 'data/remote/api_services.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List<String> cities = ['New York', 'Cairo', 'San Francisco', 'Almansourah'];
  ApiServices? _apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather app"),
      ),
      body: Center(
        child: Column(
          children: [
            reusedDropDown(),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BlocProvider(
                      create: (context) => WeatherBloc(
                        LoadingWeatherState(),
                        _apiServices,
                      ),
                      child: MyHomePage(),
                    );
                  }));
                },
                child: Text('GO'))
          ],
        ),
      ),
    );
  }

  Widget reusedDropDown() {
    return DropdownButton<String>(
      value: Constants.cityNmae,
      icon: Icon(Icons.arrow_downward),
      items: cities
          .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          Constants.cityNmae = value!;
        });
        print(Constants.cityNmae);
      },
    );
  }
}
