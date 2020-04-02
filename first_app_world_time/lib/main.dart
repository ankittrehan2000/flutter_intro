import 'package:flutter/material.dart';
import 'package:firstappworldtime/pages/home.dart';
import 'package:firstappworldtime/Pages/loading.dart';
import 'package:firstappworldtime/Pages/choose_location.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation()
  }
));

