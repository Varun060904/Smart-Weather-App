import 'package:flutter/material.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Show_weather extends StatefulWidget {
  const Show_weather({super.key});

  @override
  State<Show_weather> createState() => _Show_weatherState();
}

class _Show_weatherState extends State<Show_weather> {
  Map<String, dynamic> weatherData = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://api.weatherapi.com/v1/forecast.json?key=e10fc4558c3344f188444159230709&q=chennai&days=1&aqi=yes&alerts=yes'));

    if (response.statusCode == 200) {
      setState(() {
        weatherData = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentWeather = weatherData['current'];
    final location = weatherData['location'];
    final forecast = weatherData['forecast'];
    final dailyforecast = forecast['forecastday'][0]['day'];
    final hourlyforecast = forecast['forecastday'][0]['hour'];
    String icon ="https:${dailyforecast['condition']['icon']}";


    final String receivedString =
        ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(receivedString),
        centerTitle: true,
      ),
      body: Center(
        child: (Column(children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10.0)),
            height: 300,
            width: 350,
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                 Text('${currentWeather['temp_c']}°C',
                  style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                     Text(
                      "${dailyforecast['mintemp_c']}°C",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Image.network(
                      icon,
                      width: 100,
                      height: 120,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                        '${dailyforecast['maxtemp_c']}°C',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                 Text(
                   '${dailyforecast['condition']['text']}',
                  style: const TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 350,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: const LinearGradient(
                colors: [
                  Colors.deepPurple,
                  Colors.white
                ], // Set the gradient colors
                begin: Alignment
                    .topCenter, // Set the starting point of the gradient
                end: Alignment
                    .bottomCenter, // Set the ending point of the gradient
                stops: [0.0, 1.0], // Set the stops for the gradient colors
                tileMode: TileMode.clamp, // Set the tiling mode (optional)
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 130,
                      width: 140,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.transparent),
                      child: const Column(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Align children in the center vertically
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "AQI",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "50",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500),
                            )
                          ]),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 130,
                      width: 140,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.transparent),
                      child:  Column(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Align children in the center vertically
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "UV",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${currentWeather['uv']}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500),
                            )
                          ]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 130,
                      width: 140,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.transparent),
                      child: const Column(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Align children in the center vertically
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Humidity (%)",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "65",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500),
                            )
                          ]),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 130,
                      width: 140,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.transparent),
                      child: const Column(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Align children in the center vertically
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Visibility (km)",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "12",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500),
                            )
                          ]),
                    ),
                  ],
                ),
              ],
            ),
          )
        ])),
      ),
    );
  }
}
