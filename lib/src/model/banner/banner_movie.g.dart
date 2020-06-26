// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerMovie _$BannerMovieFromJson(Map<String, dynamic> json) {
  return BannerMovie(
    title: json['title'] as String,
    backdropPath: json['backdropPath'] as String,
  );
}

Map<String, dynamic> _$BannerMovieToJson(BannerMovie instance) =>
    <String, dynamic>{
      'title': instance.title,
      'backdropPath': instance.backdropPath,
    };
