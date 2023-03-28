import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apiKey = 'f565f2905cd9baa3426ddf9309223c1d';
const openWeatherMapURL = 'api.openweathermap.org';
const endPoint = '/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    Map<String, String> queryParameters = <String, String>{
      'q': cityName,
      'appid': apiKey,
      'units': 'metric'
    };
    NetworkHelper networkHelper =
        NetworkHelper(openWeatherMapURL, endPoint, queryParameters);
    var weatherData = networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    var queryParameters = <String, String>{};
    queryParameters['lat'] = location.latitude.toString();
    queryParameters['lon'] = location.longitude.toString();
    queryParameters['appid'] = apiKey;
    queryParameters['units'] = 'metric';
    NetworkHelper networkHelper =
        NetworkHelper(openWeatherMapURL, endPoint, queryParameters);
    var weatherData = networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
