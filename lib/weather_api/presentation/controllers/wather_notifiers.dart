import 'package:freezed_annotation/freezed_annotation.dart';

part 'wather_notifiers.freezed.dart';
part 'wather_notifiers.g.dart';

@freezed
class WeatherProviderUpdates with _$WeatherProviderUpdates {
  factory WeatherProviderUpdates() = _WeatherProviderUpdates;

  const factory WeatherProviderUpdates.initial() = Initial;
  const factory WeatherProviderUpdates.loading() = Loading;
  const factory WeatherProviderUpdates.failure(String message) = Failure;
  const factory WeatherProviderUpdates.success(String message) = Success;

  factory WeatherProviderUpdates.fromJson(Map<String, dynamic> json) =>
      _$WeatherProviderUpdatesFromJson(json);
}
