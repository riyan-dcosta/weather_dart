import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/repository/i_weather_repo.dart';
import '../controllers/weather_provider.dart';

@RoutePage()
class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  double temperature = 0.0;

  getPuneTemperature() async {
    final temp = await WeatherApi(WeatherRepo()).getTemperature();
    setState(() {
      temperature = temp?.temp ?? -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ElevatedButton(
              onPressed: getPuneTemperature,
              child: const Text("Get Temperature of Pune"),
            ),
            Text(temperature.toString()),
          ],
        ),
      ),
    );
  }
}
