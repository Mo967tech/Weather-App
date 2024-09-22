import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final String key = "5fbcc3cd3fed417d9a9191716241108";
  final String baseUrl = "http://api.weatherapi.com/v1";
  final Dio dio;
  WeatherService(this.dio);

  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get("$baseUrl/forecast.json?key=$key&q=$cityName&days=1");
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
