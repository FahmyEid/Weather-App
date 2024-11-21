import 'package:weather/models/weather_model.dart';

class WeatherState{}
class NoWeatherState extends WeatherState{

}
class WeatherLoadedState extends WeatherState{
final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}
class WeatherFailureState extends WeatherState{
  var errmassage;

  WeatherFailureState(String string);

  
}