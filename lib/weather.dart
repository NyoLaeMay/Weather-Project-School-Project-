import 'dart:convert';
// import 'dart:html';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:week12_sec130_weather_project/utility/MyStyle.dart';


class weatherPage extends StatefulWidget {
  const weatherPage({super.key});

  @override
  State<weatherPage> createState() => _weatherPageState();
}

class _weatherPageState extends State<weatherPage> {
  String _cityName = "Pathum Thani";
  double _lon = 0.0;
  double _temp = 0.0;

  double _humidity = 0.0;
  double _windSpeed = 0.0;
  double _pressure = 0.0;
  double _tempMin = 0.0;
  double _tempMax = 0.0;
  String _main = "";
  String _formattedDate = "";
  String _iconCode = "10d";

  Future<void> getWeatherDetails() async {
    String url = "https://api.openweathermap.org/data/2.5/weather?q=$_cityName&appid=23897bc67bb14abc2b93a0a064184d3b";
    try {
      Response response = await Dio().get(url);
      Map<String, dynamic> result = json.decode(response.toString());
      setState(() {
        _lon = result['coord']['lon'];
        _temp = result['main']['temp'] - 273.15;
        _humidity = result['main']['humidity'];
        _windSpeed = result['wind']['speed'] * 3.6;
        _pressure = result['main']['pressure'];
        _tempMin = result['main']['temp_min'] - 273.15;
        _tempMax = result['main']['temp_max'] - 273.15;
        _main = result['weather'][0]['main'];
        _formattedDate = _getFormattedDate();
        _iconCode = result['weather'][0]['icon'];
      });
      print(response.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  String _getFormattedDate() {
    DateTime now = DateTime.now();
    return DateFormat('EEEE, d, yyyy').format(now);
  }

  @override
  void initState() {
    super.initState();
    getWeatherDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MyStyle().showTitle("Weather"),
        actions: [
          PopupMenuButton<int>(
            onSelected: (item) {
              setState(() {
                if (item == 0) {
                  _cityName = "Pathum Thani";
                } else if (item == 1) {
                  _cityName = "Bangkok";
                } else if (item == 2) {
                  _cityName = "Phuket";
                } else if (item == 3) {
                  _cityName = "London";
                } else if (item == 4) {
                  _cityName = "Taipei";
                } else if (item == 5) {
                  _cityName = "Beijing";
                }
                getWeatherDetails();
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem<int>(
                value: 0,
                child: Text("Pathum Thani"),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text("Bangkok"),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text("Phuket"),
              ),
              const PopupMenuItem<int>(
                value: 3,
                child: Text("London"),
              ),
              const PopupMenuItem<int>(
                value: 4,
                child: Text("Taipei"),
              ),
              const PopupMenuItem<int>(
                value: 5,
                child: Text("Beijing"),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: 400.0,
          height: 800.0,
          decoration: MyStyle().colorBG2(),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: 350.0,
              height: 700.0,
              decoration: MyStyle().colorBG2(),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _cityName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _formattedDate,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  MyStyle().mySpace(),
                  MyStyle().mySpace(),
                  MyStyle().mySpace(),
                  Container(
                    width: 350.0,
                    height: 180.0,
                    decoration: MyStyle().colorBG(),
                    child: Stack(
                      fit: StackFit.expand,
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -45,
                          left: 25,
                          child: Image.network(
                              "https://openweathermap.org/img/wn/${_iconCode.toString()}@2x.png"),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "${_temp.toStringAsFixed(2)}\u2103   ",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 45,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              _main,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  MyStyle().mySpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          MyStyle().showTextTitle("LOW"),
                          MyStyle().low_temp(),
                          MyStyle().showSmallText(
                              '${_tempMin.toStringAsFixed(2)} \u2103'),
                        ],
                      ),
                      MyStyle().myWidth(),
                      const SizedBox(width: 25),
                      Column(
                        children: [
                          MyStyle().showTextTitle("HIGH"),
                          MyStyle().high_temp(),
                          MyStyle().showSmallText(
                              '${_tempMax.toStringAsFixed(2)} \u2103'),
                        ],
                      ),
                    ],
                  ),
                  MyStyle().mySpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          MyStyle().showTextTitle("WIND SPEED"),
                          MyStyle().wind(),
                          MyStyle().showSmallText(
                              '${_windSpeed.toStringAsFixed(2)} Km/h'),
                        ],
                      ),
                      MyStyle().myWidth(),
                      Column(
                        children: [
                          MyStyle().showTextTitle("PRESSURE"),
                          MyStyle().pressure(),
                          MyStyle().showSmallText('$_pressure hPa'),
                        ],
                      ),
                      MyStyle().myWidth(),
                      Column(
                        children: [
                          MyStyle().showTextTitle("HUMIDITY"),
                          MyStyle().humidity(),
                          MyStyle().showSmallText(
                              '${_humidity.toStringAsFixed(2)} %'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
