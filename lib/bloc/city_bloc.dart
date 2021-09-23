import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:weather_app_with_bloc/bloc/city_event.dart';
import 'package:weather_app_with_bloc/bloc/city_state.dart';

class CityBloc extends Bloc<GetCity, CityState> {
  CityBloc(CityState initialState) : super(initialState);

  @override
  Stream<CityState> mapEventToState(GetCity event) async* {
    switch (event) {
      case GetCity.CHANGE_CITY:
        yield ChangeCity.change();
    }
  }
}
