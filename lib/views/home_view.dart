import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit_states.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/views/error_message_view.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/home_body_with_data.dart';
import 'package:weather_app/widgets/home_body_without_data.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchView(),
                ),
              );
            },
            icon: const Icon(Icons.search, color: Colors.white),
          )
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherGeneral>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const HomeBodyWithoutData();
          } else if (state is WeatherWithDataState) {
            return HomeBodyWithData(
              bodyColor: getColorTheme(state.weatherModel.natureOfAir),
              weatherModel: state.weatherModel,
            );
          } else {
            return const ErrorMessageView();
          }
        },
      ),
    );
  }
}
