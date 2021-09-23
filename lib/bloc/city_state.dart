import 'package:weather_app_with_bloc/data/Constants.dart';

class CityState {}

class ChangeCity extends CityState {
  ChangeCity.change() {
    print('changed');
  }
}

class initialCity extends CityState {
  initialCity.init() {
    Constants.cityNmae = Constants.cities[0];
  }
}
