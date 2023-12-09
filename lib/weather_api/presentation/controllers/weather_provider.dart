import 'package:dartz/dartz.dart';
import 'package:weather_dart/weather_api/domain/entities/weather_model.dart';
import 'package:weather_dart/weather_api/domain/repository/i_weather_repo.dart';
import 'package:riverpod/riverpod.dart';
import 'package:weather_dart/weather_api/presentation/controllers/wather_notifiers.dart';

final getTemperatureProvider = Provider((ref) {
  return WeatherApi(WeatherRepo()).getTemperature();
});

class WeatherApi {
  final WeatherRepo _repo;

  WeatherApi(this._repo);

  Future<Either<WeatherProviderUpdates,WeatherTemperature>> getTemperature() async {
    final temp = await _repo.getTemperature(location: '');

    final resp = temp.fold<Either<WeatherProviderUpdates,WeatherTemperature>>(
      (l) => l.when(serverException: () => const Failure("fail from weatherProviderUpdates")),
      (r) => WeatherTemperature(temp: r.temp),
    );

    return resp;
  }
}
