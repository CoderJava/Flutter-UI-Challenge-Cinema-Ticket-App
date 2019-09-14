import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_ui_cinemax/res/color_app.dart';
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
                BackdropImage(bannerMovie.backdropPath),
                _buildWidgetAppBar(mediaQuery, context),
                _buildWidgetFloatingActionButton(mediaQuery),
                _buildWidgetIconBuyAndShare(mediaQuery),
              ],
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildWidgetTitleMovie(context),
                  SizedBox(height: 4.0),
                  _buildWidgetGenreMovie(context),
                  SizedBox(height: 16.0),
                  _buildWidgetRating(),
                  SizedBox(height: 16.0),
                  _buildWidgetShortDescriptionMovie(context),
                  SizedBox(height: 16.0),
                  _buildWidgetSynopsisMovie(context),
                  SizedBox(height: 16.0),
                  _buildWidgetScreenshots(mediaQuery, context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetAppBar(MediaQueryData mediaQuery, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        top: mediaQuery.padding.top == 0 ? 16.0 : mediaQuery.padding.top + 8.0,
        right: 16.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
              color: Colors.white,
            ),
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

  Widget _buildWidgetFloatingActionButton(MediaQueryData mediaQuery) {
    return Column(
      children: <Widget>[
        SizedBox(height: mediaQuery.size.height / 2 - 60),
        Center(
          child: FloatingActionButton(
            onPressed: () {
              // TODO: do something in here
            },
            child: Icon(
              Icons.play_arrow,
              color: ColorApp.primaryDarkColor,
              size: 32.0,
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildWidgetIconBuyAndShare(MediaQueryData mediaQuery) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: mediaQuery.size.height / 2 - 40,
          ),
          Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.add),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.share),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetTitleMovie(BuildContext context) {
    return Center(
      child: Text(
        'Angel Has Fallen',
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget _buildWidgetGenreMovie(BuildContext context) {
    return Center(
      child: Text(
        'Action',
        style: Theme.of(context).textTheme.subtitle.merge(
              TextStyle(color: Colors.grey),
            ),
      ),
    );
  }

  Widget _buildWidgetRating() {
    return Center(
      child: RatingBar(
        initialRating: 4.0,
        itemCount: 5,
        allowHalfRating: true,
        direction: Axis.horizontal,
        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
        itemBuilder: (BuildContext context, int index) {
          return Icon(
            Icons.star,
            color: ColorApp.primaryDarkColor,
          );
        },
        tapOnlyMode: true,
        itemSize: 24.0,
        unratedColor: Colors.black,
        onRatingUpdate: (rating) {
          /* Nothing to do in here */
        },
      ),
    );
  }

  Widget _buildWidgetShortDescriptionMovie(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Country\n',
                  style: Theme.of(context).textTheme.subtitle.merge(
                        TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                ),
                TextSpan(
                  text: 'USA',
                  style: Theme.of(context).textTheme.subtitle.merge(
                        TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                ),
              ],
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Year\n',
                  style: Theme.of(context).textTheme.subtitle.merge(
                        TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                ),
                TextSpan(
                  text: '2018',
                  style: Theme.of(context).textTheme.subtitle.merge(
                        TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                ),
              ],
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Lenght\n',
                  style: Theme.of(context).textTheme.subtitle.merge(
                        TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                ),
                TextSpan(
                  text: '112 min',
                  style: Theme.of(context).textTheme.subtitle.merge(
                        TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetSynopsisMovie(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: Text(
          'Secret Service Agent Mike Banning is framed for the attempted '
          'assassination of the President and must evade his own agency '
          'and the FBI as he tries to uncover the real threat.',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

  Widget _buildWidgetScreenshots(
      MediaQueryData mediaQuery, BuildContext context) {
    var listScreenshotsMovie = [
      'assets/images/screenshot_1_backdrop_path.jpeg',
      'assets/images/screenshot_2_backdrop_path.jpeg',
      'assets/images/screenshot_3_backdrop_path.jpeg',
      'assets/images/screenshot_4_backdrop_path.jpeg',
      'assets/images/screenshot_5_backdrop_path.jpeg',
    ];
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  'Screenshots',
                  style: Theme.of(context).textTheme.subhead.merge(
                        TextStyle(fontWeight: FontWeight.bold),
                      ),
                ),
              ),
              Icon(Icons.chevron_right),
            ],
          ),
        ),
        SizedBox(height: 8.0),
        Container(
          width: mediaQuery.size.width,
          height: 100.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: index == listScreenshotsMovie.length - 1 ? 16.0 : 0.0,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    listScreenshotsMovie[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            itemCount: listScreenshotsMovie.length,
          ),
        ),
      ],
    );
  }
}

class BackdropImage extends StatelessWidget {
  final String backdropPath;

  BackdropImage(this.backdropPath);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return ClipPath(
      child: Image.asset(
        backdropPath,
        height: mediaQuery.size.height / 2,
        width: mediaQuery.size.width,
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
    return true;
  }
}
