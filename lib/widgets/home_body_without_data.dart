import 'package:flutter/material.dart';

class HomeBodyWithoutData extends StatelessWidget {
  const HomeBodyWithoutData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "there is no weather 😔 start",
            style: TextStyle(fontSize: 30),
          ),
          Text(
            "searching now 🔍",
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
