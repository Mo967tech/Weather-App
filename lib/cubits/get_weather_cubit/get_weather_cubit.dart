import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherGeneral> {
  GetWeatherCubit() : super(WeatherInitialState());

  WeatherModel? weatherModel;
  
  void getCurrentWeather(String cityName) async {
    try {
      weatherModel =
          await WeatherService(Dio()).getWeather(cityName: cityName);

      emit(WeatherWithDataState(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherErrorState());
    }
  }
}
