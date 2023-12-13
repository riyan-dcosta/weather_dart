import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../../../network/wheather_api.dart';

final getCurrentWeatherProvider = Provider<GetCurrentWeather>((ref) {
  return GetCurrentWeather(ref);
});

class GetCurrentWeather {
  GetCurrentWeather(this.ref);
  final ProviderRef ref;
  Future<void> call(
      {required String queryParameter, required bool showAQI}) async {
    final url =
        Uri.https(WeatherApiUrl.weatherApi, WeatherApiUrl.currentWeather);
    final Map<String, String> headers = {
      "q": queryParameter,
      "aqi": showAQI ? "yes" : "no",
      "key": WeatherApiUrl.weatherApiKey,
    };
    print("header $headers");
    final response = await http.get(url, headers: headers);
    // response.
    log("getCurrentWeatherAPI : ${response}");
  }
}
