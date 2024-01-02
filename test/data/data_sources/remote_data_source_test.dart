import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:weather_dart/core/error/failure.dart';

import 'package:weather_dart/core/network/wheather_api.dart';
import 'package:weather_dart/data/data_sources/remote_data_source.dart';
import 'package:weather_dart/data/models/weather_model.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late WeatherRemoteDataSourceImpl weatherRemoteDataSourceImpl;

  const cityName = "New York";
  setUp(() {
    mockHttpClient = MockHttpClient();
    weatherRemoteDataSourceImpl =
        WeatherRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get current weather', () {
    test('should return weather model when response code in 200', () async {
      //arange
      when(mockHttpClient
              .get(Uri.parse(WeatherApiUrl.currentWeatherByName(cityName))))
          .thenAnswer((_) async => http.Response(
              readJson('helpers/dummy_data/response-current.json'), 200));
      //act
      final result =
          await weatherRemoteDataSourceImpl.getCurrentWeather(cityName);

      //assert
      expect(result, isA<WeatherModel>());
    });
    test('should return server exception when response code is not 200',
        () async {
      //arange
      when(mockHttpClient
              .get(Uri.parse(WeatherApiUrl.currentWeatherByName(cityName))))
          .thenAnswer((_) async => http.Response("Not Found", 404));

      //act
      final result =
          await weatherRemoteDataSourceImpl.getCurrentWeather(cityName);

      //assert
      expect(result, throwsA(isA<ServerFailure>()));
    });
  });
}
