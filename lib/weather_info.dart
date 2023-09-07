import 'package:flutter/material.dart';
import 'main.dart';

class Show_weather extends StatelessWidget {
  const Show_weather({super.key});

  @override
  Widget build(BuildContext context) {
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
                const Text(
                  '30\u00B0C',
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Min : 26",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Image.network(
                      "https://cdn.weatherapi.com/weather/64x64/day/176.png",
                      width: 100,
                      height: 120,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Text(
                      "Max : 34",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const Text(
                  "Patchy rain possible",
                  style: TextStyle(
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
                      child: const Column(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Align children in the center vertically
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "UV",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "8",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500),
                            )
                          ]),
                    ),
                  ],
                ),
                SizedBox(
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
