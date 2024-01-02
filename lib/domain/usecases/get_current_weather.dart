import 'package:dartz/dartz.dart';
import 'package:weather_dart/core/error/failure.dart';
import 'package:weather_dart/domain/entities/weather.dart';
import 'package:weather_dart/domain/repositories/weather_repository.dart';

class GetCurrentWeatherUsecase {
  final WeatherRespository weatherRespository;
  GetCurrentWeatherUsecase(this.weatherRespository);

  Future<Either<Failure, WeatherEntity>> execute(String cityName) {
    return weatherRespository.getCurrentWeather(cityName);
  }
}
