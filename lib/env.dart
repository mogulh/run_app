import 'package:flutter/material.dart';

const BASEURL = "http://192.168.42.48:8000/";

class Pallete {
  static const priColor = Color(0xFF721b1b);
  static const secColor = Color(0xFF1B7272);
  static const priAccent = Color(0xFFd85a5a);

  static const LinearGradient bgColor =
      LinearGradient(colors: [Colors.white, priAccent]);
}
