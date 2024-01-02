import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_dart/domain/entities/weather.dart';
import 'package:weather_dart/domain/usecases/get_current_weather.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  GetCurrentWeatherUsecase getCurrentWeatherUsecase;
  MockWeatherRespository mockWeatherRespository;
  mockWeatherRespository = MockWeatherRespository();
  getCurrentWeatherUsecase = GetCurrentWeatherUsecase(mockWeatherRespository);

  const testWeatherDetail = WeatherEntity(
    cityName: 'New York',
    temperature: 50,
  );
  const testCityName = 'New York';

  test('should get current weather deatil form repository', () async {
    //arange
    when(mockWeatherRespository.getCurrentWeather(testCityName) as Function())
        .thenAnswer(
      (_) async => const Right(testWeatherDetail),
    );

    //act
    final result = await getCurrentWeatherUsecase.execute(testCityName);

    //assert
    expect(result, const Right(testWeatherDetail));
  });
}
