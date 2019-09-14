import 'package:flutter/material.dart';
import 'package:flutter_ui_cinemax/res/color_app.dart';
import 'package:flutter_ui_cinemax/src/ui/home/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorApp.primaryColor,
        accentColor: ColorApp.accentColor,
      ),
      home: HomeScreen(),
    );
  }
}
