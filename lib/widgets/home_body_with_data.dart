import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class HomeBodyWithData extends StatelessWidget {
  const HomeBodyWithData({
    required this.bodyColor,
    required this.weatherModel,
    super.key,
  });

  final WeatherModel weatherModel;
  final MaterialColor bodyColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            bodyColor,
            bodyColor[300]!,
            bodyColor[50]!,
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(weatherModel.image),
                const SizedBox(width: 50),
                Text(
                  "${weatherModel.avgTmp}",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 50),
                Column(
                  children: [
                    Text(
                      "maxTemp: ${weatherModel.maxTmp}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "minTemp: ${weatherModel.minTmp}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              weatherModel.natureOfAir,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
