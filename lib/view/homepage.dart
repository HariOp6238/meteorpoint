import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:intl/intl.dart';
import 'package:meteorpoint/view/others/privacy.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:weather/weather.dart';

const apikey =
    'ea6ca3ee6d58442868c973ccc9ec895f'; //********Open weather api key*********//

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final WeatherFactory wf = WeatherFactory(apikey);
  double lat = 0.0;
  double long = 0.0;
  int? code = 0;

  Weather? _weather;
  @override
  void initState() {
    _requestLocationPermission();
    _getcurrentlocation();
    super.initState();
    wf.currentWeatherByLocation(lat, long).then((value) {
      //********accessing the current weather by current location********//

      setState(() {
        _weather = value;
        code = _weather!
            .weatherConditionCode; //********using weather package weather codition code is assigned to a varaible code*********//
      });
    });
  }

  String locationtext = 'Location: N/A';

  weathericon() {
    //********using weather condtion code  switching icons in center *********//

    switch (code!) {
      case >= 200 && < 300:
        return Image.asset(
          'assets/1.png',
        );
      case >= 300 && < 400:
        return Image.asset(
          'assets/2.png',
        );
      case >= 500 && < 600:
        return Image.asset(
          'assets/3.png',
        );
      case >= 600 && < 700:
        return Image.asset(
          'assets/4.png',
        );
      case >= 700 && < 800:
        return Image.asset(
          'assets/5.png',
        );
      case == 800:
        return Image.asset(
          'assets/6.png',
        );
      case >= 800 && < 804:
        return Image.asset(
          'assets/7.png',
        );
      default:
        return Image.asset(
          'assets/7.png',
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, kToolbarHeight, 40, 20),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(3, -0.3),
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.deepPurple),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-3, -0.3),
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.deepPurple),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, -1.2),
                    child: Container(
                      height: 300,
                      width: 600,
                      decoration: const BoxDecoration(color: Color(0xFFFFAB40)),
                    ),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                    child: Container(
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " $locationtext📍",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Hello👋",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        weathericon(),
                        Center(
                            child: Text(
                          ' ${_weather?.temperature?.celsius?.toStringAsFixed(0)} °C',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        )),
                        Center(
                          child: Text(
                            _weather?.weatherDescription?.toUpperCase() ?? "",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Center(
                            child: Text(
                          DateFormat('EEE MMM d, yyyy h:mm a')
                              .format(DateTime.now()),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                        )),
                        const SizedBox(
                          height: 40,
                        ),
                        Wind(weather: _weather),
                        // sunrise_sunset(
                        //     weather:
                        //         _weather),
                        //*********** sunrise and sunset *************//
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        maxtemp_mintemp(weather: _weather),

                        //***************wind and humdidity*****************//
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Privacy(),
                                    ));
                              },
                              child: const Text(
                                'Privacy & Policy',
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> _requestLocationPermission() async {
    //********using geolocator package current location is accessed *********//

    final status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      _getcurrentlocation();
    } else {}
  }

  Future<void> _getcurrentlocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      // Extract latitude and longitude from the Position object

      setState(() {
        lat = position
            .latitude; //********assigned to a variable declared*********//

        long = position.longitude;
        locationtext = 'Location:${place.locality},${place.country}';
      });
    } catch (e) {
      print('Error Getting Location: $e');
    }
  }
}

class Wind extends StatelessWidget {
  const Wind({
    super.key,
    required Weather? weather,
  }) : _weather = weather;

  final Weather? _weather;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              "assets/9.png",
              scale: 8,
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Wind",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text('${_weather?.windSpeed?.toStringAsFixed(0)} M/S',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700))
              ],
            ),
          ],
        ),
        Row(
          children: [
            Image.asset(
              "assets/3.png",
              scale: 8,
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Humidity",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text("${_weather?.humidity?.toStringAsFixed(0)} %",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700))
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class maxtemp_mintemp extends StatelessWidget {
  const maxtemp_mintemp({
    super.key,
    required Weather? weather,
  }) : _weather = weather;

  final Weather? _weather;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              "assets/13.png",
              scale: 8,
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Max Temp",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(' ${_weather?.tempMax?.celsius?.toStringAsFixed(0)} °C',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700))
              ],
            ),
          ],
        ),
        Row(
          children: [
            Image.asset(
              "assets/14.png",
              scale: 8,
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Min Temp",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text('${_weather?.tempMin?.celsius?.toStringAsFixed(0)} °C',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700))
              ],
            ),
          ],
        ),
      ],
    );
  }
}

// class sunrise_sunset extends StatelessWidget {
//   const sunrise_sunset({
//     super.key,
//     required Weather? weather,
//   }) : _weather = weather;
//   final Weather? _weather;

//   @override
//   Widget build(BuildContext context) {
//     DateTime sunrise = _weather!.sunrise!;
//     DateTime sunset = _weather!.sunset!;

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             Image.asset(
//               "assets/11.png",
//               scale: 8,
//             ),
//             const SizedBox(
//               width: 5,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Sunrise",
//                   style: TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.w700),
//                 ),
//                 const SizedBox(
//                   height: 4,
//                 ),
//                 Text(DateFormat('h:mm a').format(sunrise),
//                     style: const TextStyle(
//                         color: Colors.white, fontWeight: FontWeight.w700))
//               ],
//             ),
//           ],
//         ),
//         Row(
//           children: [
//             Image.asset(
//               "assets/12.png",
//               scale: 8,
//             ),
//             const SizedBox(
//               width: 5,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "sunset",
//                   style: TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.w700),
//                 ),
//                 const SizedBox(
//                   height: 4,
//                 ),
//                 Text(DateFormat('h:mm a').format(sunset),
//                     style: const TextStyle(
//                         color: Colors.white, fontWeight: FontWeight.w700))
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
