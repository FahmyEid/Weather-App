import 'package:flutter/material.dart';
import 'package:weather/cubits/get_weather_cubits/get_weather_cubits.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        title: const Text(
          "Search a city",
        ),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubits =BlocProvider.of<GetWeatherCubits>(context);
                  getWeatherCubits.GetWeather(value: value);
                  Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              labelText: "Search",
              suffixIcon: const Icon(Icons.search),
              hintText: "Enter City Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            )),
      )),
    );
  }
}