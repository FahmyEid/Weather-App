import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherServices {
  final dio = Dio();
  final String key = "bface1fad952472c96873002241708";
  final String baseUrl = "https://api.weatherapi.com/v1";
  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$key&q=$cityName&aqi=no&alerts=no');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data["error"]["message"] ??
          "oops there was an error try later";
      throw Exception(errMessage);
    }catch(e){
      log(e.toString());
      throw Exception("oops there was an error try later");
    }
  }
}
