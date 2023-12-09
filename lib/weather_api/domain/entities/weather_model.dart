import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';

@freezed
class WeatherTemperature with _$WeatherTemperature {
  const factory WeatherTemperature({required double temp}) =
      _WeatherTemperature;
}
