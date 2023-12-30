import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final String cityName;
  final String temperature;

  const WeatherEntity({required this.cityName, required this.temperature});

  @override
  List<Object> get props => [
        cityName,
        temperature,
      ];
}
