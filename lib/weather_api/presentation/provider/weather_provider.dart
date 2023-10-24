import 'package:dartz/dartz.dart';
import 'package:weather_dart/weather_api/domain/entities/weather_model.dart';
import 'package:weather_dart/weather_api/domain/repository/i_weather_repo.dart';

class WeatherApi {
  final WeatherRepo _repo;

  WeatherApi(this._repo);

  Future<WeatherTemperature?> getTemperature() async {
    final temp = await _repo.getTemperature(location: '');

    final resp = temp.fold(
      (l) => l.when(serverException: () => null),
      (r) => WeatherTemperature(temp: r.temp),
    );

    return resp;
  }
}

// final hi = WeatherApi(WeatherRepo()).getTemperature();
