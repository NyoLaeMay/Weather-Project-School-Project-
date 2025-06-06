import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:week12_sec130_weather_project/utility/MyStyle.dart';
import 'package:week12_sec130_weather_project/weather.dart';
//import 'package:week12_sec130_weather_project/signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(
      const Duration(seconds: 1),
          () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const weatherPage()),
        );
      },
    );
  }

  @override
  void dispose(){
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFBE9E7), Color(0xFFBBDEFB)],
          ),
        ),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyStyle().myLogo(),
                MyStyle().mySpace(),
                MyStyle().showTextHeader('Rangsit University'),
              ],
            ),
          //),
        ),
      ),
    );
  }
}
