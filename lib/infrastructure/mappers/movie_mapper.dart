import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper{
  static Movie movieDBToEntity(MovieMovieDB movieDB) => Movie(
    adult: movieDB.adult,
    backdropPath: movieDB.backdropPath,
    genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
    id: movieDB.id,
    originalLanguage: movieDB.originalLanguage,
    originalTitle: movieDB.originalLanguage,
    overview: movieDB.overview,
    popularity: movieDB.popularity,
    posterPath: movieDB.posterPath,
    releaseDate: movieDB.releaseDate,
    title: movieDB.title,
    video: movieDB.video,
    voteAverage: movieDB.voteAverage,
    voteCount: movieDB.voteCount
  );
}