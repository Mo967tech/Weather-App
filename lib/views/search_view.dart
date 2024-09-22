import 'package:flutter/material.dart';
import 'package:weather_app/widgets/search_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search a City",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const SearchField(),
    );
  }
}
