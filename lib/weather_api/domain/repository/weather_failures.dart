// import 'package:freezed/builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// part 'weather_failures.g.dart';
part 'weather_failures.freezed.dart';

@freezed
class WeatherFailures with _$WeatherFailures{

  const factory WeatherFailures.serverException() = _ServerException;
}