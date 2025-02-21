import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() =>_WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  //api key
  final _WeatherService = WeatherService('8bb69ae44a4c4a6ee561250827959052');
  Weather? _weather;
  
  //fetch weather
  _fetchWeather() async{
    //get the current city
    String cityName = await _WeatherService.getCurrentCity();

    //get weather for city
    try {
      final weather = await _WeatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  //weather animations

  //init state 
  @override
  void initState() {
    super.initState();

    //fetch weather on startup
    _fetchWeather();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center (
        child: Column (
          mainAxisAlignment: MainAxisAlignment. center, 
          children: [
            // city name
            Text (_weather?.cityName ?? "loading city.."),
            // temperature
            Text ('${_weather?.temperature.round()}°C')
          ],
        ),
      ),
    );
  }
}