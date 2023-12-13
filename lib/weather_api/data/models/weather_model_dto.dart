import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model_dto.freezed.dart';
part 'weather_model_dto.g.dart';

@freezed
class WeatherApiModelDto with _$WeatherApiModelDto {
  const factory WeatherApiModelDto({
    required WeatherApiLocationDto location,
    required WeatherApiCurrentDto current,
  }) = _WeatherApiModelDto;

  factory WeatherApiModelDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherApiModelDtoFromJson(json);
}

@freezed
class WeatherApiLocationDto with _$WeatherApiLocationDto {
  const factory WeatherApiLocationDto({
    required String name,
    required String region,
    required String country,
    required String lat,
    required String lon,
    required String tz_id,
    required String localtime_epoch,
    required String localtime,
  }) = _WeatherApiLocationDto;

  factory WeatherApiLocationDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherApiLocationDtoFromJson(json);
}

@freezed
class WeatherApiCurrentDto with _$WeatherApiCurrentDto {
  const factory WeatherApiCurrentDto({
    required String temp_c,
    required WeatherApiConditionDto condition,
  }) = _WeatherApiCurrentDto;

  factory WeatherApiCurrentDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherApiCurrentDtoFromJson(json);
}

@freezed
class WeatherApiConditionDto with _$WeatherApiConditionDto {
  factory WeatherApiConditionDto() = _WeatherApiConditionDto;

  factory WeatherApiConditionDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherApiConditionDtoFromJson(json);
}
