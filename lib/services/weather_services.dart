import 'dart:convert';

import 'package:weather_app/model/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/services/location_services.dart';

class WeatherServices {
  // https://api.openweathermap.org/data/2.5/weather?q={city name}&appid=28bebe4c11032e53cd08afcf1e579b2b&units=metric

  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  WeatherServices({required this.apiKey});

  // get the weather from the city

  Future<Weather> getWeather(String cityName) async {
    try {
      final url = '$BASE_URL?q=$cityName&appid=$apiKey&units=metric';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Weather.fromJson(json);
      } else {
        throw Exception("Faild to load");
      }
    } catch (error) {
      throw Exception("Faild to load");
    }
  }

  //get the weather current location



  Future<Weather> getWeatherFromLocation() async {
    try {
      final GetLocationServices location = GetLocationServices();
      final cityName = await location.getCityName();

      final url = '$BASE_URL?q=$cityName&appid=$apiKey&units=metric';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Weather.fromJson(json);
      } else {
        throw Exception("Faild to load");
      }
    } catch (e) {
      print(e.toString());
      throw Exception("Faild to load");
    }
  }
}
