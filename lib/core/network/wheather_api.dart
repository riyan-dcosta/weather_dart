class WeatherApiUrl {
  WeatherApiUrl._();
  static const weatherApiKey = 'f77eeb899bef4a1aabe44510232210';
  static const weatherApi = 'api.weatherapi.com';
  static const currentWeather = 'v1/current.json';
  // https://api.weatherapi.com/v1/current.json?q=new%20york&key=f77eeb899bef4a1aabe44510232210

  static const baseApi = 'https://api.weatherapi.com/v1/current.json';
  static String currentWeatherByName(String cityName) =>
      '$baseApi?q=$cityName&key=$weatherApiKey';
}
