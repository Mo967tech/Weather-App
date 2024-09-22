import 'package:weather_app/models/weather_model.dart';

class WeatherGeneral {}

class WeatherInitialState extends WeatherGeneral {}

class WeatherWithDataState extends WeatherGeneral {
  WeatherWithDataState({required this.weatherModel});
  final WeatherModel weatherModel;
}

class WeatherWithoutDataState extends WeatherGeneral {}

class WeatherErrorState extends WeatherGeneral {}
