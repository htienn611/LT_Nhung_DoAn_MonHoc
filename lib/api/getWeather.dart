import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const apiKey = 'bd765f9a90be38b4cf8ae159f103d4ee';
const cityName = 'Ho Chi Minh City';

String encodeCityName(String cityName) {
  return Uri.encodeQueryComponent(cityName);
}

Future<Map<String, dynamic>> getWeather(String cityName) async {
  final encodedCityName = encodeCityName(cityName);
  final response = await http.get(
    Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=$encodedCityName&appid=$apiKey'),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Tải dữ liệu không thành công');
  }
}

Widget buildWeatherWidget(String cityName) {
  return FutureBuilder<Map<String, dynamic>>(
    future: getWeather(cityName),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      } else if (snapshot.hasError) {
        return Text('Lỗi: ${snapshot.error}');
      } else {
        final weatherData = snapshot.data;
        final temperature =
            (weatherData!['main']['temp'] - 273.15).toStringAsFixed(1);
        String weatherMain = weatherData['weather'][0]['main'];
        String imageUrl;
        if (weatherMain.trim().toLowerCase().contains('clouds')) {
          imageUrl = 'assets/img/cloud.png';
        } else if (weatherMain.trim().toLowerCase().contains('rain')) {
          imageUrl = 'assets/img/rain.png';
        } else {
          imageUrl = 'assets/img/sun.png';
        }
       // print(imageUrl);
        return Column(
          children: [
            Container(padding: EdgeInsets.only(bottom: 10),
              child: Text(cityName, style: const TextStyle(fontSize: 18))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                     Icon(
                      Icons.thermostat_rounded,
                      color: double.parse(temperature) <20?Colors.blue:(double.parse(temperature)<26?Colors.amber:Colors.red),
                    ),
                    Text(
                      '$temperature °C',
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image(
                      width: 200,
                      image: AssetImage(imageUrl),
                      fit: BoxFit.fill,
                    ),
                  ],
                )
              ],
            ),
          ],
        );
      }
    },
  );
}
