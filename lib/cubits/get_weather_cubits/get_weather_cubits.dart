
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubits/get_weather_states.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_services.dart';

class GetWeatherCubits extends Cubit<WeatherState> {
  GetWeatherCubits() : super(NoWeatherState());
  WeatherModel? weatherModel;
  GetWeather({required String value}) async {
    try {
       weatherModel =
          await WeatherServices().getWeather(cityName: value);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
