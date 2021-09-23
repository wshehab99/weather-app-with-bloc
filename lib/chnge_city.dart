import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_with_bloc/bloc/city_bloc.dart';
import 'package:weather_app_with_bloc/bloc/city_event.dart';
import 'package:weather_app_with_bloc/bloc/city_state.dart';
import './home.dart';
import './data/Constants.dart';
import 'bloc/WeatherBloc.dart';
import 'bloc/WeatherState.dart';
import 'data/remote/api_services.dart';

class Home extends StatelessWidget {
  ApiServices? _apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    CityBloc cityBloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather app"),
      ),
      body: Center(
        child: BlocBuilder<CityBloc, CityState>(
          builder: (context, state) => Column(
            children: [
              reusedDropDown(cityBloc),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
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
      ),
    );
  }

  Widget reusedDropDown(CityBloc cityBloc) {
    return DropdownButton<String>(
      value: Constants.cityNmae,
      icon: Icon(Icons.arrow_downward),
      items: Constants.cities
          .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ))
          .toList(),
      onChanged: (value) {
        Constants.cityNmae = value!;
        cityBloc.add(GetCity.CHANGE_CITY);
        print(Constants.cityNmae);
      },
    );
  }
}
