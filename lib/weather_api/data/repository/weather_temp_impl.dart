import 'package:dartz/dartz.dart';
import 'package:weather_dart/weather_api/domain/entities/weather_model.dart';
import 'package:weather_dart/weather_api/domain/repository/i_weather_repo.dart';
import 'package:weather_dart/weather_api/domain/repository/weather_failures.dart';

class WeatherTemperatureRepository implements WeatherRepo {
  @override
  Future<Either<WeatherFailures, WeatherTemperature>> getTemperature(
      {required String location}) {
    /// 4exceotion
    return Future.value(right(const WeatherTemperature(temp: 30)));
  }
}
