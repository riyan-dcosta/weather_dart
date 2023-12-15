import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather_dart/core/config/router/app_router.gr.dart';
import 'package:weather_dart/core/utils/design_pattern/weatherButton.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  showWeatherApi() {
    context.pushRoute(const WeatherRoute());
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mqData = MediaQuery.of(context);
    print("dpr : ${mqData.devicePixelRatio}");
    print(" reso : ${mqData.size}");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather API Home"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 200,
            width: double.infinity,
            child: WeatherButtonOneLeaf(
              text: 'Hello there',
            ),
          ),
          ElevatedButton(
              onPressed: showWeatherApi,
              child: const Text("Show Weather "
                  "API"))
        ],
      ),
    );
  }
}
