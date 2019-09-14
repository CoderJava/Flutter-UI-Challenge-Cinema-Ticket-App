import 'package:flutter/material.dart';
import 'package:flutter_ui_cinemax/res/color_app.dart';
import 'package:flutter_ui_cinemax/src/model/banner/banner_movie.dart';
import 'package:flutter_ui_cinemax/src/model/category/category.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: mediaQuery.padding.top == 0 ? 16.0 : 0,
          ),
          child: Column(
            children: <Widget>[
              _buildWidgetAppBar(),
              SizedBox(height: 20.0),
              _buildWidgetBanner(mediaQuery),
              SizedBox(height: 20.0),
              _buildWidgetCategories(mediaQuery),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWidgetAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.menu),
          Expanded(
            child: Image.asset(
              'assets/images/img_netflix_logo.png',
              height: 20.0,
            ),
          ),
          Icon(Icons.search),
        ],
      ),
    );
  }

  Widget _buildWidgetBanner(MediaQueryData mediaQuery) {
    var listBanner = [
      BannerMovie(
          title: 'Angel Has Fallen',
          backdropPath: 'assets/images/angel_has_fallen_backdrop_path.jpeg'),
      BannerMovie(
          title: 'Dark Phoenix',
          backdropPath: 'assets/images/dark_phoenix_backdrop_path.jpeg'),
      BannerMovie(
        title: 'Fast & Furios Presents: Hobbs & Shaw',
        backdropPath:
            'assets/images/fast_and_furious_presents_hobbs_and_shaw_backdrop_path.jpeg',
      ),
      BannerMovie(
        title: 'It Chapter Two',
        backdropPath: 'assets/images/it_chapter_two_backdrop_path.jpeg',
      ),
      BannerMovie(
        title: 'John Wick Chapter 3 Parabellum',
        backdropPath:
            'assets/images/john_wick_chapter_3_parabellum_backdrop_path.jpeg',
      ),
      BannerMovie(
        title: 'Spider-Man: Far From Home',
        backdropPath:
            'assets/images/spider_man_far_from_home_backdrop_path.jpeg',
      ),
      BannerMovie(
        title: 'The Old Man & the Gun',
        backdropPath:
            'assets/images/the_old_man_and_the_gun_backdrop_path.jpeg',
      ),
    ];
    return SizedBox(
      width: mediaQuery.size.width,
      height: 200.0,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.90, initialPage: 500),
        itemBuilder: (BuildContext context, int index) {
          var bannerMovie = listBanner[index % 7];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                  image: AssetImage(bannerMovie.backdropPath),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Opacity(
                    opacity: 0.3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 16.0,
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        bannerMovie.title,
                        style: Theme.of(context).textTheme.title.merge(
                              TextStyle(
                                color: Colors.white,
                              ),
                            ),
                        maxLines: 2,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: 700,
      ),
    );
  }

  Widget _buildWidgetCategories(MediaQueryData mediaQuery) {
    var listCategories = [
      Category(
          title: 'Top Rated',
          backdropPath: 'assets/images/top_rated_backdrop_path.jpeg'),
      Category(
          title: 'Upcoming',
          backdropPath: 'assets/images/upcoming_backdrop_path.jpeg'),
      Category(
          title: 'Now Playing',
          backdropPath: 'assets/images/now_playing_backdrop_path.jpeg'),
      Category(
          title: 'Popular',
          backdropPath: 'assets/images/popular_backdrop_path.jpeg'),
    ];
    return Container(
      width: mediaQuery.size.width,
      height: 60.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          var category = listCategories[index];
          return Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: index == listCategories.length - 1 ? 16.0 : 0.0,
            ),
            child: Container(
              width: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                image: DecorationImage(
                  image: AssetImage(
                    category.backdropPath,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Opacity(
                    opacity: 0.8,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: ColorApp.primaryDarkColor,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      category.title.toUpperCase(),
                      style: Theme.of(context).textTheme.body1.merge(
                            TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: listCategories.length,
      ),
    );
  }
}
