import 'package:flutter/material.dart';

class MyStyle {
  SizedBox myLogo() {
    return SizedBox(
      width: 100.0,
      child: Image.asset('images/rsu.png'),
    );
  }

  SizedBox cloudy(){
    return SizedBox(
      width:100.0,
      height: 100.0,
      child: Image.asset('images/cloudy.png'),
    );
  }

  SizedBox high_temp(){
    return SizedBox(
      width:30.0,
      height: 30.0,
      child: Image.asset('images/high_temp.png'),
    );
  }

  SizedBox humidity(){
    return SizedBox(
      width:30.0,
      height: 30.0,
      child: Image.asset('images/humidity.png'),
    );
  }

  SizedBox low_temp(){
    return SizedBox(
      width:30.0,
      height: 30.0,
      child: Image.asset('images/low_temp.png'),
    );
  }

  SizedBox pressure(){
    return SizedBox(
      width:30.0,
      height: 30.0,
      child: Image.asset('images/pressure.png'),
    );
  }

  SizedBox rain(){
    return SizedBox(
      width:30.0,
      height: 30.0,
      child: Image.asset('images/rain.png'),
    );
  }

  SizedBox wind(){
    return SizedBox(
      width:30.0,
      height: 30.0,
      child: Image.asset('images/wind.png'),
    );
  }


  Text showTextTitle(String strTitle) =>
      Text(
        strTitle,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black,
        ),
      );

  Text showTextHeader(String strHeader) {
    return Text(
      strHeader,
      style: const TextStyle(
        fontSize: 25,
        color: Colors.pink,
      ),
    );
  }

  Text showTitle(String strTitle) {
    return Text(
      strTitle,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: Colors.blue,
      ),
    );
  }

  Text showSmallText(String strText)
  {
    return Text(
      strText,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
        color: Colors.black,
      ),
    );
  }

  SizedBox mySpace() {
    return const SizedBox(
      height: 30,
    );
  }

  SizedBox myWidth() {
    return const SizedBox(
      width: 14,
    );
  }

  BoxDecoration colorBG() {
    return const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xb3ffe4e1), Color(0xb38ab9f1)],
      ),
    );
  }

  BoxDecoration colorBG2() {
    return const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFFBE9E7), Color(0xFFBBDEFB)],
      ),
    );
  }
}
