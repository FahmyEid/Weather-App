import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubits/get_weather_cubits.dart';
import 'package:weather/cubits/get_weather_cubits/get_weather_states.dart';

import 'package:weather/views/search_view.dart';
import 'package:weather/widgets/nowather_body.dart';
import 'package:weather/widgets/weather_info.dart';

class Home_View extends StatefulWidget {
  const Home_View({
    super.key,
  });

  @override
  State<Home_View> createState() => _Home_ViewState();
}

class _Home_ViewState extends State<Home_View> {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          
        ),
     
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchView()));
              },
              icon: const Icon(
                Icons.search,
               
                size: 30,
              ))
        ],
      ),
      body: BlocBuilder<GetWeatherCubits, WeatherState>(
        builder: (context, state) {
          if (state is NoWeatherState) {
            return NoweatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfo(
             
            );
          } else {
            return Center(child: Text("oops there was an error"));
          }
        },
      ),
    );
  }
}
