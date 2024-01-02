import 'package:weather_dart/domain/entities/weather.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel({required super.cityName, required super.temperature});
  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        cityName: json['location']['name'],
        temperature: json['current']['temp_c'],
      );

  Map<String, dynamic> toJson() => {
        "location": {
          "name": cityName,
        },
        "current": {
          "temp_c": temperature,
        }
      };
}
