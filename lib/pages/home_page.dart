import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _weatherService = WeatherServices(apiKey: dotenv.env["API_KEY"] ?? "" );
  Weather? _weather;

  void fetchWeather () async {
    try{
      final weather = await _weatherService.getWeatherFromLocation();
      setState(() {
        _weather= weather;
      });
    }catch(error){
      print("Error from weather data :$error");
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("hey"),
    );
  }
}