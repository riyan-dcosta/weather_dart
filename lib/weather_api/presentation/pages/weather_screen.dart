import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/remote/get_temperature.dart';
import '../../domain/repository/i_weather_repo.dart';
import '../controllers/weather_provider.dart';

@RoutePage()
class WeatherPage extends ConsumerStatefulWidget {
  const WeatherPage({super.key});

  @override
  ConsumerState<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends ConsumerState<WeatherPage> {
  double temperature = 0.0;

  getPuneTemperature() async {
    // final temp = await WeatherApi(WeatherRepo()).getTemperature();
    final respo = ref.read(getCurrentWeatherProvider)(
      queryParameter: "pune",
      showAQI: false,
    );
    print("resp $respo");
    setState(() {
      // temperature = temp.temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final refVal = ref.listen(getTemperatureProvider, () {}, (){});

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
