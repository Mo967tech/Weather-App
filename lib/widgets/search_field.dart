import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.0),
          child: TextField(
            keyboardType: TextInputType.text,
            onSubmitted: (String cityName) {
              GetWeatherCubit weatherCubit =
                  BlocProvider.of<GetWeatherCubit>(context);
              weatherCubit.getCurrentWeather(cityName);

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 10,
              ),
              suffixIcon: const Icon(
                Icons.search,
                color: Color(0xff9C9C9C),
              ),
              hintText: "Enter City Name",
              label: Text(
                "Search",
                style: TextStyle(
                  color: getColorTheme(BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.natureOfAir),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: getColorTheme(BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.natureOfAir),
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
