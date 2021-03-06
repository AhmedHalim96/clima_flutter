import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:clima/screens/location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  void getLocationData() async {
    var data = await WeatherModel().getLocationWeather();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(weatherData: data)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 150.0,
          ),
        ),
      ),
    );
  }
}
