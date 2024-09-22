import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() => runApp(const WeatherApp());

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherGeneral>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  useMaterial3: false,
                  appBarTheme: AppBarTheme(
                    color: getColorTheme(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.natureOfAir,
                    ),
                  ),
                ),
                debugShowCheckedModeBanner: false,
                home: const HomeView(),
              );
            },
          );
        },
      ),
    );
  }
}

MaterialColor getColorTheme(String? natureOfAir) {
  if (natureOfAir == null) {
    return Colors.blue;
  }

  switch (natureOfAir) {
    case "Clear":
    case "Sunny":
      return Colors.orange; // Warm and sunny

    case "Partly cloudy":
      return Colors.lightBlue; // Bright but slightly subdued

    case "Patchy light rain possible":
    case "Patchy light drizzle":
    case "Light drizzle":
      return Colors.lightGreen; // Light and refreshing
    case "Mist":
    case "Fog":
    case "Freezing fog":
    case "Patchy light rain":
    case "Light rain":
    case "Cloudy":
      return Colors.blueGrey; // Neutral and overcast

    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Overcast":
      return Colors.grey; // Dull and heavy cloud cover

    case "Patchy rain possible":
      return Colors.cyan; // Light rain, a touch of brightness

    case "Blowing snow":
    case "Blizzard":
    case "Thundery outbreaks possible":
    case "Patchy snow possible":
    case "Patchy sleet possible":
    case "Patchy freezing drizzle possible":
      return Colors.lime; // Soft and cold, but not severe

    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
      return Colors.blueGrey; // Steady and serious rainfall

    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
      return Colors.cyan; // Cold and sharp

    case "Light sleet showers":
    case "Moderate or heavy sleet showers":
    case "Light sleet":
    case "Moderate or heavy sleet":
      return Colors.teal; // Cold and wet

    case "Light rain shower":
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
    case "Patchy light snow":
    case "Light snow":
    case "Patchy moderate snow":
    case "Moderate snow":
      return Colors.lightBlue; // Gentle snowfall

    case "Ice pellets":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
    case "Light snow showers":
    case "Moderate or heavy snow showers":
    case "Patchy heavy snow":
    case "Heavy snow":
      return Colors.indigo; // Heavy and cold

    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
      return Colors.deepPurple; // Cold, snowy, and stormy

    default:
      return Colors.blue; // Default to a calm and cool blue
  }
}
