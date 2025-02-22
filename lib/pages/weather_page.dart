import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService('8bb69ae44a4c4a6ee561250827959052');
  Weather? _weather;
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = "";

  // Fetch weather by city name
  Future<void> _fetchWeather(String cityName) async {
    setState(() {
      _isLoading = true;
      _errorMessage = "";
    });

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = "Failed to fetch weather. Please try again.";
        _isLoading = false;
      });
    }
  }

  // Weather animation
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/sunny.json'; // Default to sunny

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloud.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/rain.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Search bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Enter city name",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    if (_searchController.text.isNotEmpty) {
                      _fetchWeather(_searchController.text);
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 20),

            // Loading indicator
            if (_isLoading) CircularProgressIndicator(color: Colors.white),

            // Error message
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),

            // Weather info
            if (_weather != null && !_isLoading && _errorMessage.isEmpty) ...[
              Text(
                _weather!.cityName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 10),

              // Weather animation
              Lottie.asset(getWeatherAnimation(_weather?.mainCondition), height: 150),

              // Temperature
              Text(
                '${_weather?.temperature.round()}°C',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),

              // Weather condition
              Text(
                _weather?.mainCondition ?? "",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
