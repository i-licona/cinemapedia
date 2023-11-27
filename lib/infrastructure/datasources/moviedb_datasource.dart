import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasources.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:dio/dio.dart';

import '../models/moviedb/moviedb_response.dart';

class MoviedbDataSource extends MoviesDatasource{
  
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.apiKey,
        'language': Environment.language
      }
    )
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    // http request
    final response = await dio.get('/movie/now_playing');
    // get response from json
    final movieDBResponse = MovieDbResponse.fromJson(response.data);
    // map response to Movie entity
    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster')
    .map((moviedb) =>
      MovieMapper.movieDBToEntity(moviedb)
    ).toList(); 
    // return list of movies
    return movies;
  }
}