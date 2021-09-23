import '../model/base_exception.dart';
import '../model/weather.dart';

class WeatherState {}

class LoadingWeatherState extends WeatherState {}

class ErrorWeatherState extends WeatherState {
  BaseException? baseException;
  ErrorWeatherState(this.baseException);
}

class SuccessWeatherState extends WeatherState {
  WeatherResponse? weatherResponse;
  SuccessWeatherState(this.weatherResponse);
}
