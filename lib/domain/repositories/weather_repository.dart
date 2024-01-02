import 'package:dartz/dartz.dart';
import 'package:weather_dart/core/error/failure.dart';
import 'package:weather_dart/domain/entities/weather.dart';

abstract class WeatherRespository {
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(String cityName);
}
