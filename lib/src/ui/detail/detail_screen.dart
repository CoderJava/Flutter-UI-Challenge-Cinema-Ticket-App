import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_cinemax/src/model/banner/banner_movie.dart';

class DetailScreen extends StatelessWidget {
  final BannerMovie bannerMovie;

  DetailScreen(this.bannerMovie);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          bottom:
              mediaQuery.padding.bottom == 0 ? 16.0 : mediaQuery.padding.bottom,
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                WavyHeaderImage(bannerMovie.backdropPath),
                _buildWidgetAppBar(mediaQuery),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetAppBar(MediaQueryData mediaQuery) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        top: mediaQuery.padding.top == 0 ? 16.0 : mediaQuery.padding.top,
        right: 16.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
            color: Colors.white,
          ),
          Expanded(
            child: Image.asset(
              'assets/images/img_netflix_logo.png',
              height: 20.0,
            ),
          ),
          Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class WavyHeaderImage extends StatelessWidget {
  final String backdropPath;

  WavyHeaderImage(this.backdropPath);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return ClipPath(
      child: Image.asset(
        backdropPath,
        height: mediaQuery.size.height / 2,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      clipper: BottomWaveClipper(),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 70.0);

    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 70.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, size.height - 70.0);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
