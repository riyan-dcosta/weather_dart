import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_dart/data/models/weather_model.dart';
import 'package:weather_dart/domain/entities/weather.dart';

import '../../helpers/json_reader.dart';

void main() {
  const testWeatherModel = WeatherModel(cityName: 'New York', temperature: 3.3);
  test('should be a sub class of weather entity', () async {
    //assert
    expect(testWeatherModel, isA<WeatherEntity>());
  });

  test('should return a valid model from json', () async {
    //arrange
    final Map<String, dynamic> jsonMap =
        json.decode(readJson('helpers/dummy_data/response-current.json'));

    //act
    final result = WeatherModel.fromJson(jsonMap);

    //expect
    expect(result, equals(testWeatherModel));
  });

  test('should return a json map containing proper data', () async {
    //act
    final result = testWeatherModel.toJson();

    //assert
    final expectedJson = {
      "location": {
        "name": "New York",
      },
      "current": {
        "temp_c": 3.3,
      }
    };

    //expect
    expect(expectedJson, result);
  });
}
