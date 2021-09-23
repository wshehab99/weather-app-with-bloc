import 'package:bloc/bloc.dart';
import '../bloc/WeatherEvent.dart';
import '../bloc/WeatherState.dart';
import '../data/Constants.dart';
import '../data/remote/api_services.dart';
import '../model/base_exception.dart';
import '../model/weather.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  ApiServices? _apiServices;

  WeatherBloc(WeatherState initialState, this._apiServices)
      : super(initialState);

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    switch (event) {
      case WeatherEvent.FETCH_WEATHER:
        try {
          WeatherResponse? weatherResponse =
              await _apiServices!.getWeather(Constants.cityNmae);
          yield SuccessWeatherState(weatherResponse);
        } catch (e) {
          yield ErrorWeatherState(BaseException(message: e.toString()));
        }
    }
  }
}
