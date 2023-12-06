import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model_dto.freezed.dart';

@freezed
class WeatherApiModel with _$WeatherApiModel {
  const factory WeatherApiModel({
    required WeatherApiLocation location,
    required WeatherApiCurrent current,
  }) = _WeatherApiModel;
}

@freezed
class WeatherApiLocation with _$WeatherApiLocation {
  const factory WeatherApiLocation({
    required String name,
    required String region,
    required String country,
    required String lat,
    required String lon,
    required String tz_id,
    required String localtime_epoch,
    required String localtime,
  }) = _WeatherApiLocation;
}

@freezed
class WeatherApiCurrent with _$WeatherApiCurrent {
  const factory WeatherApiCurrent({
    required String temp_c,
    required WeatherApiCondition condition,
  }) = _WeatherApiCurrent;
}

@freezed
class WeatherApiCondition with _$WeatherApiCondition {
  const factory WeatherApiCondition() = _WeatherApiCondition;
}
