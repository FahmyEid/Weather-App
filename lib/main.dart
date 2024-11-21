import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubits/get_weather_cubits.dart';
import 'package:weather/services/weather_services.dart';
import 'package:weather/views/home_view.dart';

void main() {
  runApp(MyApp());
  WeatherServices().getWeather(cityName: 'cairo');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubits(),
      child: Builder(
        builder: (context) {
          return MaterialApp(
              theme: ThemeData(
                  primarySwatch: getThemeColor(
                BlocProvider.of<GetWeatherCubits>(context).weatherModel?.state,
              )),
              debugShowCheckedModeBanner: false,
              home: Home_View());
        }
      ),
    );
  }


  MaterialColor getThemeColor(String? condition) {
    if(condition==null){
      return Colors.blue;
    }
    switch (condition) {
      case "Sunny":
        return Colors.orange;
      case "Partly cloudy":
        return Colors.blueGrey;
      case "Cloudy":
        return Colors.grey;
      case "Overcast":
        return Colors.blueGrey;
      case "Mist":
        return Colors.lightBlue;
      case "Patchy rain possible":
      case "Patchy light rain":
      case "Light rain":
      case "Moderate rain at times":
      case "Moderate rain":
      case "Heavy rain at times":
      case "Heavy rain":
        return Colors.blue;
      case "Patchy snow possible":
      case "Patchy light snow":
      case "Light snow":
      case "Patchy moderate snow":
      case "Moderate snow":
      case "Patchy heavy snow":
      case "Heavy snow":
        return Colors.blue;
      case "Patchy sleet possible":
      case "Light sleet":
      case "Moderate or heavy sleet":
      case "Light sleet showers":
      case "Moderate or heavy sleet showers":
        return Colors.grey;
      case "Patchy freezing drizzle possible":
      case "Freezing drizzle":
      case "Heavy freezing drizzle":
      case "Light freezing rain":
      case "Moderate or heavy freezing rain":
        return Colors.blueGrey;
      case "Blowing snow":
      case "Blizzard":
        return Colors.blue;
      case "Fog":
      case "Freezing fog":
        return Colors.grey;
      case "Ice pellets":
      case "Light showers of ice pellets":
      case "Moderate or heavy showers of ice pellets":
        return Colors.grey;
      case "Thundery outbreaks possible":
      case "Patchy light rain with thunder":
      case "Moderate or heavy rain with thunder":
      case "Patchy light snow with thunder":
      case "Moderate or heavy snow with thunder":
        return Colors.deepPurple;
      default:
        return Colors.grey;
    }
  }
}
