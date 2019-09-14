import 'package:json_annotation/json_annotation.dart';
part 'banner_movie.g.dart';

@JsonSerializable()
class BannerMovie {
  String title;
  String backdropPath;

  BannerMovie({this.title, this.backdropPath});

  factory BannerMovie.fromJson(Map<String, dynamic> json) => _$BannerMovieFromJson(json);

  Map<String, dynamic> toJson() => _$BannerMovieToJson(this);

  @override
  String toString() {
    return 'BannerMovie{title: $title, backdropPath: $backdropPath}';
  }

}

