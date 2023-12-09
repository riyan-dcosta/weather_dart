import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:weather_dart/weather_api/data/repository/weather_temp_impl.dart';
import 'package:weather_dart/weather_api/domain/entities/weather_model.dart';
import 'package:weather_dart/weather_api/domain/repository/weather_failures.dart';
import 'package:riverpod/riverpod.dart';

abstract class WeatherRepo {
  factory WeatherRepo() => WeatherTemperatureRepository();

  Future<Either<WeatherFailures, WeatherTemperature>> getTemperature(
      {required String location});
}
