
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const apiKey = 'abb2d09d7e6f66edb7bd7ae85b13ed46';

class WeatherModel {

  Future<dynamic> getCityWeather(String userCityName) async{
    
    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?q=$userCityName&appid=$apiKey&units=metric') ;
    var weatherData =await networkHelper.getData();
    return weatherData;
  }
  Future<dynamic> getWeatherLocation() async {
      DeviceLocation location = DeviceLocation();
      await location.getCurrentLocation();
      NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
      var weatherData = await networkHelper.getData();
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
