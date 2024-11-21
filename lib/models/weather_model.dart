class WeatherModel {
  final String cityName;
  final String state;
  final DateTime date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String image;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.image,
      required this.cityName,
      required this.state});
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        date:DateTime.parse( json["current"]["last_updated"],),
        temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
        cityName: json["location"]["name"],
        state: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
        );
  }
  
}
