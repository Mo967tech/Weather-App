class WeatherModel {
  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.image,
      required this.avgTmp,
      required this.maxTmp,
      required this.minTmp,
      required this.natureOfAir});

  String cityName, natureOfAir, image;
  DateTime date;
  int avgTmp, minTmp, maxTmp;

  factory WeatherModel.fromJson(json) => WeatherModel(
        cityName: json["location"]["name"],
        date: DateTime.parse(json["current"]["last_updated"]),
        image: "${json["current"]["condition"]["icon"]}".contains("https")
            ? json["current"]["condition"]["icon"]
            : "https:${json["current"]["condition"]["icon"]}",
        avgTmp: (json["forecast"]["forecastday"][0]["day"]["avgtemp_c"]).round(),
        maxTmp: (json["forecast"]["forecastday"][0]["day"]["maxtemp_c"]).round(),
        minTmp: (json["forecast"]["forecastday"][0]["day"]["mintemp_c"]).round(),
        natureOfAir: json["current"]["condition"]["text"],
      );
}
