import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubits/get_weather_cubits.dart';
import 'package:weather/models/weather_model.dart';

class WeatherInfo extends StatelessWidget {
   const WeatherInfo({super.key, });

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel= BlocProvider.of<GetWeatherCubits>(context).weatherModel!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style:const  TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
         const SizedBox(height: 40,width: double.infinity,),
          Text(
            "updated at : ${weatherModel.date.hour} :${weatherModel.date.minute}",
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40,width: double.infinity,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network("https:${weatherModel.image}"),
              
             const SizedBox(width: 40,),
              Text(weatherModel.temp.toString(),style:const TextStyle(
                color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),),
           const   SizedBox(width: 30,),
             Column(
                children: [
                  Row(
                    children: [
                     const Text("Maxtemp"),
                      Text(weatherModel.minTemp.toString()),
                    ],
                  ),
                  Row(
                    children: [const Text("Maxtemp"), Text(weatherModel.maxTemp.toString())],
                  )
                ],
              )
            ],
          ),
        const   SizedBox(height: 40,width: double.infinity,),
          Text(weatherModel.state,style:const  TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
