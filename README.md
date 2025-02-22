# Weather App

Weather App 🌤️
A simple Flutter-based Weather App that allows users to check the weather of any city by searching for its name. The app fetches real-time weather data from OpenWeatherMap and displays temperature, conditions, and animations based on the weather.

## Features 🚀
- Search for weather by city or country
- Display real-time temperature and weather conditions
- Animated weather effects using Lottie
- Error handling for invalid searches
- Simple and intuitive UI

## Technologies Used 🛠️
- **Flutter** for UI development
- **Dart** as the programming language
- **OpenWeather API** for weather data
- **Lottie** for animations

#How It Works 🛠️
- The app retrieves the city name (entered manually or via location services).
- It sends a request to the OpenWeatherMap API.
- The API returns weather data, which is processed by the WeatherService class.
- The weather data is mapped to a WeatherModel.
- The UI updates with temperature, conditions, and animations.

## Installation 📥
1. Clone this repository:
   ```sh
   git clone https://github.com/vimethc/weather-app.git
   ```
2. Navigate to the project directory:
   ```sh
   cd weather-app
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the app:
   ```sh
   flutter run
   ```

## API Configuration
1. Sign up at [OpenWeather](https://openweathermap.org/) and get your API key.
2. Add your API key in the `WeatherService` class:
   ```dart
   final _weatherService = WeatherService('YOUR_API_KEY');
   ```

## Contributing 🤝
Contributions are welcome! Feel free to submit a pull request or open an issue for improvements.

## License 📜
This project is licensed under the **MIT License**.

## Contact
For any inquiries, reach out via:
- GitHub: [(https://github.com/vimethc)](https://github.com/vimethc)
- Email: vimethc@gmail.com


##✅ workflow diagram to illustrate the app's functionality.
<img width="695" alt="Screenshot 2025-02-21 at 8 33 51 AM" src="https://github.com/user-attachments/assets/f82cb0b5-e76b-4191-952e-c04edaaa6a69" />

