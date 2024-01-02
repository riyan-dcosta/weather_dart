import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:weather_dart/domain/repositories/weather_repository.dart';

@GenerateMocks(
  [
    WeatherRespository,
  ],
  customMocks: [
    MockSpec<http.Client>(as: #MockHttpClient),
  ],
)
void main() {}
